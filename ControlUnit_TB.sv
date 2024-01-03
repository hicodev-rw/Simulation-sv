`timescale 1ns/1ns

module ControlUnit_TB;

  // Signals
  logic [6:0] opcode;
  logic regWrite;
  logic [1:0] aluOp;
  logic memWrite;
  logic memRead;
  logic [2:0] regDst;

  // Instantiate Control Unit
  ControlUnit #(32) ctrl (
    .opcode(opcode),
    .regWrite(regWrite),
    .aluOp(aluOp),
    .memWrite(memWrite),
    .memRead(memRead),
    .regDst(regDst)
  );

  // Testbench Stimulus
  initial begin
    // Test R-type instruction (ADD)
    opcode = 7'b0000000;
    #1;
    $display("R-type instruction: regWrite=%b, aluOp=%b, memWrite=%b, memRead=%b, regDst=%b",
             regWrite, aluOp, memWrite, memRead, regDst);

    // Test LW instruction
    opcode = 7'b0001000;
    #1;
    $display("LW instruction: regWrite=%b, aluOp=%b, memWrite=%b, memRead=%b, regDst=%b",
             regWrite, aluOp, memWrite, memRead, regDst);

    // Test SW instruction
    opcode = 7'b0010000;
    #1;
    $display("SW instruction: regWrite=%b, aluOp=%b, memWrite=%b, memRead=%b, regDst=%b",
             regWrite, aluOp, memWrite, memRead, regDst);

    // Test unknown opcode
    opcode = 7'b1111111;
    #1;
    $display("Unknown opcode: regWrite=%b, aluOp=%b, memWrite=%b, memRead=%b, regDst=%b",
             regWrite, aluOp, memWrite, memRead, regDst);

    $stop; // End simulation
  end

endmodule

