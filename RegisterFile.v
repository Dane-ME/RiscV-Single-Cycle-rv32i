module RegisterFile (
    input wire clk,
    input wire RegWrite,
    input wire [4:0] rs1,
    input wire [4:0] rs2,
    input wire [4:0] rd,
    input wire [31:0] WriteData,
    output wire [31:0] ReadData1,
    output wire [31:0] ReadData2,
    input wire rst_n
);
    reg [31:0] registers [0:31];
    integer i;  // Khai báo biến integer cho loop

    assign ReadData1 = (rs1 != 0) ? registers[rs1] : 32'b0;
    assign ReadData2 = (rs2 != 0) ? registers[rs2] : 32'b0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'b0;
        end else if (RegWrite && rd != 0) begin
            registers[rd] <= WriteData;
        end
    end
endmodule
