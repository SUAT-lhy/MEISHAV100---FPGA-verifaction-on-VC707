module pulse_expander # (
    parameter WIDTH = 30  // 展开脉冲的宽度，单位为时钟周期
) (
    input wire clk,
    input wire rst_n,
    input wire pulse_in,
    output reg pulse_out
);


reg [WIDTH-1:0] counter;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
        pulse_out <= 0;
    end else begin
        if (pulse_in) begin
            counter <= WIDTH - 1;
        end else if (counter > 0) begin
            counter <= counter - 1;
        end
        pulse_out <= (counter != 0);
    end
end

endmodule