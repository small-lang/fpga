

module prog_memory
(
    input       [15:0] addr,
    output wire [15:0] data
);
    reg [15:0] mem[(1 << 15):0];

    initial $readmemb("prog.mem", mem);
    assign data = mem[addr];

endmodule