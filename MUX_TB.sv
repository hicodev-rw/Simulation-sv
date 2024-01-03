`timescale 1ns/1ns

module Mux2to1_TB;

  // Parameters
  parameter WIDTH = 32;

  // Signals
  logic [WIDTH-1:0] data0;
  logic [WIDTH-1:0] data1;
  logic sel;
  logic [WIDTH-1:0] result;

  // Instantiate MUX
  Mux2to1 #(WIDTH) mux (
    .data0(data0),
    .data1(data1),
    .sel(sel),
    .result(result)
  );

  // Testbench Stimulus
  initial begin
    // Test case 1
    data0 = 32'h1234_5678;
    data1 = 32'h8765_4321;
    sel = 1'b0;
    #1;
    $display("MUX result: 0x%h", result);

    // Test case 2
    data0 = 32'h1111_2222;
    data1 = 32'h3333_4444;
    sel = 1'b1;
    #1;
    $display("MUX result: 0x%h", result);

    $stop; // End simulation
  end

endmodule

