module top
(
    input   wire [3:0]  i_dato                  ,
    input   wire [5:0]  i_operation             ,
    input   wire        i_sw                    ,
    output  wire [3:0]  o_leds                  ,
    input   wire        clk
);

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

alu u_alu
(
    .i_datoA(datoA)                             ,
    .i_datoB(datoB)                             ,
    .i_operation(i_operation)                   ,
    .o_leds(o_leds)

);

endmodule