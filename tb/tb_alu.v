`timescale 1ns / 1ps

module tb_alu;

    //reg             clk                                                 ;
    //reg            i_rst_n                                              ;
    reg    signed [3:0]   i_datoA                                       ;
    reg    signed [3:0]   i_datoB                                       ;
    reg    [5:0]   i_operation                                          ; 
    reg                   i_valid                                       ;   
    wire   signed [3:0]   o_leds                                        ;

    alu 
    #(
        .ND_DATA(4)                                                     ,
        .NB_OP(6)
    )
     u_alu  
    (
        .i_valid(i_valid)                                               ,
        .i_datoA(i_datoA)                                               ,
        .i_datoB(i_datoB)                                               ,
        .i_operation(i_operation)                                       ,
        .o_leds(o_leds)             
    );

    //always #50 clk =~ clk;


    initial begin
        //clk = 0                                                         ;
        //i_rst_n =0                                                      ;
        # 10
        i_valid = 1'b0                                                  ;
        i_datoA = 4'sh0                                                 ;
        i_datoB = 4'sh0                                                 ;
        i_operation = 6'b000000                                         ;

        # 100
        i_valid = 1'b1                                                  ;
        i_datoA = 4'sb0011                                              ;  // 3
        i_datoB = 4'sb0101                                              ;  // 5
        i_operation = 6'sb100000                                        ;  // OP_ADD
        #10;
        $display("ADD: %b + %b = %b", i_datoA, i_datoB, o_leds)         ;

         // Test OP_SUB
        i_datoA = 4'sb0110                                              ;  // 6
        i_datoB = 4'sb0011                                              ;  // 3
        i_operation = 6'sb100010                                        ;  // OP_SUB
        #10;
        $display("SUB: %b - %b = %b", i_datoA, i_datoB, o_leds)         ;

        // Test OP_AND
        i_datoA = 4'sb1100                                              ;  // 12
        i_datoB = 4'sb1010                                              ;  // 10
        i_operation = 6'sb100100                                        ;  // OP_AND
        #10;
        $display("AND: %b & %b = %b", i_datoA, i_datoB, o_leds)         ;

        // Test OP_OR
        i_datoA = 4'sb1100                                              ;  // 12
        i_datoB = 4'sb1010                                              ;  // 10
        i_operation = 6'sb100101                                        ;  // OP_OR
        #10;
        $display("OR: %b | %b = %b", i_datoA, i_datoB, o_leds)          ;

        // Test OP_XOR
        i_datoA = 4'sb1100                                              ;  // 12
        i_datoB = 4'sb1010                                              ;  // 10
        i_operation = 6'sb100110                                        ;  // OP_XOR
        #10;
        $display("XOR: %b ^ %b = %b", i_datoA, i_datoB, o_leds)         ;

        // Test OP_SRA
        i_datoA = 4'sb1100                                              ;  // 12
        i_datoB = 4'sb0010                                              ;  // 2
        i_operation = 6'sb000011                                        ;  // OP_SRA
        #10;
        $display("SRA: %b >>> %b = %b", i_datoA, i_datoB, o_leds)       ;

        // Test OP_SRL
        i_datoA = 4'sb1100                                              ;  // 12
        i_datoB = 4'sb0001                                              ;  // 1
        i_operation = 6'sb000010                                        ;  // OP_SRL
        #10;
        $display("SRL: %b >> %b = %b", i_datoA, i_datoB, o_leds)        ;

        // Test OP_NOR
        i_datoA = 4'sb1100                                              ;  // 12
        i_datoB = 4'sb1010                                              ;  // 10
        i_operation = 6'sb100111                                        ;  // OP_NOR
        #10;
        $display("NOR: ~(%b | %b) = %b", i_datoA, i_datoB, o_leds)      ;

        // Finish simulation
        $finish;

    end

endmodule
