module dff (
    input [3:0] d,
    input clk,
    input reset,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0000;
        end else begin
            q <= d;
        end
    end
endmodule