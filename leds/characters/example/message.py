import re

TEMPLATE = """\
module Message (
    input            clk,
    input            rst,
    input            start,
    output reg       write,
    output reg [7:0] char_out,
    output reg [1:0] column
);
    
    // Message ROM
    localparam MESSAGE_LEN = {length};
    reg [7:0] rom [0:MESSAGE_LEN-1];
    
    initial begin
{rom_entries}
    end

    reg [{index_bits}-1:0] index;
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
"""

def sanitize_input(text):
    """ Removes non-alphanumeric characters and converts to uppercase """
    return re.sub(r'[^0-9A-Z\.\:\,\;\ \)\(\/\&\%\'\?\[\]\{\}\+\-\*\!]', '', text.upper())

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

    with open("../verilog/message.v", "w") as f:
        f.write(verilog_code)
