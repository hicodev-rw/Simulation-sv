module Mux2to1 #(parameter WIDTH = 32)(
  input logic [WIDTH-1:0] data0,
  input logic [WIDTH-1:0] data1,
  input logic sel,
  output logic [WIDTH-1:0] result
);
  assign result = (sel == 1'b0) ? data0 : data1;
endmodule