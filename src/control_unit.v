module control_unit
(
    input wire        clk,
    input wire        reset,

    input  wire [15:0] prog_mem_data,
    output wire [15:0] prog_mem_addr,

    output wire [15:0] arg,

    input  wire       alu_is_zero,
    output wire       ctl_hlt,
    output wire       ctl_arg,
    output wire       ctl_nad,
    output wire       ctl_shl,
    output wire       ctl_shr,
    output wire       ctl_acc,
    output wire       ctl_out,
    output wire       ctl_read,
    output wire       ctl_write
);


    wire        jump_enable;
    wire [15:0] inst;

    //control signals
    wire ctl_jmp;
    wire ctl_jmz;

    wire execute_flag;
    prog_counter pc(
        .clk,
        .reset,
        .load_enable (jump_enable),
        .load_addr   (prog_mem_data),
        .out         (prog_mem_addr),
        .execute_flag
    );


    assign arg = prog_mem_data;
    register inst_buffer(
        .clk,
        .enable (!execute_flag),
        .in  (prog_mem_data),
        .out (inst)
    );


    inst_decoder id(
        .enable (execute_flag),
        .inst,

        .ctl_hlt,
        .ctl_arg,
        .ctl_nad,
        .ctl_shr,
        .ctl_shl,
        .ctl_acc,
        .ctl_out,
        .ctl_read,
        .ctl_write,
        .ctl_jmp,
        .ctl_jmz
    );

    jump_controller jc(
        .ctl_jmp,
        .ctl_jmz,
        .is_zero (alu_is_zero),
        .jump    (jump_enable)
    );


endmodule