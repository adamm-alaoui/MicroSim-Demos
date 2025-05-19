
// The Flag Register
module flag (
    input       carry_in,
    output reg  carry_out,
    input       zero_in,
    output reg  zero_out,
    input       write_enable,
    input       bReset,
    input       clk
);

always_ff @(posedge clk or posedge bReset) begin
    if (bReset) begin
        zero_out <= 0;
        carry_out <= 0;
    end else if (write_enable) begin
        zero_out <= zero_in;
        carry_out <= carry_in;
    end
end

endmodule
