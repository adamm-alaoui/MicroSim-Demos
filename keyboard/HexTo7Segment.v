module HexTo7Segment (
    input [3:0] in,
    output a, // Segment a
    output b, // Segment b
    output c, // Segment c
    output d, // Segment d
    output e, // Segment e
    output f, // Segment f
    output g  // Segment g
);

    wire [6:0] segments;

    assign segments = (in == 4'b0000) ? 7'b1111110 : // 0
                      (in == 4'b0001) ? 7'b0110000 : // 1
                      (in == 4'b0010) ? 7'b1101101 : // 2
                      (in == 4'b0011) ? 7'b1111001 : // 3
                      (in == 4'b0100) ? 7'b0110011 : // 4
                      (in == 4'b0101) ? 7'b1011011 : // 5
                      (in == 4'b0110) ? 7'b1011111 : // 6
                      (in == 4'b0111) ? 7'b1110000 : // 7
                      (in == 4'b1000) ? 7'b1111111 : // 8
                      (in == 4'b1001) ? 7'b1111011 : // 9
                      (in == 4'b1010) ? 7'b1110111 : // A
                      (in == 4'b1011) ? 7'b0011111 : // B
                      (in == 4'b1100) ? 7'b1001110 : // C
                      (in == 4'b1101) ? 7'b0111101 : // D
                      (in == 4'b1110) ? 7'b1001111 : // E
                      (in == 4'b1111) ? 7'b1000111 : // F
                                      7'b0000000;   // Blank (default)

    assign {a, b, c, d, e, f, g} = segments;

endmodule
