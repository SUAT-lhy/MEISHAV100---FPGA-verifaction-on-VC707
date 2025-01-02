module async_rst_gen(
    input clk
    ,input reset_in
    ,output reset_out);


  AsyncResetReg #(.RESET_VALUE(1), .DELAY_CYCLE(2)) reg_0 ( 
    .rst(reset_in),
    .clk(clk),
    .en(1'b1),
    .q(reset_out),
    .d(1'b0)
  );


endmodule