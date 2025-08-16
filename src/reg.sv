module register
(
    input wire       clk,
    input wire       enable,
    input wire [15:0] in,

    output reg [15:0] out
);

    initial out <= 0;

    always @(posedge clk) begin
        if (enable)
            out <= in;
    end

endmodule