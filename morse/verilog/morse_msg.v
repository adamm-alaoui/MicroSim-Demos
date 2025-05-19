module Message (
    input clk,
    input rst,
    input start,
    output reg done,
    output reg new_letter,
    output reg [7:0] char_out
);
    
    // Message ROM
    localparam MESSAGE_LEN = 9;
    reg [7:0] rom [0:MESSAGE_LEN-1];
    
    initial begin
        rom[0] = "S";
        rom[1] = "O";
        rom[2] = "S";
        rom[3] = "D";
        rom[4] = "E";
        rom[5] = "B";
        rom[6] = "O";
        rom[7] = "L";
        rom[8] = "O";
    end

    reg [4-1:0] index;
    reg [4:0] counter;
    reg active;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            index <= 0;
            counter <= 0;
            char_out <= 0;
            new_letter <= 0;
            done <= 0;
            active <= 0;
        end else begin
            if (start && !active) begin
                active <= 1;
                index <= 1;
                counter <= 0;
                new_letter <= 1;
                char_out <= rom[0];
                done <= 0;
            end else if (active) begin
                if (counter < 17) begin
                    counter <= counter + 1;
                    new_letter <= 0;
                end else begin
                    counter <= 0;
                    index <= index + 1;
                    if (index < MESSAGE_LEN) begin
                        char_out <= rom[index];
                        new_letter <= 1;
                    end else begin
                        done <= 1;
                        active <= 0;
                    end
                end
            end
        end
    end
endmodule
