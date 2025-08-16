module cpu
(
    input wire clk,

    input  wire [15:0] arg,
    output wire [15:0] bus,


    output wire is_zero,

    input wire ctl_arg,
    input wire ctl_nad,
    input wire ctl_shl,
    input wire ctl_shr,
    input wire ctl_read,
    input wire ctl_write,
    input wire ctl_acc
    
);
    wire [15:0] result;
    wire [15:0] acc_out;

    wire [15:0] data_memory_in;
    wire [15:0] data_memory_out;

    assign bus = result;
    assign data_memory_in = acc_out;

    alu alu(
        .acc_data (acc_out),
        .mem_data (data_memory_out),
        .arg_data (arg),
        .result   (result),
        .is_zero  (is_zero),
        
        .ctl_nad,
        .ctl_shr,
        .ctl_shl,
        .ctl_arg,
        .ctl_read
    );

    register acc(
        .clk    (clk),
        .enable (ctl_acc),
        .in     (result),
        .out    (acc_out)
    );

    data_memory dm(
        clk,
        ctl_write,
        arg,
        data_memory_in,
        data_memory_out
    );


endmodule