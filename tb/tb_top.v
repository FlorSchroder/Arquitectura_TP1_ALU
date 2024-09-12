`timescale 1ns / 1ps

module tb_top;

    reg signed [5:0] i_dato;
    reg [1:0]        i_sw;
    reg              i_rst_n;
    reg              clk;
    wire [3:0]       o_leds;

    // Instancia del módulo top
    top u_top (
        .i_dato(i_dato),
        .i_sw(i_sw),
        .i_rst_n(i_rst_n),
        .o_leds(o_leds),
        .clk(clk)
    );

    // Generador de clock
    always #5 clk = ~clk; // Periodo de clock de 10ns

    initial begin
        // Inicialización de señales
        clk = 0;
        i_rst_n = 0;
        i_sw = 2'b00;
        i_dato = 6'sb000000;

        // Secuencia de reseteo
        #10 i_rst_n = 1;

        // Test de carga de datoA
        i_sw = 2'b00;
        i_dato = 6'sb000011; // 3 en decimal
        #10;
        i_dato = 6'sb111101; // -3 en decimal
        #10;

        // Test de carga de datoB
        i_sw = 2'b01;
        i_dato = 6'sb000101; // 5 en decimal
        #10;
        i_dato = 6'sb111011; // -5 en decimal
        #10;

        // Test de carga de operación (OP_ADD)
        i_sw = 2'b10;
        i_dato = 6'b100000; // OP_ADD
        #10;
        $display("ADD: %d + %d = %d", u_top.datoA, u_top.datoB, o_leds);

        // Test de operación OP_SUB
        i_dato = 6'b100010; // OP_SUB
        #10;
        $display("SUB: %d - %d = %d", u_top.datoA, u_top.datoB, o_leds);

        // Test de operación OP_AND
        i_dato = 6'b100100; // OP_AND
        #10;
        $display("AND: %b & %b = %b", u_top.datoA, u_top.datoB, o_leds);

        // Test de operación OP_OR
        i_dato = 6'b100101; // OP_OR
        #10;
        $display("OR: %b | %b = %b", u_top.datoA, u_top.datoB, o_leds);

        // Test de operación OP_XOR
        i_dato = 6'b100110; // OP_XOR
        #10;
        $display("XOR: %b ^ %b = %b", u_top.datoA, u_top.datoB, o_leds);

        // Test de operación OP_SRA
        i_dato = 6'b000011; // OP_SRA
        #10;
        $display("SRA: %b >>> %b = %b", u_top.datoA, u_top.datoB, o_leds);

        // Test de operación OP_SRL
        i_dato = 6'b000010; // OP_SRL
        #10;
        $display("SRL: %b >> %b = %b", u_top.datoA, u_top.datoB, o_leds);

        // Test de operación OP_NOR
        i_dato = 6'b100111; // OP_NOR
        #10;
        $display("NOR: ~(%b | %b) = %b", u_top.datoA, u_top.datoB, o_leds);

        // Terminar simulación
        $finish;
    end

endmodule
