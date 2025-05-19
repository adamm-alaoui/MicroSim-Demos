module dff (
    input [15:0] d,
    input clk,
    input reset,
    output reg [15:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 16'b0;
        end else begin
            q <= d;
        end
    end
endmodule