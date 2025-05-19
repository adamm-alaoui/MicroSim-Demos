module thermometer (
    input clk,
    input reset,
    output reg [15:0] out
);
reg direction;
reg [3:0] count;
reg stall;
reg [3:0] stall_count;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'd0;
        direction <= 1'b0;
        out <= 16'd0;
        stall <= 1'b0;
        stall_count <= 4'd0;
    end else begin
        if (!stall) begin
            if (!direction) begin
                if (count < 4'd10) begin
                    count <= count + 1;
                end else begin
                    direction <= 1'b1;
                    stall <= 1'b1;
                    stall_count <= 4'd0;
                end
            end else begin
                if (count > 4'd0) begin
                    count <= count - 1;
                end else begin
                    direction <= 1'b0;
                end
            end
        end else begin
            stall_count <= stall_count + 1;
            if (stall_count == 4'd11) begin
                stall <= 1'b0;
                stall_count <= 4'd0;
            end
            
        end

        out <= ((1 << count) - 1);
    end
end

endmodule