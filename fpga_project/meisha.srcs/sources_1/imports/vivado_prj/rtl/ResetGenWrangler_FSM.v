module ResetGenWrangler_FSM  # (parameter RESET_CNT_WIDTH = 13) ( 
  input   debug_mode_sel_pad_glitch_free,
  input   auto_in_chiplink_clock,  // from d2d_sub d2d_clock clk_main_clk
  input   soft_reset_req,  // soft global reset
  input   auto_in_tile_clock,  // from mig blackbox ui_clk, source is sys clk / clk_main_clk
  input   jtag_ndreset,  // jtag debug ndrst // donnot use, use soft reset
  input   auto_in_main_clock,  // clk_main_clk
  input   pwr_hard_reset,  // hard reset | pwr reset
  input   in_ref_always_on_clk, 
  // pwr_hard_reset | jtag_ndreset | auto_in_2_reset
  // from auto_in_2_clock: d2d_sub d2d_clock clk_main_clk
  // output  auto_out_2_reset, 
  // pwr_hard_reset | jtag_ndreset | auto_in_2_reset
  // from auto_in_1_clock: mig blackbox ui_clk, source is sys clk / clk_main_clk
  // output  auto_out_1_reset, 
  //output  auto_out_0_clock, // main_clk
  output  auto_out_alway_on_reset,
  output  auto_out_chiplink_reset,
  output  auto_out_main_reset,
  output  auto_out_tile_reset,
  output  reg debug_mode_sel_latch
);

  localparam RESET_CNT   = 16'h500;

  localparam MAIN_RLS_CNT     = 16'h500;
  localparam CHIPLINK_RLS_CNT = 16'h700;
  localparam TILE_RLS_CNT     = 16'h1000;

  localparam  [1:0]     PWR_IDLE_STATE = 2'd0,    
                        PWR_RST_STATE  = 2'd1,    
                        PWR_RLS_STATE  = 2'd2;

  wire  pwr_reset_jtag_reset; 
  
  wire  auto_out_tile_reset_sync_reset;
  wire  auto_out_chiplink_reset_sync_reset;
  wire  auto_out_main_reset_sync_reset; // main_rst

  reg [1:0] pwr_cur_st, pwr_nxt_st;
  reg [RESET_CNT_WIDTH-1:0] pwr_reset_cnt;
  reg [RESET_CNT_WIDTH-1:0] pwr_rls_cnt;
  wire begin_rls_reset;
  wire soft_reset_req_extend_30;
  wire jtag_ndreset_req;  // edge detect 1 -> 0
  wire jtag_ndreset_req_extend_30;
  wire pwr_hard_reset_sync_main_clk;

  //assign auto_out_0_clock = auto_in_main_clock;

  ResetCatchAndSync_d3 pwr_hard_reset_sync_main_clk_ResetCatchAndSync_d3 ( 
    .clock(auto_in_main_clock),
    .reset(pwr_hard_reset),
    .io_sync_reset(pwr_hard_reset_sync_main_clk)
  );

  edge_detect jtag_ndreset_edge_detect (
      .clk_i(auto_in_main_clock),   // Clock
      .rst_ni(~pwr_hard_reset_sync_main_clk),  // Asynchronous reset active low
      .d_i(jtag_ndreset),     // data stream in
      .re_o(jtag_ndreset_req),    // rising edge detected
      .fe_o()     // falling edge detected
  );

  pulse_expander # (
      .WIDTH(30) 
      ) jtag_ndreset_req_pulse_expander(
        .clk(auto_in_main_clock),
        .rst_n(~pwr_hard_reset_sync_main_clk),
        .pulse_in(jtag_ndreset_req),
        .pulse_out(jtag_ndreset_req_extend_30)
      );

  pulse_expander # (
    .WIDTH(30) 
    ) soft_reset_req_pulse_expander(
      .clk(auto_in_main_clock),
      .rst_n(~pwr_hard_reset_sync_main_clk),
      .pulse_in(soft_reset_req),
      .pulse_out(soft_reset_req_extend_30)
    );


  assign pwr_reset_jtag_reset = pwr_hard_reset | jtag_ndreset; 

  always @(posedge in_ref_always_on_clk or posedge auto_out_alway_on_reset) begin

    if(auto_out_alway_on_reset) begin
      debug_mode_sel_latch <= 1'b0;
    end
    else if(pwr_reset_cnt == RESET_CNT) begin // pnly latch when por rst status
      debug_mode_sel_latch <= debug_mode_sel_pad_glitch_free;
    end

  end

  
  ResetCatchAndSync_d3 tile_reset_ResetCatchAndSync_d3 ( 
    .clock(auto_in_tile_clock),
    .reset(auto_out_tile_reset_sync_reset),
    .io_sync_reset(auto_out_tile_reset)
  );

  ResetCatchAndSync_d3 chiplink_reset_ResetCatchAndSync_d3 ( 
    .clock(auto_in_chiplink_clock),
    .reset(auto_out_chiplink_reset_sync_reset),
    .io_sync_reset(auto_out_chiplink_reset)
  );

  ResetCatchAndSync_d3 main_reset_ResetCatchAndSync_d3 ( 
    .clock(auto_in_main_clock),
    .reset(auto_out_main_reset_sync_reset),
    .io_sync_reset(auto_out_main_reset)
  );
  
  ResetCatchAndSync_d3 alway_on_ResetCatchAndSync_d3 ( 
    .clock(in_ref_always_on_clk),
    .reset(pwr_hard_reset),
    .io_sync_reset(auto_out_alway_on_reset)
  );

  assign begin_rls_reset = (pwr_cur_st == PWR_RST_STATE) &&  (pwr_reset_cnt >= RESET_CNT) ;

  assign auto_out_main_reset_sync_reset = ~((pwr_cur_st == PWR_RLS_STATE) &&  (pwr_rls_cnt >= RESET_CNT_WIDTH));
  assign auto_out_chiplink_reset_sync_reset = ~((pwr_cur_st == PWR_RLS_STATE) &&  (pwr_rls_cnt >= CHIPLINK_RLS_CNT));
  assign auto_out_tile_reset_sync_reset = ~((pwr_cur_st == PWR_RLS_STATE) &&  (pwr_rls_cnt >= TILE_RLS_CNT));

  always @(posedge in_ref_always_on_clk or posedge pwr_hard_reset) begin
    if(pwr_hard_reset) begin
      pwr_reset_cnt <= {RESET_CNT_WIDTH{1'b0}};
    end
    else if (pwr_cur_st == PWR_RST_STATE) begin
      if(pwr_reset_cnt < {RESET_CNT_WIDTH{1'b1}}) begin
        pwr_reset_cnt <= pwr_reset_cnt + 1'd1;
      end
    end
    else begin
      pwr_reset_cnt <= {RESET_CNT_WIDTH{1'b0}};
    end
  end

  always @(posedge in_ref_always_on_clk or posedge pwr_hard_reset) begin
    if(pwr_hard_reset) begin
      pwr_rls_cnt <= {RESET_CNT_WIDTH{1'b0}};
    end
    else if (pwr_cur_st == PWR_RLS_STATE) begin
      if(pwr_rls_cnt < {RESET_CNT_WIDTH{1'b1}}) begin
        pwr_rls_cnt <= pwr_rls_cnt + 1'd1;
      end
    end
    else begin
      pwr_rls_cnt <= {RESET_CNT_WIDTH{1'b0}};
    end
  end

  always @(posedge in_ref_always_on_clk or posedge pwr_hard_reset) begin
    if(pwr_hard_reset) begin
      pwr_cur_st <= PWR_IDLE_STATE;
    end
    else begin
      pwr_cur_st <= pwr_nxt_st;
    end
  end

  always @(*) begin

    case(pwr_cur_st)
      PWR_IDLE_STATE: begin
        pwr_nxt_st = PWR_RST_STATE;
      end
      PWR_RST_STATE: begin
        if(begin_rls_reset) begin
          pwr_nxt_st = PWR_RLS_STATE;
        end
        else begin
          pwr_nxt_st = pwr_cur_st;
        end
      end
      PWR_RLS_STATE: begin
        if(soft_reset_req_extend_30|jtag_ndreset_req_extend_30) begin   // global reset
          pwr_nxt_st = PWR_IDLE_STATE;
        end
        else begin
          pwr_nxt_st = pwr_cur_st;
        end
      end
      default: begin
        pwr_nxt_st = PWR_IDLE_STATE;
      end

    endcase

  end

endmodule
