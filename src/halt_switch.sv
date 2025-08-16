module halt_switch
(
    input wire sys_clk,
    output wire clk,
    input wire reset,
    input wire hlt
);

    reg halt_status;

    initial halt_status = 0;
    
    assign clk = sys_clk & !halt_status;

    always @(posedge sys_clk or posedge reset) begin
        if (reset)
            halt_status <= 0;
        else if (hlt)
            halt_status <= 1;
    end

endmodule