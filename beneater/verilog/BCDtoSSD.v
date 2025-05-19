module BCDtoSSD (
    input      [7:0] value,          
    output reg [3:0] hundreds,
    output reg [3:0] tens,  
    output reg [3:0] units
);

    always @(*) begin
        integer temp;
        temp = integer'(value);
        hundreds = temp / 100;
        temp = temp % 100;
        tens = temp / 10;
        units = temp % 10;
    end
endmodule