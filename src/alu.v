
module alu
#(
    parameter NB_DATA   = 4, //! BITs de datos y LEDs
    parameter NB_OP     = 6  //! BITs de operaciones
)
(
    //input   wire            clk                                                                 , //! clock
    //input   wire                    i_rst_n                                                     , //! Reset
    input   wire    signed [NB_DATA-1:0]   i_datoA                                              , //! Dato de entrada
    input   wire    signed [NB_DATA-1:0]   i_datoB                                              , //! Dato de entrada
    input   wire    [NB_OP - 1:0]   i_operation                                                 , //! Operación a realizar    
    output  wire    signed [NB_DATA-1:0]   o_leds                                                 //! output  
);

    reg signed [NB_DATA-1:0] result ; //! Resultado de la operación
    
    localparam [NB_OP-1:0] //! Operation cases
        OP_ADD = 6'b100000                                                                      , //! ADD operation
        OP_SUB = 6'b100010                                                                      , //! SUB operation
        OP_AND = 6'b100100                                                                      , //! AND operation
        OP_OR  = 6'b100101                                                                      , //! OR  operation
        OP_XOR = 6'b100110                                                                      , //! XOR operation
        OP_SRA = 6'b000011                                                                      , //! SRA operation (Shift Right Arithmetic)
        OP_SRL = 6'b000010                                                                      , //! SRL operation (Shift Right Logical)
        OP_NOR = 6'b100111                                                                      ; //! NOR operation


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

//    always @(posedge clk or negedge i_rst_n) begin
//        if (!i_rst_n) begin
//          result <= 6'b000000;
//        end
//    end

    assign o_leds = result;


    //always @(posedge clk ) <=
endmodule
