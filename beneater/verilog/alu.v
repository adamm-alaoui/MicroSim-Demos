
module alu(
    input [7:0] a,
    input [7:0] b,
    input [1:0] alu_op,
    output [7:0] result,
    output carry_flag,
    output zero_flag
    );

localparam DataBits = 8;

// Alu op encoding
`define ADD_ALU_OP 2'b00
`define SUB_ALU_OP 2'b01
`define SLL_ALU_OP 2'b10
`define SRL_ALU_OP 2'b11


wire [DataBits:0]expanded_result;

assign expanded_result = (alu_op == `ADD_ALU_OP) ? {1'b0, a} + {1'b0, b} :
                         (alu_op == `SUB_ALU_OP) ? {1'b0, a} - {1'b0, b} :
                         (alu_op == `SLL_ALU_OP) ? {1'b0, a} << 1 :
                         (alu_op == `SRL_ALU_OP) ? {1'b0, a} >> 1 :
                         {DataBits+1{1'b0}};

assign result = expanded_result[DataBits-1:0];
assign carry_flag = expanded_result[DataBits];
assign zero_flag = expanded_result[DataBits-1:0] == 0;

endmodule
