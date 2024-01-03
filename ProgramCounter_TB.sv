`timescale 1ns/1ns

module ProgramCounter_TB;

  // Parameters
  parameter WIDTH = 32;

  // Signals
  logic clk;
  logic rst;
  logic [WIDTH-1:0] input_data;
  logic enable;
  logic [WIDTH-1:0] output_data;

  // Instantiate Program Counter
  ProgramCounter #(WIDTH) pc (
    .clk(clk),
    .rst(rst),
    .input_data(input_data),
    .enable(enable),
    .output_data(output_data)
  );

  // Testbench Stimulus
  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    input_data = 32'h0000_0000;
    enable = 0;

    // Apply reset
    #10 rst = 0;

    // Test case 1
    #10 input_data = 32'h0000_0004;
    enable = 1;
    #10 enable = 0;
    $display("PC output: 0x%h", output_data);

    // Test case 2
    #10 input_data = 32'h0000_0010;
    enable = 1;
    #10 enable = 0;
    $display("PC output: 0x%h", output_data);

    // Add more test cases as needed

    $stop; // End simulation
  end

  // Clock generation
  always #5 clk = ~clk;

endmodule

