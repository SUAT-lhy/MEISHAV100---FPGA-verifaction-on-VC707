module ResetGenWrangler( 
  input   debug_mode_sel_pad_glitch_free,
  input   auto_in_chiplink_clock,  // from d2d_sub d2d_clock clk_main_clk
  input   auto_in_2_reset,  // pcie lock state
  input   auto_in_tile_clock,  // from mig blackbox ui_clk, source is sys clk / clk_main_clk
  input   auto_in_1_reset,  // hard reset | pwr reset
  input   auto_in_main_clock,  // clk_main_clk
  input   auto_in_0_reset,  // hard reset | pwr reset
  input   in_ref_always_on_clk, 
  // auto_in_0_reset | auto_in_1_reset | auto_in_2_reset
  // from auto_in_2_clock: d2d_sub d2d_clock clk_main_clk
  // output  auto_out_2_reset, 
  // auto_in_0_reset | auto_in_1_reset | auto_in_2_reset
  // from auto_in_1_clock: mig blackbox ui_clk, source is sys clk / clk_main_clk
  // output  auto_out_1_reset, 
  output  auto_out_0_clock, // main_clk
  //output  auto_out_alway_on_reset,
  output  auto_out_chiplink_reset,
  //output  auto_out_main_reset,

  ///////////////////////////1111111111111111111
  //output  auto_out_tile_reset,
  output  reg debug_mode_sel_latch
);
  wire  debounce_clock; 
  wire  debounce_reset;   
  wire  auto_out_0_reset; // main_rst
  wire [12:0] debounce_io_d; 
  wire [12:0] debounce_io_q; 
  wire  debounce_io_en; 
  wire  deglitch_rst; 
  wire  deglitch_clk; 
  wire  deglitch_en; 
  wire  deglitch_q; 
  wire  deglitch_d; 
  wire  ResetCatchAndSync_d3_clock; 
  wire  ResetCatchAndSync_d3_reset; 
  wire  ResetCatchAndSync_d3_io_sync_reset; 
  wire  ResetCatchAndSync_d3_1_clock; 
  wire  ResetCatchAndSync_d3_1_reset; 
  wire  ResetCatchAndSync_d3_1_io_sync_reset; 
  wire  ResetCatchAndSync_d3_2_clock; 
  wire  ResetCatchAndSync_d3_2_reset; 
  wire  ResetCatchAndSync_d3_2_io_sync_reset; 
  wire  _T_21; 
  
  wire auto_out_tile_reset_sync_reset;

  // for tile reset
  wire        cnt_100;
  wire [12:0] cnt_100_io_q;
  wire [12:0] cnt_100_io_d;
  wire        cnt_100_io_en;
  wire ResetCatchAndSync_d3_topMod_clock;
  wire ResetCatchAndSync_d3_topMod_reset;
// module moduleName #(
//   parameters
// ) (
//   ports
// );
  
// endmodule

  always @(posedge in_ref_always_on_clk or posedge auto_out_0_reset) begin

    if(auto_out_0_reset) begin
      debug_mode_sel_latch <= 1'b1;
    end
    else if(cnt_100_io_q == 13'h20) begin
      debug_mode_sel_latch <= debug_mode_sel_pad_glitch_free;
    end

  end

  
  //ResetCatchAndSync_d3 tile_reset_ResetCatchAndSync_d3 ( 
  //  .clock(auto_in_tile_clock),
  //  .reset(auto_out_tile_reset_sync_reset),
  //  .io_sync_reset(auto_out_tile_reset)
  //);

  ResetCatchAndSync_d3 chiplink_reset_ResetCatchAndSync_d3 ( 
    .clock(auto_in_chiplink_clock),
    .reset(auto_out_0_reset),
    .io_sync_reset(auto_out_chiplink_reset)
  );

  //ResetCatchAndSync_d3 main_reset_ResetCatchAndSync_d3 ( 
  //  .clock(auto_in_main_clock),
  //  .reset(auto_out_0_reset),
  //  .io_sync_reset(auto_out_main_reset)
  //);
  
  ////
//展示放弃的模块
  //
  //ResetCatchAndSync_d3 alway_on_ResetCatchAndSync_d3 ( 
  //  .clock(in_ref_always_on_clk),
  //  .reset(auto_in_0_reset),
  //  .io_sync_reset(auto_out_alway_on_reset)
  //);

  AsyncResetRegVec_para # (
    .BIT_WIDTH(13)
  ) debounce ( 
    .clock(debounce_clock),
    .reset(debounce_reset),
    .io_d_i(debounce_io_d),
    .io_q_o(debounce_io_q),
    .io_en(debounce_io_en)
  );
  AsyncResetReg #(.RESET_VALUE(1)) deglitch ( 
    .rst(deglitch_rst),
    .clk(deglitch_clk),
    .en(deglitch_en),
    .q(deglitch_q),
    .d(deglitch_d)
  );
  ResetCatchAndSync_d3 ResetCatchAndSync_d3 ( 
    .clock(ResetCatchAndSync_d3_clock),
    .reset(ResetCatchAndSync_d3_reset),
    .io_sync_reset(ResetCatchAndSync_d3_io_sync_reset)
  );

  // ResetCatchAndSync_d3 ResetCatchAndSync_d3_1 ( 
  //   .clock(ResetCatchAndSync_d3_1_clock),
  //   .reset(ResetCatchAndSync_d3_1_reset),
  //   .io_sync_reset(ResetCatchAndSync_d3_1_io_sync_reset)
  // );
  // ResetCatchAndSync_d3 ResetCatchAndSync_d3_2 ( 
  //   .clock(ResetCatchAndSync_d3_2_clock),
  //   .reset(ResetCatchAndSync_d3_2_reset),
  //   .io_sync_reset(ResetCatchAndSync_d3_2_io_sync_reset)
  // );



  AsyncResetRegVec_para # (
    .BIT_WIDTH(13)
  ) debounce_1 ( 
    .clock(in_ref_always_on_clk),
    .reset(auto_out_0_reset),
    .io_d_i(cnt_100_io_d),
    .io_q_o(cnt_100_io_q),
    .io_en(cnt_100_io_en)
  );
  wire  deglitch_1_q;
  wire  deglitch_1_d;

  AsyncResetReg #(.RESET_VALUE(1)) deglitch_1 ( 
    .rst(auto_out_0_reset),
    .clk(in_ref_always_on_clk),
    .en(1'b1),
    .q(deglitch_1_q),
    .d(deglitch_1_d)
  );
  
  ResetCatchAndSync_d3 ResetCatchAndSync_d3_5 ( 
    .clock(ResetCatchAndSync_d3_topMod_clock),
    .reset(ResetCatchAndSync_d3_topMod_reset),
    .io_sync_reset(auto_out_tile_reset_sync_reset)
  );

  assign _T_21 = auto_in_0_reset | auto_in_1_reset; 
  //assign auto_out_2_reset = ResetCatchAndSync_d3_2_io_sync_reset; 
  //assign auto_out_1_reset = ResetCatchAndSync_d3_1_io_sync_reset; 
  assign auto_out_0_clock = auto_in_main_clock; 
  assign auto_out_0_reset = ResetCatchAndSync_d3_io_sync_reset; 
  assign debounce_clock = in_ref_always_on_clk; 
  assign debounce_reset = _T_21 | auto_in_2_reset; 
  assign debounce_io_d = debounce_io_q + 13'h1; 
  assign debounce_io_en = debounce_io_q != 13'h388; 
  assign deglitch_rst = _T_21 | auto_in_2_reset; 
  assign deglitch_clk = in_ref_always_on_clk; 
  assign deglitch_en = 1'h1; 
  assign deglitch_d = debounce_io_q != 13'h388; 
  assign ResetCatchAndSync_d3_clock = in_ref_always_on_clk; 
  assign ResetCatchAndSync_d3_reset = deglitch_q; 
  assign ResetCatchAndSync_d3_1_clock = 1'b0; 
  assign ResetCatchAndSync_d3_1_reset = deglitch_q; 
  assign ResetCatchAndSync_d3_2_clock = 1'b0; 
  assign ResetCatchAndSync_d3_2_reset = deglitch_q; 
  
/*-------------------------------------------------------*/

  assign cnt_100_io_d = cnt_100_io_q + 13'd1; 
  assign cnt_100_io_en = cnt_100_io_q != 13'h300; 
  assign deglitch_1_d = cnt_100_io_q != 13'h300;
  
  assign ResetCatchAndSync_d3_topMod_clock = in_ref_always_on_clk;
  assign deglitch_1_d = cnt_100_io_q != 13'h300; 
  assign ResetCatchAndSync_d3_topMod_reset = deglitch_1_q;



endmodule
