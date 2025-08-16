module inst_decoder
(
    input wire        enable,
    input wire [15:0] inst,

    output reg ctl_hlt,
    output reg ctl_arg,
    output reg ctl_nad,
    output reg ctl_shr,
    output reg ctl_shl,
    output reg ctl_acc,
    output reg ctl_out,
    output reg ctl_read,
    output reg ctl_write,
    output reg ctl_jmp,
    output reg ctl_jmz
);

    always @(*) begin
        ctl_hlt <= 0;
        ctl_arg <= 0;
        ctl_nad <= 0;
        ctl_shr <= 0;
        ctl_shl <= 0;
        ctl_acc <= 0;
        ctl_out <= 0;
        ctl_read <= 0;
        ctl_write <= 0;
        ctl_jmp <= 0;
        ctl_jmz  <= 0;

        if (enable) case (inst)
            4'h0 : ctl_hlt <= 1;
            4'h1 : begin ctl_acc <= 1; ctl_arg <= 1; end

            4'h2 : begin ctl_acc <= 1; ctl_shr <= 1; end
            4'h3 : begin ctl_acc <= 1; ctl_shl <= 1; end
            4'h4 : begin ctl_acc <= 1; ctl_nad <= 1; end

            4'h5 : begin ctl_jmp <= 1; end
            4'h6 : begin ctl_jmz <= 1; end
            
            4'h7 : ; //cal not implemented
            4'h8 : ; //ret not implemented

            4'h9 : begin ctl_acc <= 1; ctl_read <= 1; end
            4'ha : begin ctl_write <= 1; end

            4'hb : ; //pha not implemented
            4'hc : ; //pla not implemented

            4'hd : begin ctl_out <= 1; ctl_read <= 1; end
            4'he : ; //inp not implemented

            4'hf : ; //res not implemented


        
        endcase
    end


    

endmodule
