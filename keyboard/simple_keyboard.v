module simple_keyboard (
    input in1,  // Button 1
    input in2,  // Button 2
    input in3,  // Button 3
    input in4,  // Button 4
    input in5,  // Button 5
    input in6,  // Button 6
    input in7,  // Button 7
    input in8,  // Button 8
    input in9,  // Button 9
    output [3:0] out
);

    assign out = (in1) ? 4'b0001 :
                 (in2) ? 4'b0010 :
                 (in3) ? 4'b0011 :
                 (in4) ? 4'b0100 :
                 (in5) ? 4'b0101 :
                 (in6) ? 4'b0110 :
                 (in7) ? 4'b0111 :
                 (in8) ? 4'b1000 :
                 (in9) ? 4'b1001 :
                          4'b0000; // Default

endmodule
