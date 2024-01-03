module InstructionMemory_TB;

    localparam DATA_WIDTH = 32;
    localparam ADDR_WIDTH = 32;
    localparam MEM_SIZE = 1024;

    reg clk;
    reg [ADDR_WIDTH-1:0] inst_addr;
    wire [DATA_WIDTH-1:0] inst_rdata;

    InstructionMemory #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .MEM_SIZE(MEM_SIZE)
    ) UUT (
        .clk(clk),
        .inst_addr(inst_addr),
        .inst_rdata(inst_rdata)
    );

    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    initial begin
        inst_addr = 32'h0;
        #10;

        //inst_addr = 32'h1;
        //#10;


        //$finish;
    end

endmodule


