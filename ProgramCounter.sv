module ProgramCounter #(parameter WIDTH = 32)(
  input logic clk,
  input logic rst,
  input logic [WIDTH-1:0] input_data,
  input logic enable,
  output logic [WIDTH-1:0] output_data
);
  logic [WIDTH-1:0] counter;

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      counter <= '0;
    else if (enable)
      counter <= input_data;
  end

  assign output_data = counter;
endmodule

