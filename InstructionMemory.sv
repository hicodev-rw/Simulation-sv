module InstructionMemory #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter MEM_SIZE = 1024
)(
    input clk,
    input [ADDR_WIDTH-1:0] inst_addr,
    output reg [DATA_WIDTH-1:0] inst_rdata
);

    reg [DATA_WIDTH-1:0] memory [0:MEM_SIZE-1];

    initial begin
        // Directly initialize memory with instructions
        memory[0] <= 32'h34D78131; // Example instruction 1
        memory[1] <= 32'h0AC510D1; // Example instruction 2
    end

    always @(*) begin
        inst_rdata <= memory[inst_addr];
    end

endmodule

