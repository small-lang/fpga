module alu
(
    input wire [15:0] acc_data,
    input wire [15:0] mem_data,
    input wire [15:0] arg_data,

    output wire [15:0] result,
    output wire is_zero,

    input wire ctl_nad,
    input wire ctl_shr,
    input wire ctl_shl,
    input wire ctl_lda,
);

    assign is_zero = (acc_data == 0);

    //select
    assign result =
        (ctl_nad ? ~(acc_data & mem_data) : 0) |
        (ctl_shr ?  (acc_data >> 1)       : 0) |
        (ctl_shl ?  (acc_data << 1)       : 0) |
        (ctl_lda ?  (acc_data)            : 0);

endmodule