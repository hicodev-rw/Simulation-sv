module ALU #(parameter WIDTH = 32)(
  input logic [WIDTH-1:0] operandA,
  input logic [WIDTH-1:0] operandB,
  input logic [3:0] aluOp, // 4-bit ALU operation code
  output logic [WIDTH-1:0] result,
  output logic zeroFlag,
  output logic carryOut
);
  always_comb begin
    case (aluOp)
      4'b0000: result = operandA + operandB; // ADD
      4'b0001: result = operandA - operandB; // SUB
      4'b0010: result = operandA & operandB; // AND
      4'b0011: result = operandA | operandB; // OR
      4'b0100: result = operandA ^ operandB; // XOR
      4'b0101: result = ~operandA; // NOT
      4'b0110: result = operandA << 1; // Shift left
      4'b0111: result = operandA >> 1; // Shift right (arithmetic)
      default: result = 32'h0000_0000; // Default value for invalid operation
    endcase

    zeroFlag = (result == 32'h0000_0000);
    carryOut = (aluOp == 4'b0110) ? operandA[WIDTH-1] : 1'b0; // For shift left, carryOut is the MSB of operandA
  end
endmodule