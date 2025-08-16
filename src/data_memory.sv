module data_memory
(
    input wire clk,
    input wire ctl_write_enable,

    input  wire [15:0] addr,
    input  wire [15:0] data_in,
    output reg  [15:0] data_out
);

    reg [15:0] mem[(1 << 15):0];

    always @(negedge clk) begin
        data_out <= 0;
        if (ctl_write_enable)
            mem[addr] <= data_in;
        else
            data_out <= mem[addr];
    end


endmodule