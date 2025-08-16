

module prog_counter
(
    input clk,
    input reset,
    input load_enable,
    input [15:0] load_data,

    output reg [15:0] out
);

    initial out = 0;

    always @ (posedge clk or posedge reset)
    begin
             if (reset)       out <= 0;
        else if (load_enable) out <= load_data;
        else                  out <= out + 1;
    end

endmodule

