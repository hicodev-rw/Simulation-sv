`timescale 1ns/1ns

module Shifter_TB;

  // Parameters
  parameter WIDTH = 32;

  // Signals
  logic [WIDTH-1:0] input_data;
  logic [4:0] shift_amount;
  logic [WIDTH-1:0] left_shifted_data;
  logic [WIDTH-1:0] right_shifted_data;

  // Instantiate Left Shifter
  LeftShifter #(WIDTH) left_shifter (
    .input_data(input_data),
    .shift_amount(shift_amount),
    .shifted_data(left_shifted_data)
  );

  // Instantiate Right Shifter
  RightShifter #(WIDTH) right_shifter (
    .input_data(input_data),
    .shift_amount(shift_amount),
    .shifted_data(right_shifted_data)
  );

  // Testbench Stimulus
  initial begin
    // Test case 1 (left shift)
    input_data = 32'h1234_5678;
    shift_amount = 5;
    #1;
    $display("Left Shifted Data: 0x%h", left_shifted_data);

    // Test case 2 (right shift)
    shift_amount = 2;
    #1;
    $display("Right Shifted Data: 0x%h", right_shifted_data);

    // Add more test cases as needed

    $stop; // End simulation
  end

endmodule

