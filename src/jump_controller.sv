module jump_controller
(
    input wire ctl_jmp,
    input wire ctl_jmz,
    input wire is_zero,

    output wire jump
);

    wire jmp = ctl_jmp;              //jump
    wire jmz = ctl_jmz & is_zero;    //jump zero

    assign jump = jmp | jmz;

endmodule