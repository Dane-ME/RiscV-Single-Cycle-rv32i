module DMEM (
    input wire clk,
    input wire rst_n,            // Thêm cổng reset
    input wire MemRead,
    input wire MemWrite,
    input wire [31:0] addr,
    input wire [31:0] WriteData,
    output reg [31:0] ReadData
);
    reg [31:0] memory [0:255];
    integer i;  // Khai báo biến integer cho loop

    assign ReadData = (MemRead) ? memory[addr[9:2]] : 32'b0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 256; i = i + 1)
                memory[i] <= 32'b0;
        end else if (MemWrite) begin
            memory[addr[9:2]] <= WriteData;
        end
    end
endmodule
