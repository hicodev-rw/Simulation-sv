`timescale 1ns/1ns

module ALU_TB;

  // Parameters
  parameter WIDTH = 32;

  // Signals
  logic [WIDTH-1:0] operandA;
  logic [WIDTH-1:0] operandB;
  logic [3:0] aluOp;
  logic [WIDTH-1:0] result;
  logic zeroFlag;
  logic carryOut;

  // Instantiate ALU
  ALU #(WIDTH) alu (
    .operandA(operandA),
    .operandB(operandB),
    .aluOp(aluOp),
    .result(result),
    .zeroFlag(zeroFlag),
    .carryOut(carryOut)
  );

  // Testbench Stimulus
  initial begin
    // Test ADD operation
    operandA = 32'h0000_0001;
    operandB = 32'h0000_0002;
    aluOp = 4'b0000; // ADD
    #1;
    $display("ADD result: 0x%h", result);

    // Test SUB operation
    operandA = 32'h0000_0004;
    operandB = 32'h0000_0002;
    aluOp = 4'b0001; // SUB
    #1;
    $display("SUB result: 0x%h", result);

    // Test AND operation
    operandA = 32'h0000_00FF;
    operandB = 32'h0000_FF00;
    aluOp = 4'b0010; // AND
    #1;
    $display("AND result: 0x%h", result);

    // Test OR operation
    operandA = 32'h0000_00FF;
    operandB = 32'h0000_FF00;
    aluOp = 4'b0011; // OR
    #1;
    $display("OR result: 0x%h", result);

    // Test XOR operation
    operandA = 32'h0000_00FF;
    operandB = 32'h0000_FF00;
    aluOp = 4'b0100; // XOR
    #1;
    $display("XOR result: 0x%h", result);

    // Test NOT operation
    operandA = 32'h0000_00FF;
    aluOp = 4'b0101; // NOT
    #1;
    $display("NOT result: 0x%h", result);

    // Test Shift Left operation
    operandA = 32'h0000_00FF;
    aluOp = 4'b0110; // Shift left
    #1;
    $display("Shift Left result: 0x%h", result);

    // Test Shift Right (arithmetic) operation
    operandA = 32'h8000_0000;
    aluOp = 4'b0111; // Shift right (arithmetic)
    #1;
    $display("Shift Right result: 0x%h", result);

    // Add more test cases as needed

    $stop; // End simulation
  end

endmodule

