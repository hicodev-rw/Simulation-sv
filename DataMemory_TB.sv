module DataMemory_TB;

    localparam DATA_WIDTH = 32;
    localparam ADDR_WIDTH = 32;
    localparam MEM_SIZE = 1024;

    reg clk;
    reg rst;
    reg mem_we;
    reg [ADDR_WIDTH-1:0] mem_addr;
    reg [DATA_WIDTH-1:0] mem_wdata;
    reg [ADDR_WIDTH-1:0] mem_raddr;
    wire [DATA_WIDTH-1:0] mem_rdata;

    DataMemory #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .MEM_SIZE(MEM_SIZE)
    ) UUT (
        .clk(clk),
        .rst(rst),
        .mem_we(mem_we),
        .mem_addr(mem_addr),
        .mem_wdata(mem_wdata),
        .mem_raddr(mem_raddr),
        .mem_rdata(mem_rdata)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test scenarios
    initial begin
        rst = 1'b1;
        #10 rst = 1'b0;

        // Write test
        mem_we = 1'b1;
        mem_addr = 32'h100;
        mem_wdata = 32'hABCD1234;
        #10;

        // Read test
        mem_we = 1'b0;
        mem_raddr = 32'h100;
        #10;

        $finish;
    end

endmodule

