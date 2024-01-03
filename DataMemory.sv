module DataMemory #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter MEM_SIZE = 1024
)(
    input clk,
    input rst,
    input mem_we,
    input [ADDR_WIDTH-1:0] mem_addr,
    input [DATA_WIDTH-1:0] mem_wdata,
    input [ADDR_WIDTH-1:0] mem_raddr,
    output reg [DATA_WIDTH-1:0] mem_rdata
);

    reg [DATA_WIDTH-1:0] memory [0:MEM_SIZE-1];

    always @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < MEM_SIZE; i++) begin
                memory[i] <= 0;
            end
        end else if (mem_we) begin
            memory[mem_addr] <= mem_wdata;
        end

        mem_rdata <= memory[mem_raddr];
    end

endmodule


