module top
(
    input   wire [3:0]  i_dato                  , //! Dato de entrada
    input   wire [5:0]  i_operation             , //! Operación a realizar
    input   wire        i_sw                    , //! Selector: i_sw = 0 ----> Dato A || i_sw = 1 ----> Dato B
    output  wire [3:0]  o_leds                  , //! output
    input   wire        clk
);
localparam DATA = 4                             ;
localparam OP   = 6                             ;

/*

i_sw = 0 ----> Dato A
i_sw = 1 ----> Dato B

*/

wire [3:0] datoA                                ;
wire [3:0] datoB                                ;

if(!i_sw) begin
    assign datoA = i_dato                       ;
end else begin                      
    assign datoB = i_dato                       ;
end

//! ALU
alu u_alu
#(
    .NB_DATA(DATA)                              ,
    .NB_OP(OP)
)
(
    .i_datoA(datoA)                             ,
    .i_datoB(datoB)                             ,
    .i_operation(i_operation)                   ,
    .o_leds(o_leds)

);

endmodule