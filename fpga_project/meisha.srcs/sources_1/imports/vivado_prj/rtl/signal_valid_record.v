
module signal_valid_record(
    input clk
    ,input rst_n
    ,input wire signal_valid
    ,input wire signal_int_clear
    ,output reg signal_valid_record_int_reg
);

  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      signal_valid_record_int_reg <= 1'b0;
    end
    else if(signal_int_clear) begin
      signal_valid_record_int_reg <= 1'b0;
    end
    else if(signal_valid) begin
      signal_valid_record_int_reg <= 1'b1;
    end

  end

endmodule

