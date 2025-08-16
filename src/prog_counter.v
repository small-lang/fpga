

module prog_counter
(
    input clk,
    input reset,
    input load_enable,
    input [15:0] load_addr,

    output reg [15:0] out,
    output execute_flag
);

    initial out = 0;
    assign execute_flag = out[0];

    always @ (posedge clk or posedge reset)
    begin
             if (reset)       out <= 0;
        else if (load_enable) out <= (load_addr << 1);
        else                  out <= out + 1;
    end

endmodule

