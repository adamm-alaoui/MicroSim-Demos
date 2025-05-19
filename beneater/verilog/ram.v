module ram (
    input      [3:0] a,     
    input            clk,         
    input      [7:0] d,     
    input            write_enable,
    output reg [7:0] spo    
);

    reg [7:0] memory [0:15];

    initial begin
        memory[00] = 8'h51; // 0:  LDI 1  
        memory[01] = 8'h4E; // 1:  STA 14 
        memory[02] = 8'h50; // 2:  LDI  0 
        memory[03] = 8'h4F; // 3:  STA 15 
        memory[04] = 8'hE0; // 4:  OUT
        memory[05] = 8'h1E; // 5:  LDA 14 
        memory[06] = 8'h2F; // 6:  ADD 15 
        memory[07] = 8'h4E; // 7:  STA 14 
        memory[08] = 8'hE0; // 8:  OUT
        memory[09] = 8'h1F; // 9:  LDA 15 
        memory[10] = 8'h2E; // 10: ADD 14 
        memory[11] = 8'h70; // 11: JC   0 
        memory[12] = 8'h63; // 12: JMP  3 
        memory[13] = 8'h00;
        memory[14] = 8'h00;
        memory[15] = 8'h00;
    end

    always @(negedge clk) begin
        if (write_enable) begin
            memory[a] <= d;
        end
        spo <= memory[a];
    end

endmodule
