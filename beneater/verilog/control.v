module control
(
    input      [3:0] instruction,
    input            clock,
    input            bReset,
    input            carry_flag,
    input            zero_flag,
    output reg       hlt,
    output reg       memory_in,
    output reg       ram_in,
    output reg       instruction_in,
    output reg       reg_a_in,
    output reg [1:0] alu_op,      
    output reg       reg_b_in,
    output reg       out_in,
    output reg       advance_pc,
    output reg       pc_in,
    output reg       flags_in,
    output reg [3:0] bus_selector
);

// Bus selection bit
`define BusIn_None                0
`define BusIn_PC                  1
`define BusIn_RegA                2
`define BusIn_ALU                 3
`define BusIn_RegB                4
`define BusIn_Memory              5
`define BusIn_InstructionRegister 6

// Instruction encoding
`define INS_NOP  4'b0000
`define INS_LDA  4'b0001
`define INS_ADD  4'b0010
`define INS_SUB  4'b0011
`define INS_STA  4'b0100
`define INS_LDI  4'b0101
`define INS_JMP  4'b0110
`define INS_JC   4'b0111
`define INS_JZ   4'b1000

`define INS_OUT  4'b1110
`define INS_HLT  4'b1111

// Alu op encoding
`define ADD_ALU_OP 2'b00
`define SUB_ALU_OP 2'b01



reg [4:0] step;

// Use blocking assignments for initial values
initial begin
    step = 0;
    reset_controls();
end

always @(negedge clock or posedge bReset) begin
    if (bReset) begin
        step <= 0;
        reset_controls();
    end else begin
        reset_controls();
        step <= step + 1;
        if (step < 2) begin
            perform_fetch_cycle();
        end else begin
            case (instruction)
                `INS_NOP:  perform_ins_nop();
                `INS_LDA:  perform_ins_lda();
                `INS_ADD:  perform_ins_add();
                `INS_SUB:  perform_ins_sub();
                `INS_STA:  perform_ins_sta();
                `INS_LDI:  perform_ins_ldi();
                `INS_JMP:  perform_ins_jmp();
                `INS_JC :  perform_ins_jc();
                `INS_JZ :  perform_ins_jz();
                `INS_OUT:  perform_ins_out();
                `INS_HLT:  perform_ins_hlt();
                default:   perform_ins_nop();
            endcase
        end
    end
end

task perform_fetch_cycle();
begin
    if (step == 0) begin
        bus_selector <= `BusIn_PC;
        memory_in <= 1;
    end else begin
        bus_selector <= `BusIn_Memory;
        instruction_in <= 1;
        advance_pc <= 1;
    end
end
endtask

task perform_ins_nop();
begin
    step <= 0;
end
endtask

task perform_ins_lda();
begin
    if (step == 2) begin
        bus_selector <= `BusIn_InstructionRegister;
        memory_in <= 1;
    end else begin
        bus_selector <= `BusIn_Memory;
        reg_a_in <= 1;
        step <= 0;
    end
end
endtask

task perform_ins_add();
begin
    if (step == 2) begin
        bus_selector <= `BusIn_InstructionRegister;
        memory_in <= 1;
    end else if (step == 3) begin
        bus_selector <= `BusIn_Memory;
        reg_b_in <= 1;
        flags_in <= 1;
    end else begin
        bus_selector <= `BusIn_ALU;
        reg_a_in <= 1;
        alu_op <= `ADD_ALU_OP;
        step <= 0;
    end
end
endtask


task perform_ins_sub();
begin
    if (step == 2) begin
        bus_selector <= `BusIn_InstructionRegister;
        memory_in <= 1;
    end else if (step == 3) begin
        bus_selector <= `BusIn_Memory;
        reg_b_in <= 1;
        flags_in <= 1;
    end else begin
        bus_selector <= `BusIn_ALU;
        reg_a_in <= 1;
        alu_op <= `SUB_ALU_OP;
        step <= 0;
    end
end
endtask

task perform_ins_sta();
begin
    if (step == 2) begin
        bus_selector <= `BusIn_InstructionRegister;
        memory_in <= 1;
    end else begin
        bus_selector <= `BusIn_RegA;
        ram_in <= 1;
        step <= 0;
    end
end
endtask

task perform_ins_ldi();
begin
    bus_selector <= `BusIn_InstructionRegister;
    reg_a_in <= 1;
    step <= 0;
end
endtask

task perform_ins_jmp();
begin
    bus_selector <= `BusIn_InstructionRegister;
    pc_in <= 1;
    step <= 0;
end
endtask

task perform_ins_jc();
begin
    if (carry_flag) begin
        bus_selector <= `BusIn_InstructionRegister;
        pc_in <= 1;
        step <= 0;
    end else begin
        step <= 0;
    end
end
endtask

task perform_ins_jz();
begin
    if (zero_flag) begin
        bus_selector <= `BusIn_InstructionRegister;
        pc_in <= 1;
        step <= 0;
    end else begin
        step <= 0;
    end
end
endtask


task perform_ins_out();
begin
    bus_selector <= `BusIn_RegA;
    out_in <= 1;
    step <= 0;
end
endtask

task perform_ins_hlt();
begin
    hlt <= 1;
    step <= 0;
end
endtask

task reset_controls();
begin
    hlt <= 0;
    memory_in <= 0;
    ram_in <= 0;
    instruction_in <= 0;
    reg_a_in <= 0;
    alu_op <= 0;
    reg_b_in <= 0;
    out_in <= 0;
    advance_pc <= 0;
    pc_in <= 0;
    flags_in <= 0;
    bus_selector <= `BusIn_None;
end
endtask

endmodule



// `define INS_SLL  4'b1001
// `define INS_SRL  4'b1010
// `define INS_MRS  4'b1011