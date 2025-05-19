
// PC value controller
module PC_controller (
    input [7:0] pre_pc,
    input [7:0] jump_addr,
    input inc_pc,
    input pc_in,
    output [3:0] out,
    output pc_we
);

    assign pc_we = inc_pc || pc_in;
    wire [7:0] next_pc;
    assign next_pc = pc_in ? jump_addr : (pre_pc + 1);
    assign out = next_pc[3:0];
endmodule