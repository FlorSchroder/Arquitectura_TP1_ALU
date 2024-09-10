`timescale 1ns / 1ps

module tb_alu;

    //reg             clk                                                 ;
    reg    [3:0]   i_datoA                                              ;
    reg    [3:0]   i_datoB                                              ;
    reg    [5:0]   i_operation                                          ;    
    wire   [3:0]   o_leds                                               ;

    alu u_alu
    (
//        .clk(clk)                               ,
        .i_datoA(i_datoA)                                               ,
        .i_datoB(i_datoB)                                               ,
        .i_operation(i_operation)                                       ,
        .o_leds(o_leds)             
    );

    //always #50 clk ~= clk;


    initial begin
        //clk = 0                                                         ;
        i_datoA = 4'h0                                                  ;
        i_datoB = 4'h0                                                  ;
        i_operation = 6'b000000                                         ;

        # 100

        i_datoA = 4'b0011                                               ;  // 3
        i_datoB = 4'b0101                                               ;  // 5
        i_operation = 6'b100000                                         ;  // OP_ADD
        #10;
        $display("ADD: %b + %b = %b", i_datoA, i_datoB, o_leds)         ;

    end

endmodule
