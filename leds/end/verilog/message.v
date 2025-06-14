module Message (
    input            clk,
    input            rst,
    input            start,
    output reg       write,
    output reg [7:0] char_out,
    output reg [1:0] column
);
    
    // Message ROM
    localparam MESSAGE_LEN = 14;
    reg [7:0] rom [0:MESSAGE_LEN-1];
    
    initial begin
        rom[0] = " ";
        rom[1] = " ";
        rom[2] = " ";
        rom[3] = "T";
        rom[4] = "H";
        rom[5] = "E";
        rom[6] = " ";
        rom[7] = "E";
        rom[8] = "N";
        rom[9] = "D";
        rom[10] = " ";
        rom[11] = ":";
        rom[12] = "-";
        rom[13] = ")";
    end

    reg [4-1:0] index;
    reg [1:0]   col_idx;
    reg         active;



    always @(posedge clk or posedge rst) begin
        if (rst) begin
            active     <= 0;
            index      <= 0;
            col_idx    <= 0;
            char_out   <= 0; 

        end else begin
            if (start && !active) begin
                active   <= 1;
                index    <= 1;
                col_idx  <= 0;
                char_out <= rom[0];
            end else if (active) begin
                if (col_idx < 2'b11) begin
                    col_idx <= col_idx + 1;
                    active   <= 1;
                end else begin
                    col_idx <= 0;
                    index   <= index + 1;
                    if (index < MESSAGE_LEN) begin
                        char_out <= rom[index];
                    end else begin
                        active <= 0;
                    end
                end
            end
        end
    end

    assign write  = active;
    assign column = col_idx;

endmodule
