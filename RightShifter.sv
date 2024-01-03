module RightShifter #(parameter WIDTH = 32)(
  input logic [WIDTH-1:0] input_data,
  input logic [4:0] shift_amount,
  output logic [WIDTH-1:0] shifted_data
);
  assign shifted_data = input_data >> shift_amount;
endmodule

