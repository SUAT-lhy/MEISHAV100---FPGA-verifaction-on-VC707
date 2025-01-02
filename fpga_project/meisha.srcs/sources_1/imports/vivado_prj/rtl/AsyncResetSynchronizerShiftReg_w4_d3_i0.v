module AsyncResetSynchronizerShiftReg_w4_d3_i0( 
  input        clock, 
  input        reset, 
  input  [3:0] io_d, 
  output [3:0] io_q 
);
  wire  sync_0_clock; 
  wire  sync_0_reset; 
  wire [3:0] sync_0_io_d; 
  wire [3:0] sync_0_io_q; 
  wire  sync_0_io_en; 
  wire  sync_1_clock; 
  wire  sync_1_reset; 
  wire [3:0] sync_1_io_d; 
  wire [3:0] sync_1_io_q; 
  wire  sync_1_io_en; 
  wire  sync_2_clock; 
  wire  sync_2_reset; 
  wire [3:0] sync_2_io_d; 
  wire [3:0] sync_2_io_q; 
  wire  sync_2_io_en; 
  AsyncResetRegVec_w4_i0 sync_0 ( 
    .clock(sync_0_clock),
    .reset(sync_0_reset),
    .io_d(sync_0_io_d),
    .io_q(sync_0_io_q),
    .io_en(sync_0_io_en)
  );
  AsyncResetRegVec_w4_i0 sync_1 ( 
    .clock(sync_1_clock),
    .reset(sync_1_reset),
    .io_d(sync_1_io_d),
    .io_q(sync_1_io_q),
    .io_en(sync_1_io_en)
  );
  AsyncResetRegVec_w4_i0 sync_2 ( 
    .clock(sync_2_clock),
    .reset(sync_2_reset),
    .io_d(sync_2_io_d),
    .io_q(sync_2_io_q),
    .io_en(sync_2_io_en)
  );
  assign io_q = sync_0_io_q; 
  assign sync_0_clock = clock; 
  assign sync_0_reset = reset; 
  assign sync_0_io_d = sync_1_io_q; 
  assign sync_0_io_en = 1'h1; 
  assign sync_1_clock = clock; 
  assign sync_1_reset = reset; 
  assign sync_1_io_d = sync_2_io_q; 
  assign sync_1_io_en = 1'h1; 
  assign sync_2_clock = clock; 
  assign sync_2_reset = reset; 
  assign sync_2_io_d = io_d; 
  assign sync_2_io_en = 1'h1; 
endmodule
