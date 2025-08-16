  
module top
(
    input  wire        sys_clk,
    input  wire        reset_raw,
    output wire [15:0] port_out,
    output wire        clk_light
);
    wire reset = !reset_raw;


    wire clk;
    wire ctl_hlt;
    halt_switch hs(
        sys_clk,
        clk,
        reset,
        ctl_hlt
    );



    wire [15:0] prog_mem_addr;
    wire [15:0] prog_mem_data;

    wire [15:0] arg;
    wire alu_is_zero;

    //control signals
    wire ctl_arg;
    wire ctl_nad;
    wire ctl_shl;
    wire ctl_shr;
    wire ctl_acc;
    wire ctl_out;
    wire ctl_read;
    wire ctl_write;

    control_unit cu (.*);

    prog_memory pm(
        .addr (prog_mem_addr),
        .data (prog_mem_data)
    );

    wire [15:0] bus;
    cpu cpu(
        .clk,
        .arg,
        .bus,
        .is_zero (alu_is_zero),

        .ctl_arg,
        .ctl_nad,
        .ctl_shl,
        .ctl_shr,
        .ctl_read,
        .ctl_write,
        .ctl_acc
    );


    register output_reg(
        .clk,
        .enable     (ctl_out),
        .in         (bus),
        .out        (port_out)
    );

endmodule