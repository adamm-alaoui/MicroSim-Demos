module CharROM (
    input             cs,
    input      [7:0]  char,
    input      [1:0]  column,
    output reg [15:0] led_out
);

    reg [9:0] font_rom_data [0:127][0:3];


    assign font_rom_data["A"][0] = 10'b1111111110;
    assign font_rom_data["A"][1] = 10'b0000010001;
    assign font_rom_data["A"][2] = 10'b0000010001;
    assign font_rom_data["A"][3] = 10'b1111111110;

    assign font_rom_data["B"][0] = 10'b1111111111;
    assign font_rom_data["B"][1] = 10'b1000001001;
    assign font_rom_data["B"][2] = 10'b1000001001;
    assign font_rom_data["B"][3] = 10'b0111110110;

    assign font_rom_data["C"][0] = 10'b0111111110;
    assign font_rom_data["C"][1] = 10'b1000000001;
    assign font_rom_data["C"][2] = 10'b1000000001;
    assign font_rom_data["C"][3] = 10'b1000000001;

    assign font_rom_data["D"][0] = 10'b1111111111;
    assign font_rom_data["D"][1] = 10'b1000000001;
    assign font_rom_data["D"][2] = 10'b1000000001;
    assign font_rom_data["D"][3] = 10'b0111111110;

    assign font_rom_data["E"][0] = 10'b1111111111;
    assign font_rom_data["E"][1] = 10'b1000100001;
    assign font_rom_data["E"][2] = 10'b1000100001;
    assign font_rom_data["E"][3] = 10'b1000000001;

    assign font_rom_data["F"][0] = 10'b1111111111;
    assign font_rom_data["F"][1] = 10'b0000100001;
    assign font_rom_data["F"][2] = 10'b0000100001;
    assign font_rom_data["F"][3] = 10'b0000000001;

    assign font_rom_data["G"][0] = 10'b0111111110;
    assign font_rom_data["G"][1] = 10'b1000000001;
    assign font_rom_data["G"][2] = 10'b1000100001;
    assign font_rom_data["G"][3] = 10'b1111100001;

    assign font_rom_data["H"][0] = 10'b1111111111;
    assign font_rom_data["H"][1] = 10'b0000100000;
    assign font_rom_data["H"][2] = 10'b0000100000;
    assign font_rom_data["H"][3] = 10'b1111111111;

    assign font_rom_data["I"][0] = 10'b1000000001;
    assign font_rom_data["I"][1] = 10'b1111111111;
    assign font_rom_data["I"][2] = 10'b1111111111;
    assign font_rom_data["I"][3] = 10'b1000000001;
    
    assign font_rom_data["J"][0] = 10'b0110000001;
    assign font_rom_data["J"][1] = 10'b1000000001;
    assign font_rom_data["J"][2] = 10'b1111111111;
    assign font_rom_data["J"][3] = 10'b0000000001;

    assign font_rom_data["K"][0] = 10'b1111111111;
    assign font_rom_data["K"][1] = 10'b0000100000;
    assign font_rom_data["K"][2] = 10'b0001010000;
    assign font_rom_data["K"][3] = 10'b1110001111;

    assign font_rom_data["L"][0] = 10'b1111111111;
    assign font_rom_data["L"][1] = 10'b1000000000;
    assign font_rom_data["L"][2] = 10'b1000000000;
    assign font_rom_data["L"][3] = 10'b1000000000;

    assign font_rom_data["M"][0] = 10'b1111111111;
    assign font_rom_data["M"][1] = 10'b0000001110;
    assign font_rom_data["M"][2] = 10'b0000001110;
    assign font_rom_data["M"][3] = 10'b1111111111;

    assign font_rom_data["N"][0] = 10'b1111111111;
    assign font_rom_data["N"][1] = 10'b0000000110;
    assign font_rom_data["N"][2] = 10'b0000011000;
    assign font_rom_data["N"][3] = 10'b1111111111;

    assign font_rom_data["O"][0] = 10'b0111111110;
    assign font_rom_data["O"][1] = 10'b1000000001;
    assign font_rom_data["O"][2] = 10'b1000000001;
    assign font_rom_data["O"][3] = 10'b0111111110;

    assign font_rom_data["P"][0] = 10'b1111111111;
    assign font_rom_data["P"][1] = 10'b0000100001;
    assign font_rom_data["P"][2] = 10'b0000100001;
    assign font_rom_data["P"][3] = 10'b0000011110;

    assign font_rom_data["Q"][0] = 10'b0111111110;
    assign font_rom_data["Q"][1] = 10'b1000000001;
    assign font_rom_data["Q"][2] = 10'b1001000001;
    assign font_rom_data["Q"][3] = 10'b0110111110;

    assign font_rom_data["R"][0] = 10'b1111111111;
    assign font_rom_data["R"][1] = 10'b0000100001;
    assign font_rom_data["R"][2] = 10'b0001100001;
    assign font_rom_data["R"][3] = 10'b1110011110;

    assign font_rom_data["S"][0] = 10'b0110011110;
    assign font_rom_data["S"][1] = 10'b1000100001;
    assign font_rom_data["S"][2] = 10'b1000100001;
    assign font_rom_data["S"][3] = 10'b1111100110;

    assign font_rom_data["T"][0] = 10'b0000000001;
    assign font_rom_data["T"][1] = 10'b1111111111;
    assign font_rom_data["T"][2] = 10'b1111111111;
    assign font_rom_data["T"][3] = 10'b0000000001;

    assign font_rom_data["U"][0] = 10'b0111111111;
    assign font_rom_data["U"][1] = 10'b1000000000;
    assign font_rom_data["U"][2] = 10'b1000000000;
    assign font_rom_data["U"][3] = 10'b0111111111;

    assign font_rom_data["V"][0] = 10'b0011111111;
    assign font_rom_data["V"][1] = 10'b1100000000;
    assign font_rom_data["V"][2] = 10'b1100000000;
    assign font_rom_data["V"][3] = 10'b0011111111;

    assign font_rom_data["W"][0] = 10'b1111111111;
    assign font_rom_data["W"][1] = 10'b0110000000;
    assign font_rom_data["W"][2] = 10'b0110000000;
    assign font_rom_data["W"][3] = 10'b1111111111;

    assign font_rom_data["X"][0] = 10'b1110011111;
    assign font_rom_data["X"][1] = 10'b0001100000;
    assign font_rom_data["X"][2] = 10'b0001100000;
    assign font_rom_data["X"][3] = 10'b1110011111;

    assign font_rom_data["Y"][0] = 10'b0000011111;
    assign font_rom_data["Y"][1] = 10'b1111100000;
    assign font_rom_data["Y"][2] = 10'b1111100000;
    assign font_rom_data["Y"][3] = 10'b0000011111;

    assign font_rom_data["Z"][0] = 10'b1110000001;
    assign font_rom_data["Z"][1] = 10'b1001100001;
    assign font_rom_data["Z"][2] = 10'b1000011001;
    assign font_rom_data["Z"][3] = 10'b1000000111;

    assign font_rom_data["0"][0] = 10'b0111111110;
    assign font_rom_data["0"][1] = 10'b1000011101;
    assign font_rom_data["0"][2] = 10'b1011100001;
    assign font_rom_data["0"][3] = 10'b0111111110;

    assign font_rom_data["1"][0] = 10'b0000000000;
    assign font_rom_data["1"][1] = 10'b1000000001;
    assign font_rom_data["1"][2] = 10'b1111111111;
    assign font_rom_data["1"][3] = 10'b0000000000;

    assign font_rom_data["2"][0] = 10'b1110000001;
    assign font_rom_data["2"][1] = 10'b1001000001;
    assign font_rom_data["2"][2] = 10'b1000100001;
    assign font_rom_data["2"][3] = 10'b1000011111;

    assign font_rom_data["3"][0] = 10'b1000000001;
    assign font_rom_data["3"][1] = 10'b1000100001;
    assign font_rom_data["3"][2] = 10'b1000100001;
    assign font_rom_data["3"][3] = 10'b0111011110;

    assign font_rom_data["4"][0] = 10'b0000111110;
    assign font_rom_data["4"][1] = 10'b0000100000;
    assign font_rom_data["4"][2] = 10'b1111111111;
    assign font_rom_data["4"][3] = 10'b0000000000;

    assign font_rom_data["5"][0] = 10'b1000011111;
    assign font_rom_data["5"][1] = 10'b1000100001;
    assign font_rom_data["5"][2] = 10'b1000100001;
    assign font_rom_data["5"][3] = 10'b0111100001;

    assign font_rom_data["6"][0] = 10'b0111111110;
    assign font_rom_data["6"][1] = 10'b1000100001;
    assign font_rom_data["6"][2] = 10'b1000100001;
    assign font_rom_data["6"][3] = 10'b0111100001;

    assign font_rom_data["7"][0] = 10'b1000000001;
    assign font_rom_data["7"][1] = 10'b1000000111;
    assign font_rom_data["7"][2] = 10'b1000011000;
    assign font_rom_data["7"][3] = 10'b1000110000;

    assign font_rom_data["8"][0] = 10'b0111011110;
    assign font_rom_data["8"][1] = 10'b1000100001;
    assign font_rom_data["8"][2] = 10'b1000100001;
    assign font_rom_data["8"][3] = 10'b0111011110;

    assign font_rom_data["9"][0] = 10'b1000011110;
    assign font_rom_data["9"][1] = 10'b1000100001;
    assign font_rom_data["9"][2] = 10'b1000100001;
    assign font_rom_data["9"][3] = 10'b0111111110;
    
    assign font_rom_data[" "][0] = 10'b0000000000;
    assign font_rom_data[" "][1] = 10'b0000000000;
    assign font_rom_data[" "][2] = 10'b0000000000;
    assign font_rom_data[" "][3] = 10'b0000000000;

    assign font_rom_data[":"][0] = 10'b0000000000;
    assign font_rom_data[":"][1] = 10'b0011001100;
    assign font_rom_data[":"][2] = 10'b0011001100;
    assign font_rom_data[":"][3] = 10'b0000000000;

    assign font_rom_data[";"][0] = 10'b0000000000;
    assign font_rom_data[";"][1] = 10'b0000110110;
    assign font_rom_data[";"][2] = 10'b0000110010;
    assign font_rom_data[";"][3] = 10'b0000000000;

    assign font_rom_data[","][0] = 10'b1000000000;
    assign font_rom_data[","][1] = 10'b0011000000;
    assign font_rom_data[","][2] = 10'b0000000000;
    assign font_rom_data[","][3] = 10'b0000000000;

    assign font_rom_data["."][0] = 10'b1100000000;
    assign font_rom_data["."][1] = 10'b1100000000;
    assign font_rom_data["."][2] = 10'b0000000000;
    assign font_rom_data["."][3] = 10'b0000000000;

    assign font_rom_data["("][0] = 10'b0000000000;
    assign font_rom_data["("][1] = 10'b0111111110;
    assign font_rom_data["("][2] = 10'b1000000001;
    assign font_rom_data["("][3] = 10'b0000000000;

    assign font_rom_data[")"][0] = 10'b0000000000;
    assign font_rom_data[")"][1] = 10'b1000000001;
    assign font_rom_data[")"][2] = 10'b0111111110;
    assign font_rom_data[")"][3] = 10'b0000000000;

    assign font_rom_data["/"][0] = 10'b0000000001;
    assign font_rom_data["/"][1] = 10'b0000011100;
    assign font_rom_data["/"][2] = 10'b0111100000;
    assign font_rom_data["/"][3] = 10'b1000000000;

    assign font_rom_data["&"][0] = 10'b0111011110;
    assign font_rom_data["&"][1] = 10'b1000101001;
    assign font_rom_data["&"][2] = 10'b1001010001;
    assign font_rom_data["&"][3] = 10'b0110101110;

    assign font_rom_data["%"][0] = 10'b1000000011;
    assign font_rom_data["%"][1] = 10'b0110001100;
    assign font_rom_data["%"][2] = 10'b0001110000;
    assign font_rom_data["%"][3] = 10'b1100000010;

    assign font_rom_data["'"][0] = 10'b0000000000;
    assign font_rom_data["'"][1] = 10'b0000000111;
    assign font_rom_data["'"][2] = 10'b0000000000;
    assign font_rom_data["'"][3] = 10'b0000000000;

    assign font_rom_data["?"][0] = 10'b0000000010;
    assign font_rom_data["?"][1] = 10'b0000000001;
    assign font_rom_data["?"][2] = 10'b1011110001;
    assign font_rom_data["?"][3] = 10'b0000000110;

    assign font_rom_data["["][0] = 10'b0000000000;
    assign font_rom_data["["][1] = 10'b1111111111;
    assign font_rom_data["["][2] = 10'b1000000001;
    assign font_rom_data["["][3] = 10'b0000000000;

    assign font_rom_data["]"][0] = 10'b0000000000;
    assign font_rom_data["]"][1] = 10'b1000000001;
    assign font_rom_data["]"][2] = 10'b1111111111;
    assign font_rom_data["]"][3] = 10'b0000000000;

    assign font_rom_data["{"][0] = 10'b0000000000;
    assign font_rom_data["{"][1] = 10'b0001111110;
    assign font_rom_data["{"][2] = 10'b0110000001;
    assign font_rom_data["{"][3] = 10'b0000000000;

    assign font_rom_data["}"][0] = 10'b0000000000;
    assign font_rom_data["}"][1] = 10'b0110000001;
    assign font_rom_data["}"][2] = 10'b0001111110;
    assign font_rom_data["}"][3] = 10'b0000000000;

    assign font_rom_data["+"][0] = 10'b000000000;
    assign font_rom_data["+"][1] = 10'b0000100000;
    assign font_rom_data["+"][2] = 10'b0011111000;
    assign font_rom_data["+"][3] = 10'b0000100000;

    assign font_rom_data["-"][0] = 10'b0000000000;
    assign font_rom_data["-"][1] = 10'b0000100000;
    assign font_rom_data["-"][2] = 10'b0000100000;
    assign font_rom_data["-"][3] = 10'b0000100000;

    assign font_rom_data["*"][0] = 10'b0000100000;
    assign font_rom_data["*"][1] = 10'b0010101010;
    assign font_rom_data["*"][2] = 10'b0001111100;
    assign font_rom_data["*"][3] = 10'b0010101010;

    
    assign font_rom_data["!"][0] = 10'b0000000000;
    assign font_rom_data["!"][1] = 10'b1101111111;
    assign font_rom_data["!"][2] = 10'b0000000000;
    assign font_rom_data["!"][3] = 10'b0000000000;


    assign led_out = cs ? {6'b0, font_rom_data[char][column]} : 16'b0;

endmodule
