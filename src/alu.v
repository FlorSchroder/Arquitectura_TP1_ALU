
module alu
#(
    parameter NB_DATA   = 4,
    parameter NB_OP     = 6
)
(
//    input   wire            clk                                                                 ,
    input   wire    [NB_DATA-1:0]   i_datoA                                                     ,
    input   wire    [NB_DATA-1:0]   i_datoB                                                     ,
    input   wire    [NB_OP - 1:0]   i_operation                                                 ,    
    output  wire    [NB_DATA-1:0]   o_leds
);

    reg [3:0] result ;

    localparam [5:0]
        OP_ADD = 6'b100000                                                                      ,
        OP_SUB = 6'b100010                                                                      ,
        OP_AND = 6'b100100                                                                      ,
        OP_OR  = 6'b100101                                                                      ,
        OP_XOR = 6'b100110                                                                      ,
        OP_SRA = 6'b000011                                                                      ,
        OP_SRL = 6'b000010                                                                      ,
        OP_NOR = 6'b100111                                                                      ;


    always @(*) begin
        case(i_operation)
            OP_ADD: begin
                result = i_datoA + i_datoB                                                      ;
            end                                                     
            OP_SUB: begin                                                       
                result = i_datoA - i_datoB                                                      ;
            end                                         
            OP_AND: begin                                           
                result = i_datoA & i_datoB                                                      ;
            end                                         
            OP_OR: begin                                            
                result = i_datoA | i_datoB                                                      ;
            end                                         
            OP_XOR: begin                                           
                result = i_datoA ^ i_datoB                                                      ;
            end                                         
            OP_SRA: begin                                           
                result = i_datoA >>> i_datoB                                                    ;
            end                                         
            OP_SRL: begin                                           
                result = i_datoA >> i_datoB                                                     ;
            end                                         
            OP_NOR: begin                                           
                result = ~(i_datoA | i_datoB)                                                   ;
            end                                         
            default: begin                                          
                result = result                                                                 ;
            end
        endcase
    end


    assign o_leds = result;



    //always @(posedge clk ) <=
endmodule
