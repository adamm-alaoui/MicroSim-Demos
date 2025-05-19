import sys

OPCODES = {
    "NOP": 0b0000,
    "LDA": 0b0001,
    "ADD": 0b0010,
    "SUB": 0b0011,
    "STA": 0b0100,
    "LDI": 0b0101,
    "JMP": 0b0110,
    "JC":  0b0111,
    "JZ":  0b1000,
    "OUT": 0b1110,
    "HLT": 0b1111,
    "SLL": 0b1001,
    "SRL": 0b1010,
    "MRS": 0b1011,
}

input = sys.argv[1]

ram_mem = [""] * 16

with open(input) as f:

    for line in f:
        if line.startswith(";"):
            continue
        line = line.split(";")[0]
        tokens = line.strip().split()
        address = int(tokens[0][:-1])
        op = tokens[1]
        if op not in OPCODES:
            code = int(op)
        else:
            low = int(tokens[2]) if len(tokens) == 3 else 0
            code = OPCODES[op] << 4 | low
        ram_mem[address] =f"        memory[{address:02}] = 8'h{code:02X}; // {line[:-1]}"
        
    
    for address, line in enumerate(ram_mem):
        if (line == ""):
            ram_mem[address] = f"        memory[{address:02}] = 8'h00;"


ram_top = [

"module ram (",
"    input      [3:0] a,     ",
"    input            clk,         ",
"    input      [7:0] d,     ",
"    input            write_enable,",
"    output reg [7:0] spo    ",
");",
"",
"    reg [7:0] memory [0:15];",
"",
"    initial begin"]


ram_bottom = [
"    end",
"",
"    always @(negedge clk) begin",
"        if (write_enable) begin",
"            memory[a] <= d;",
"        end",
"        spo <= memory[a];",
"    end",
"",
"endmodule",

]

with open("../verilog/ram.v", "w") as output_file:
    for line in ram_top:
        output_file.write(line + "\n")
    for line in ram_mem:
        output_file.write(line + "\n")
    for line in ram_bottom:
        output_file.write(line + "\n")