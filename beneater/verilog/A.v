
// The Accumulator Register
module A (
    input       [7:0] data_in,
    output reg  [7:0] data_out,
    input             clock,
    input             write_enable,
    input             bReset
);

always @(posedge clock or posedge bReset) begin
    if (bReset)
        data_out <= 8'b0;
    else if (write_enable)
        data_out <= data_in;
end

endmodule
