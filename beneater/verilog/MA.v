
// The Memory Address Register
module MA (
    input       [7:0] data_in,
    output reg  [3:0] data_out,
    input             clock,
    input             write_enable,
    input             bReset
);

always @(posedge clock or posedge bReset) begin
    if (bReset)
        data_out <= 4'b0;
    else if (write_enable)
        data_out <= data_in[3:0];
end

endmodule
