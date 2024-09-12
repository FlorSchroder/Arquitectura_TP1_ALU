module top
(
    input wire signed    [5:0]  i_dato                           , //! Dato de entrada
    //input   wire [5:0]  i_operation             , //! Operación a realizar
    input           wire [1:0]  i_sw                             , //! Selector: i_sw = 00 ----> Dato A ; i_sw = 01 ----> Dato B ; i_sw = 10 ----> Op
    input           wire        i_rst_n                          ,
    output          wire [3:0]  o_leds                           , //! output
    input           wire        clk
);

    localparam NB_DATA = 4                                       ;
    localparam NB_OP   = 6                                       ;

    /*

    i_sw = 00 ----> Dato A
    i_sw = 01 ----> Dato B
    i_sw = 10 ----> Op

    */

    reg [NB_DATA-1:0]  datoA                                    ;
    reg [NB_DATA-1:0]  datoB                                    ;
    reg [NB_OP - 1:0]    op                                     ;

    always @(posedge clk or negedge i_rst_n) begin 
        if(!i_rst_n) begin
            datoA <= 4'h0                                       ;
            datoB <= 4'h0                                       ;
            op    <= 6'h00                                      ;
        end else begin
            if(i_sw == 2'b00) begin
                datoA = i_dato[NB_DATA-1:0]                     ;
            end else if(i_sw == 2'b01) 
            begin                      
                datoB = i_dato[NB_DATA-1:0]                     ;
            end else if (i_sw == 2'b10) begin       
                op = i_dato                                     ;
            end
        end
    end
    

    //! ALU
    alu 
    #(
        .NB_DATA(NB_DATA)                                       ,
        .NB_OP(NB_OP)
    )
    u_alu
    (
        //.clk(clk)                                               ,
        //.i_rst_n(i_rst_n)                                       ,
        .i_datoA(datoA)                                         ,
        .i_datoB(datoB)                                         ,
        .i_operation(op)                                        ,
        .o_leds(o_leds)

    );

endmodule