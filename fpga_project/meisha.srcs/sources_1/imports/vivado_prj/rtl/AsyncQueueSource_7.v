module AsyncQueueSource_7( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [63:0] io_enq_bits_data, 
  input  [7:0]  io_enq_bits_strb, 
  input         io_enq_bits_last, 
  output [63:0] io_async_mem_0_data, 
  output [7:0]  io_async_mem_0_strb, 
  output        io_async_mem_0_last, 
  output [63:0] io_async_mem_1_data, 
  output [7:0]  io_async_mem_1_strb, 
  output        io_async_mem_1_last, 
  output [63:0] io_async_mem_2_data, 
  output [7:0]  io_async_mem_2_strb, 
  output        io_async_mem_2_last, 
  output [63:0] io_async_mem_3_data, 
  output [7:0]  io_async_mem_3_strb, 
  output        io_async_mem_3_last, 
  output [63:0] io_async_mem_4_data, 
  output [7:0]  io_async_mem_4_strb, 
  output        io_async_mem_4_last, 
  output [63:0] io_async_mem_5_data, 
  output [7:0]  io_async_mem_5_strb, 
  output        io_async_mem_5_last, 
  output [63:0] io_async_mem_6_data, 
  output [7:0]  io_async_mem_6_strb, 
  output        io_async_mem_6_last, 
  output [63:0] io_async_mem_7_data, 
  output [7:0]  io_async_mem_7_strb, 
  output        io_async_mem_7_last, 
  input  [3:0]  io_async_ridx, 
  output [3:0]  io_async_widx, 
  input         io_async_safe_ridx_valid, 
  output        io_async_safe_widx_valid, 
  output        io_async_safe_source_reset_n, 
  input         io_async_safe_sink_reset_n 
);
  wire  widx_bin_clock; 
  wire  widx_bin_reset; 
  wire [3:0] widx_bin_io_d; 
  wire [3:0] widx_bin_io_q; 
  wire  widx_bin_io_en; 
  wire  ridx_gray_clock; 
  wire  ridx_gray_reset; 
  wire [3:0] ridx_gray_io_d; 
  wire [3:0] ridx_gray_io_q; 
  wire  ready_reg_clock; 
  wire  ready_reg_reset; 
  wire  ready_reg_io_d; 
  wire  ready_reg_io_q; 
  wire  ready_reg_io_en; 
  wire  widx_gray_clock; 
  wire  widx_gray_reset; 
  wire [3:0] widx_gray_io_d; 
  wire [3:0] widx_gray_io_q; 
  wire  widx_gray_io_en; 
  wire  AsyncValidSync_clock; 
  wire  AsyncValidSync_reset; 
  wire  AsyncValidSync_io_in; 
  wire  AsyncValidSync_io_out; 
  wire  AsyncValidSync_1_clock; 
  wire  AsyncValidSync_1_reset; 
  wire  AsyncValidSync_1_io_in; 
  wire  AsyncValidSync_1_io_out; 
  wire  AsyncValidSync_2_clock; 
  wire  AsyncValidSync_2_reset; 
  wire  AsyncValidSync_2_io_in; 
  wire  AsyncValidSync_2_io_out; 
  reg [63:0] mem_0_data; 
  reg [63:0] _RAND_0;
  reg [7:0] mem_0_strb; 
  reg [31:0] _RAND_1;
  reg  mem_0_last; 
  reg [31:0] _RAND_2;
  reg [63:0] mem_1_data; 
  reg [63:0] _RAND_3;
  reg [7:0] mem_1_strb; 
  reg [31:0] _RAND_4;
  reg  mem_1_last; 
  reg [31:0] _RAND_5;
  reg [63:0] mem_2_data; 
  reg [63:0] _RAND_6;
  reg [7:0] mem_2_strb; 
  reg [31:0] _RAND_7;
  reg  mem_2_last; 
  reg [31:0] _RAND_8;
  reg [63:0] mem_3_data; 
  reg [63:0] _RAND_9;
  reg [7:0] mem_3_strb; 
  reg [31:0] _RAND_10;
  reg  mem_3_last; 
  reg [31:0] _RAND_11;
  reg [63:0] mem_4_data; 
  reg [63:0] _RAND_12;
  reg [7:0] mem_4_strb; 
  reg [31:0] _RAND_13;
  reg  mem_4_last; 
  reg [31:0] _RAND_14;
  reg [63:0] mem_5_data; 
  reg [63:0] _RAND_15;
  reg [7:0] mem_5_strb; 
  reg [31:0] _RAND_16;
  reg  mem_5_last; 
  reg [31:0] _RAND_17;
  reg [63:0] mem_6_data; 
  reg [63:0] _RAND_18;
  reg [7:0] mem_6_strb; 
  reg [31:0] _RAND_19;
  reg  mem_6_last; 
  reg [31:0] _RAND_20;
  reg [63:0] mem_7_data; 
  reg [63:0] _RAND_21;
  reg [7:0] mem_7_strb; 
  reg [31:0] _RAND_22;
  reg  mem_7_last; 
  reg [31:0] _RAND_23;
  wire  _T_64; 
  wire  sink_ready; 
  wire  _T_65; 
  wire [3:0] _GEN_48; 
  wire [3:0] _T_69; 
  wire [3:0] _T_70; 
  wire [2:0] _T_71; 
  wire [3:0] _GEN_49; 
  wire [3:0] widx; 
  wire [3:0] ridx; 
  wire [3:0] _T_73; 
  wire  _T_74; 
  wire [2:0] _T_75; 
  wire  _T_76; 
  wire [2:0] _GEN_50; 
  wire [2:0] _T_77; 
  wire [2:0] index; 
  wire  ready_reg_1; 
  wire  _T_82; 
  AsyncResetRegVec_w4_i0 widx_bin ( 
    .clock(widx_bin_clock),
    .reset(widx_bin_reset),
    .io_d(widx_bin_io_d),
    .io_q(widx_bin_io_q),
    .io_en(widx_bin_io_en)
  );
  AsyncResetSynchronizerShiftReg_w4_d3_i0 ridx_gray ( 
    .clock(ridx_gray_clock),
    .reset(ridx_gray_reset),
    .io_d(ridx_gray_io_d),
    .io_q(ridx_gray_io_q)
  );
  AsyncResetRegVec_w1_i0 ready_reg ( 
    .clock(ready_reg_clock),
    .reset(ready_reg_reset),
    .io_d(ready_reg_io_d),
    .io_q(ready_reg_io_q),
    .io_en(ready_reg_io_en)
  );
  AsyncResetRegVec_w4_i0 widx_gray ( 
    .clock(widx_gray_clock),
    .reset(widx_gray_reset),
    .io_d(widx_gray_io_d),
    .io_q(widx_gray_io_q),
    .io_en(widx_gray_io_en)
  );
  AsyncValidSync AsyncValidSync ( 
    .clock(AsyncValidSync_clock),
    .reset(AsyncValidSync_reset),
    .io_in(AsyncValidSync_io_in),
    .io_out(AsyncValidSync_io_out)
  );
  AsyncValidSync_1 AsyncValidSync_1 ( 
    .clock(AsyncValidSync_1_clock),
    .reset(AsyncValidSync_1_reset),
    .io_in(AsyncValidSync_1_io_in),
    .io_out(AsyncValidSync_1_io_out)
  );
  AsyncValidSync_2 AsyncValidSync_2 ( 
    .clock(AsyncValidSync_2_clock),
    .reset(AsyncValidSync_2_reset),
    .io_in(AsyncValidSync_2_io_in),
    .io_out(AsyncValidSync_2_io_out)
  );
  assign _T_64 = io_enq_ready & io_enq_valid; 
  assign sink_ready = AsyncValidSync_2_io_out; 
  assign _T_65 = sink_ready == 1'h0; 
  assign _GEN_48 = {{3'd0}, _T_64}; 
  assign _T_69 = widx_bin_io_q + _GEN_48; 
  assign _T_70 = _T_65 ? 4'h0 : _T_69; 
  assign _T_71 = _T_70[3:1]; 
  assign _GEN_49 = {{1'd0}, _T_71}; 
  assign widx = _T_70 ^ _GEN_49; 
  assign ridx = ridx_gray_io_q; 
  assign _T_73 = ridx ^ 4'hc; 
  assign _T_74 = widx != _T_73; 
  assign _T_75 = io_async_widx[2:0]; 
  assign _T_76 = io_async_widx[3]; 
  assign _GEN_50 = {{2'd0}, _T_76}; 
  assign _T_77 = _GEN_50 << 2; 
  assign index = _T_75 ^ _T_77; 
  assign ready_reg_1 = ready_reg_io_q; 
  assign _T_82 = io_async_safe_sink_reset_n == 1'h0; 
  assign io_enq_ready = ready_reg_1 & sink_ready; 
  assign io_async_mem_0_data = mem_0_data; 
  assign io_async_mem_0_strb = mem_0_strb; 
  assign io_async_mem_0_last = mem_0_last; 
  assign io_async_mem_1_data = mem_1_data; 
  assign io_async_mem_1_strb = mem_1_strb; 
  assign io_async_mem_1_last = mem_1_last; 
  assign io_async_mem_2_data = mem_2_data; 
  assign io_async_mem_2_strb = mem_2_strb; 
  assign io_async_mem_2_last = mem_2_last; 
  assign io_async_mem_3_data = mem_3_data; 
  assign io_async_mem_3_strb = mem_3_strb; 
  assign io_async_mem_3_last = mem_3_last; 
  assign io_async_mem_4_data = mem_4_data; 
  assign io_async_mem_4_strb = mem_4_strb; 
  assign io_async_mem_4_last = mem_4_last; 
  assign io_async_mem_5_data = mem_5_data; 
  assign io_async_mem_5_strb = mem_5_strb; 
  assign io_async_mem_5_last = mem_5_last; 
  assign io_async_mem_6_data = mem_6_data; 
  assign io_async_mem_6_strb = mem_6_strb; 
  assign io_async_mem_6_last = mem_6_last; 
  assign io_async_mem_7_data = mem_7_data; 
  assign io_async_mem_7_strb = mem_7_strb; 
  assign io_async_mem_7_last = mem_7_last; 
  assign io_async_widx = widx_gray_io_q; 
  assign io_async_safe_widx_valid = AsyncValidSync_io_out; 
  assign io_async_safe_source_reset_n = reset == 1'h0; 
  assign widx_bin_clock = clock; 
  assign widx_bin_reset = reset; 
  assign widx_bin_io_d = _T_65 ? 4'h0 : _T_69; 
  assign widx_bin_io_en = 1'h1; 
  assign ridx_gray_clock = clock; 
  assign ridx_gray_reset = reset; 
  assign ridx_gray_io_d = io_async_ridx; 
  assign ready_reg_clock = clock; 
  assign ready_reg_reset = reset; 
  assign ready_reg_io_d = sink_ready & _T_74; 
  assign ready_reg_io_en = 1'h1; 
  assign widx_gray_clock = clock; 
  assign widx_gray_reset = reset; 
  assign widx_gray_io_d = _T_70 ^ _GEN_49; 
  assign widx_gray_io_en = 1'h1; 
  assign AsyncValidSync_clock = clock; 
  assign AsyncValidSync_reset = reset | _T_82; 
  assign AsyncValidSync_io_in = 1'h1; 
  assign AsyncValidSync_1_clock = clock; 
  assign AsyncValidSync_1_reset = reset | _T_82; 
  assign AsyncValidSync_1_io_in = io_async_safe_ridx_valid; 
  assign AsyncValidSync_2_clock = clock; 
  assign AsyncValidSync_2_reset = reset; 
  assign AsyncValidSync_2_io_in = AsyncValidSync_1_io_out; 
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  mem_0_data = _RAND_0[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_strb = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mem_0_last = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {2{`RANDOM}};
  mem_1_data = _RAND_3[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  mem_1_strb = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  mem_1_last = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  mem_2_data = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mem_2_strb = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  mem_2_last = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {2{`RANDOM}};
  mem_3_data = _RAND_9[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  mem_3_strb = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  mem_3_last = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {2{`RANDOM}};
  mem_4_data = _RAND_12[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  mem_4_strb = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  mem_4_last = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {2{`RANDOM}};
  mem_5_data = _RAND_15[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  mem_5_strb = _RAND_16[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  mem_5_last = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {2{`RANDOM}};
  mem_6_data = _RAND_18[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  mem_6_strb = _RAND_19[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  mem_6_last = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {2{`RANDOM}};
  mem_7_data = _RAND_21[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  mem_7_strb = _RAND_22[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  mem_7_last = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_strb <= io_enq_bits_strb;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_last <= io_enq_bits_last;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_strb <= io_enq_bits_strb;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_last <= io_enq_bits_last;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_strb <= io_enq_bits_strb;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_last <= io_enq_bits_last;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_strb <= io_enq_bits_strb;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_last <= io_enq_bits_last;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_strb <= io_enq_bits_strb;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_last <= io_enq_bits_last;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_strb <= io_enq_bits_strb;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_last <= io_enq_bits_last;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_strb <= io_enq_bits_strb;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_last <= io_enq_bits_last;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_strb <= io_enq_bits_strb;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_last <= io_enq_bits_last;
      end
    end
  end
endmodule
