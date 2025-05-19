
// The Program Counter Register
module PC (
    input       [3:0] data_in,
    output reg  [7:0] data_out,
    input             clock,
    input             write_enable,
    input             bReset
);

always @(posedge clock or posedge bReset) begin
    if (bReset)
        data_out <= 8'b0;
    else if (write_enable)
        data_out <= {4'b0000, data_in};
end

endmodule
