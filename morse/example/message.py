import re

TEMPLATE = """\
module Message (
    input clk,
    input rst,
    input start,
    output reg done,
    output reg new_letter,
    output reg [7:0] char_out
);
    
    // Message ROM
    localparam MESSAGE_LEN = {length};
    reg [7:0] rom [0:MESSAGE_LEN-1];
    
    initial begin
{rom_entries}
    end

    reg [{index_bits}-1:0] index;
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
"""

def sanitize_input(text):
    """ Removes non-alphanumeric characters and converts to uppercase """
    return re.sub(r'[^0-9A-Z\.]', '', text.upper())

def generate_verilog(message):
    """ Generates a Verilog ROM module for the given message """
    sanitized_message = sanitize_input(message)
    message_length = len(sanitized_message)
    
    # Compute ROM index bit width (log2 ceiling)
    index_bits = max(1, (message_length).bit_length())

    # Generate ROM entries
    rom_entries = "\n".join(f'        rom[{i}] = "{char}";' for i, char in enumerate(sanitized_message))

    # Fill template
    verilog_code = TEMPLATE.format(
        length=message_length,
        index_bits=index_bits,
        rom_entries=rom_entries
    )

    return verilog_code

if __name__ == "__main__":
    input_string = input("Enter the message to encode in ROM: ")
    verilog_code = generate_verilog(input_string)

    with open("../verilog/morse_msg.v", "w") as f:
        f.write(verilog_code)
