module MorsePlayer (
    input clk,       
    input rst,       
    input enable,    
    input [7:0] char,
    output reg out
);

    reg [15:0] morse_data;   // Stores Morse sequence (max 16 bits per character)
    reg [4:0] clk_count;     // Number of clk being played
    reg playing;             // Playback state

    reg [15:0] morse_data_lookup;

    always @(*) begin
        case (char)
            "A": morse_data_lookup = 16'b1011100000000000; // .-
            "B": morse_data_lookup = 16'b1110101010000000; // -...
            "C": morse_data_lookup = 16'b1110101110100000; // -.-.
            "D": morse_data_lookup = 16'b1110101000000000; // -..
            "E": morse_data_lookup = 16'b1000000000000000; // .
            "F": morse_data_lookup = 16'b1010111010000000; // ..-.
            "G": morse_data_lookup = 16'b1110111000000000; // --.
            "H": morse_data_lookup = 16'b1010101000000000; // ....
            "I": morse_data_lookup = 16'b1010000000000000; // ..
            "J": morse_data_lookup = 16'b1011101110111000; // .---
            "K": morse_data_lookup = 16'b1110101110000000; // -.-
            "L": morse_data_lookup = 16'b1011101010000000; // .-..
            "M": morse_data_lookup = 16'b1110110000000000; // --
            "N": morse_data_lookup = 16'b1110100000000000; // -.
            "O": morse_data_lookup = 16'b1110111011100000; // ---
            "P": morse_data_lookup = 16'b1011101110100000; // .--.
            "Q": morse_data_lookup = 16'b1110111010111000; // --.-
            "R": morse_data_lookup = 16'b1011101000000000; // .-.
            "S": morse_data_lookup = 16'b1010100000000000; // ...
            "T": morse_data_lookup = 16'b1110000000000000; // -
            "U": morse_data_lookup = 16'b1010111000000000; // ..-
            "V": morse_data_lookup = 16'b1010101110000000; // ...-
            "W": morse_data_lookup = 16'b1011101110000000; // .--
            "X": morse_data_lookup = 16'b1110101011100000; // -..-
            "Y": morse_data_lookup = 16'b1110101110111000; // -.--    
            "Z": morse_data_lookup = 16'b1110111010100000; // --..
            "0": morse_data_lookup = 16'b1110111011101110; // -----
            "1": morse_data_lookup = 16'b1011101110111010; // .----
            "2": morse_data_lookup = 16'b1010111011101000; // ..---
            "3": morse_data_lookup = 16'b1010101110101000; // ...--
            "4": morse_data_lookup = 16'b1010101011100000; // ....-
            "5": morse_data_lookup = 16'b1010101010000000; // .....
            "6": morse_data_lookup = 16'b1110101010100000; // -....
            "7": morse_data_lookup = 16'b1110111010100000; // --...
            "8": morse_data_lookup = 16'b1110111011101000; // ---..
            "9": morse_data_lookup = 16'b1110111011101110; // ----.
            ".": morse_data_lookup = 16'b1011101011101010; // .-.-.-
            default: morse_data_lookup = 16'b0000000000000000; // Unknown character
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            morse_data <= 16'b0;
            playing <= 0;
            out <= 0;
        end else begin
            if (!playing && enable) begin
                // Load Morse sequence and start playback when enabled
                morse_data <= morse_data_lookup;
                clk_count <= 0;
                playing <= 1;
            end else if (playing) begin

                // Output the next Morse bit
                out <= morse_data[15]; 
                morse_data <= morse_data << 1;
                clk_count <= clk_count + 1;

                // Stop playback when finished
                if (clk_count == 16) begin
                    playing <= 0; 
                end
            end
        end
    end

endmodule
