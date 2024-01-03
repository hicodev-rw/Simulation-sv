module ControlUnit #(
  parameter WIDTH = 32
)(
  input logic [6:0] opcode,
  output logic regWrite,
  output logic [1:0] aluOp,
  output logic memWrite,
  output logic memRead,
  output logic [2:0] regDst
);
  // Define control signals based on the opcode
  always_comb begin
    case (opcode)
      7'b0000000: begin // R-type instruction
        regWrite = 1;
        aluOp = 2'b10; // ALU operation: ADD
        memWrite = 0;
        memRead = 0;
        regDst = 3'b000; // Write result to rd
      end
      7'b0001000: begin // LW instruction
        regWrite = 1;
        aluOp = 2'b00; // ALU operation: ADD
        memWrite = 0;
        memRead = 1;
        regDst = 3'b000; // Write result to rt
      end
      7'b0010000: begin // SW instruction
        regWrite = 0;
        aluOp = 2'b00; // ALU operation: ADD
        memWrite = 1;
        memRead = 0;
        regDst = 3'b000; // Not used in SW
      end
      default: begin // Default control signals for unknown opcode
        regWrite = 0;
        aluOp = 2'b00;
        memWrite = 0;
        memRead = 0;
        regDst = 3'b000;
      end
    endcase
  end
endmodule

