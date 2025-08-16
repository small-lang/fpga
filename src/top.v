
module top
(
    input  wire       sys_clk,
    input  wire       reset_raw
    //output wire [9:0] port_out,
    //output wire       clk_light
);

    wire reset = !reset_raw;

    wire [15:0] prog_addr;
    prog_counter pc (
        .clk (sys_clk),
        .reset (reset),
        .load_enable (1'b0),
        .load_data (),
        .out (prog_addr)
    );

    wire [15:0] prog_data;
    prog_memory pm (
        .addr (prog_addr),
        .data_out (prog_data)
    );



endmodule


