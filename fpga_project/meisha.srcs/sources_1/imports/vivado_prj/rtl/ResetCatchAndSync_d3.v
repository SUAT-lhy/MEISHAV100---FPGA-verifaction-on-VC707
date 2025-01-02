module ResetCatchAndSync_d3( 
  input   clock, 
  input   reset, 
  output  io_sync_reset 
);
reg reset_1;
reg reset_2;
reg reset_3;
always@(posedge clock)
begin
reset_1<=reset;
reset_2<=reset_1;
reset_3<=reset_2;
end
assign io_sync_reset=reset_3;
endmodule
