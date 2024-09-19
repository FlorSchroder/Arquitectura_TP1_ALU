module tb_top();

  reg signed [5:0]  i_dato                      ;
  reg        [1:0]  i_sw                        ;
  reg               i_rst_n                     ;
  wire       [3:0]  o_leds                      ;
  reg               i_soft_reset                ;
  reg               clk                         ;

  top uut (
    .i_dato      (i_dato)                       ,
    .i_sw        (i_sw)                         ,
    .i_rst_n     (i_rst_n)                      ,
    .o_leds      (o_leds)                       ,
    .i_soft_reset(i_soft_reset)                 ,
    .clk         (clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    i_rst_n      = 0                            ;
    i_soft_reset = 0                            ;
    i_sw         = 2'b00                        ;
    i_dato       = 6'b0                         ;

    // Apply reset
    #10 ;
    i_rst_n      = 1                            ;
    #10 ;
    i_rst_n      = 0                            ;
    #10 ;
    i_rst_n      = 1                            ;

    // Load datoA
    i_soft_reset = 1                            ;
    i_sw         = 2'b00                        ;
    i_dato       = 6'b0011                      ; // 3
    #10  ;
    i_soft_reset = 0                            ;
    #10  ;

    // Load datoB
    i_soft_reset = 1                            ;
    i_sw         = 2'b01                        ;
    i_dato       = 6'b0101                      ; // 5
    #10 ;
    i_soft_reset = 0                            ;
    #10 ;

    // Test each operation
    test_operation(6'b100000)                   ; // ADD
    test_operation(6'b100010)                   ; // SUB
    test_operation(6'b100100)                   ; // AND
    test_operation(6'b100101)                   ; // OR
    test_operation(6'b100110)                   ; // XOR
    test_operation(6'b000011)                   ; // SRA
    test_operation(6'b000010)                   ; // SRL
    test_operation(6'b100111)                   ; // NOR

    $stop;
  end

  task test_operation(input [5:0] op)           ;
    begin
      // Load operation
      i_soft_reset = 1                          ;
      i_sw         = 2'b10                      ;
      i_dato       = op                         ;
      #10  ;
      i_soft_reset = 0                          ;
      #10  ;
      
      // Wait for ALU to process the operation
      #20  ;
      
      // Display the results
      $display("datoA: %b, datoB: %b, operation: %b, o_leds: %b", uut.datoA, uut.datoB, op, o_leds);
    end
  endtask

endmodule
