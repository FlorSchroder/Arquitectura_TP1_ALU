module top
(
    input wire signed    [5:0]  i_dato                              , //! Dato de entrada
    input           wire [1:0]  i_sw                                , //! Selector: i_sw = 00 ----> Dato A ; i_sw = 01 ----> Dato B ; i_sw = 10 ----> Op
    input           wire        i_rst_n                             ,
    output          wire [3:0]  o_leds                              , //! output
    input           wire        i_soft_reset                        ,
    input           wire        clk
);

    localparam NB_DATA = 4                                          ;
    localparam NB_OP   = 6                                          ;
    
    //! ALU
    alu 
    #(
        .NB_DATA(NB_DATA)                                           ,
        .NB_OP(NB_OP)
    )
    u_alu
    (
        .i_valid(valid)                                             ,
        .i_datoA(datoA)                                             ,
        .i_datoB(datoB)                                             ,
        .i_operation(op)                                            ,
        .o_leds(o_leds)

    );
    /*

    i_sw = 00 ----> Dato A
    i_sw = 01 ----> Dato B
    i_sw = 10 ----> Op

    */
    reg                valid                                        ;
    reg [NB_DATA-1:0]  datoA                                        ;
    reg [NB_DATA-1:0]  datoB                                        ;
    reg [NB_OP - 1:0]    op                                         ;

    always @(posedge clk or negedge i_rst_n) begin 
        if(!i_rst_n) begin
            datoA <= 4'h0                                           ;
            datoB <= 4'h0                                           ;
            op    <= 6'h00                                          ;
        end else begin
            valid <= 0                                              ;
            if(i_soft_reset) begin
                if(i_sw == 2'b00) begin
                    datoA = i_dato[NB_DATA-1:0]                     ;
                end else if(i_sw == 2'b01) 
                begin                      
                    datoB = i_dato[NB_DATA-1:0]                     ;
                end else if (i_sw == 2'b10) begin       
                    op = i_dato                                     ;
                    valid <= 1                                      ;
                end
            end
        end
    end
    

    

endmodule