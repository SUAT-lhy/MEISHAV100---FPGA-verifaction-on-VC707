module AsyncQueueSource_10( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [2:0]  io_enq_bits_opcode, 
  input  [2:0]  io_enq_bits_param, 
  input  [2:0]  io_enq_bits_size, 
  input  [3:0]  io_enq_bits_source, 
  input  [37:0] io_enq_bits_address, 
  input  [7:0]  io_enq_bits_mask, 
  input  [63:0] io_enq_bits_data, 
  input         io_enq_bits_corrupt, 
  output [2:0]  io_async_mem_0_opcode, 
  output [2:0]  io_async_mem_0_param, 
  output [2:0]  io_async_mem_0_size, 
  output [3:0]  io_async_mem_0_source, 
  output [37:0] io_async_mem_0_address, 
  output [7:0]  io_async_mem_0_mask, 
  output [63:0] io_async_mem_0_data, 
  output        io_async_mem_0_corrupt, 
  output [2:0]  io_async_mem_1_opcode, 
  output [2:0]  io_async_mem_1_param, 
  output [2:0]  io_async_mem_1_size, 
  output [3:0]  io_async_mem_1_source, 
  output [37:0] io_async_mem_1_address, 
  output [7:0]  io_async_mem_1_mask, 
  output [63:0] io_async_mem_1_data, 
  output        io_async_mem_1_corrupt, 
  output [2:0]  io_async_mem_2_opcode, 
  output [2:0]  io_async_mem_2_param, 
  output [2:0]  io_async_mem_2_size, 
  output [3:0]  io_async_mem_2_source, 
  output [37:0] io_async_mem_2_address, 
  output [7:0]  io_async_mem_2_mask, 
  output [63:0] io_async_mem_2_data, 
  output        io_async_mem_2_corrupt, 
  output [2:0]  io_async_mem_3_opcode, 
  output [2:0]  io_async_mem_3_param, 
  output [2:0]  io_async_mem_3_size, 
  output [3:0]  io_async_mem_3_source, 
  output [37:0] io_async_mem_3_address, 
  output [7:0]  io_async_mem_3_mask, 
  output [63:0] io_async_mem_3_data, 
  output        io_async_mem_3_corrupt, 
  output [2:0]  io_async_mem_4_opcode, 
  output [2:0]  io_async_mem_4_param, 
  output [2:0]  io_async_mem_4_size, 
  output [3:0]  io_async_mem_4_source, 
  output [37:0] io_async_mem_4_address, 
  output [7:0]  io_async_mem_4_mask, 
  output [63:0] io_async_mem_4_data, 
  output        io_async_mem_4_corrupt, 
  output [2:0]  io_async_mem_5_opcode, 
  output [2:0]  io_async_mem_5_param, 
  output [2:0]  io_async_mem_5_size, 
  output [3:0]  io_async_mem_5_source, 
  output [37:0] io_async_mem_5_address, 
  output [7:0]  io_async_mem_5_mask, 
  output [63:0] io_async_mem_5_data, 
  output        io_async_mem_5_corrupt, 
  output [2:0]  io_async_mem_6_opcode, 
  output [2:0]  io_async_mem_6_param, 
  output [2:0]  io_async_mem_6_size, 
  output [3:0]  io_async_mem_6_source, 
  output [37:0] io_async_mem_6_address, 
  output [7:0]  io_async_mem_6_mask, 
  output [63:0] io_async_mem_6_data, 
  output        io_async_mem_6_corrupt, 
  output [2:0]  io_async_mem_7_opcode, 
  output [2:0]  io_async_mem_7_param, 
  output [2:0]  io_async_mem_7_size, 
  output [3:0]  io_async_mem_7_source, 
  output [37:0] io_async_mem_7_address, 
  output [7:0]  io_async_mem_7_mask, 
  output [63:0] io_async_mem_7_data, 
  output        io_async_mem_7_corrupt, 
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
  reg [2:0] mem_0_opcode; 
  reg [31:0] _RAND_0;
  reg [2:0] mem_0_param; 
  reg [31:0] _RAND_1;
  reg [2:0] mem_0_size; 
  reg [31:0] _RAND_2;
  reg [3:0] mem_0_source; 
  reg [31:0] _RAND_3;
  reg [37:0] mem_0_address; 
  reg [63:0] _RAND_4;
  reg [7:0] mem_0_mask; 
  reg [31:0] _RAND_5;
  reg [63:0] mem_0_data; 
  reg [63:0] _RAND_6;
  reg  mem_0_corrupt; 
  reg [31:0] _RAND_7;
  reg [2:0] mem_1_opcode; 
  reg [31:0] _RAND_8;
  reg [2:0] mem_1_param; 
  reg [31:0] _RAND_9;
  reg [2:0] mem_1_size; 
  reg [31:0] _RAND_10;
  reg [3:0] mem_1_source; 
  reg [31:0] _RAND_11;
  reg [37:0] mem_1_address; 
  reg [63:0] _RAND_12;
  reg [7:0] mem_1_mask; 
  reg [31:0] _RAND_13;
  reg [63:0] mem_1_data; 
  reg [63:0] _RAND_14;
  reg  mem_1_corrupt; 
  reg [31:0] _RAND_15;
  reg [2:0] mem_2_opcode; 
  reg [31:0] _RAND_16;
  reg [2:0] mem_2_param; 
  reg [31:0] _RAND_17;
  reg [2:0] mem_2_size; 
  reg [31:0] _RAND_18;
  reg [3:0] mem_2_source; 
  reg [31:0] _RAND_19;
  reg [37:0] mem_2_address; 
  reg [63:0] _RAND_20;
  reg [7:0] mem_2_mask; 
  reg [31:0] _RAND_21;
  reg [63:0] mem_2_data; 
  reg [63:0] _RAND_22;
  reg  mem_2_corrupt; 
  reg [31:0] _RAND_23;
  reg [2:0] mem_3_opcode; 
  reg [31:0] _RAND_24;
  reg [2:0] mem_3_param; 
  reg [31:0] _RAND_25;
  reg [2:0] mem_3_size; 
  reg [31:0] _RAND_26;
  reg [3:0] mem_3_source; 
  reg [31:0] _RAND_27;
  reg [37:0] mem_3_address; 
  reg [63:0] _RAND_28;
  reg [7:0] mem_3_mask; 
  reg [31:0] _RAND_29;
  reg [63:0] mem_3_data; 
  reg [63:0] _RAND_30;
  reg  mem_3_corrupt; 
  reg [31:0] _RAND_31;
  reg [2:0] mem_4_opcode; 
  reg [31:0] _RAND_32;
  reg [2:0] mem_4_param; 
  reg [31:0] _RAND_33;
  reg [2:0] mem_4_size; 
  reg [31:0] _RAND_34;
  reg [3:0] mem_4_source; 
  reg [31:0] _RAND_35;
  reg [37:0] mem_4_address; 
  reg [63:0] _RAND_36;
  reg [7:0] mem_4_mask; 
  reg [31:0] _RAND_37;
  reg [63:0] mem_4_data; 
  reg [63:0] _RAND_38;
  reg  mem_4_corrupt; 
  reg [31:0] _RAND_39;
  reg [2:0] mem_5_opcode; 
  reg [31:0] _RAND_40;
  reg [2:0] mem_5_param; 
  reg [31:0] _RAND_41;
  reg [2:0] mem_5_size; 
  reg [31:0] _RAND_42;
  reg [3:0] mem_5_source; 
  reg [31:0] _RAND_43;
  reg [37:0] mem_5_address; 
  reg [63:0] _RAND_44;
  reg [7:0] mem_5_mask; 
  reg [31:0] _RAND_45;
  reg [63:0] mem_5_data; 
  reg [63:0] _RAND_46;
  reg  mem_5_corrupt; 
  reg [31:0] _RAND_47;
  reg [2:0] mem_6_opcode; 
  reg [31:0] _RAND_48;
  reg [2:0] mem_6_param; 
  reg [31:0] _RAND_49;
  reg [2:0] mem_6_size; 
  reg [31:0] _RAND_50;
  reg [3:0] mem_6_source; 
  reg [31:0] _RAND_51;
  reg [37:0] mem_6_address; 
  reg [63:0] _RAND_52;
  reg [7:0] mem_6_mask; 
  reg [31:0] _RAND_53;
  reg [63:0] mem_6_data; 
  reg [63:0] _RAND_54;
  reg  mem_6_corrupt; 
  reg [31:0] _RAND_55;
  reg [2:0] mem_7_opcode; 
  reg [31:0] _RAND_56;
  reg [2:0] mem_7_param; 
  reg [31:0] _RAND_57;
  reg [2:0] mem_7_size; 
  reg [31:0] _RAND_58;
  reg [3:0] mem_7_source; 
  reg [31:0] _RAND_59;
  reg [37:0] mem_7_address; 
  reg [63:0] _RAND_60;
  reg [7:0] mem_7_mask; 
  reg [31:0] _RAND_61;
  reg [63:0] mem_7_data; 
  reg [63:0] _RAND_62;
  reg  mem_7_corrupt; 
  reg [31:0] _RAND_63;
  wire  _T_64; 
  wire  sink_ready; 
  wire  _T_65; 
  wire [3:0] _GEN_128; 
  wire [3:0] _T_69; 
  wire [3:0] _T_70; 
  wire [2:0] _T_71; 
  wire [3:0] _GEN_129; 
  wire [3:0] widx; 
  wire [3:0] ridx; 
  wire [3:0] _T_73; 
  wire  _T_74; 
  wire [2:0] _T_75; 
  wire  _T_76; 
  wire [2:0] _GEN_130; 
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
  assign _GEN_128 = {{3'd0}, _T_64}; 
  assign _T_69 = widx_bin_io_q + _GEN_128; 
  assign _T_70 = _T_65 ? 4'h0 : _T_69; 
  assign _T_71 = _T_70[3:1]; 
  assign _GEN_129 = {{1'd0}, _T_71}; 
  assign widx = _T_70 ^ _GEN_129; 
  assign ridx = ridx_gray_io_q; 
  assign _T_73 = ridx ^ 4'hc; 
  assign _T_74 = widx != _T_73; 
  assign _T_75 = io_async_widx[2:0]; 
  assign _T_76 = io_async_widx[3]; 
  assign _GEN_130 = {{2'd0}, _T_76}; 
  assign _T_77 = _GEN_130 << 2; 
  assign index = _T_75 ^ _T_77; 
  assign ready_reg_1 = ready_reg_io_q; 
  assign _T_82 = io_async_safe_sink_reset_n == 1'h0; 
  assign io_enq_ready = ready_reg_1 & sink_ready; 
  assign io_async_mem_0_opcode = mem_0_opcode; 
  assign io_async_mem_0_param = mem_0_param; 
  assign io_async_mem_0_size = mem_0_size; 
  assign io_async_mem_0_source = mem_0_source; 
  assign io_async_mem_0_address = mem_0_address; 
  assign io_async_mem_0_mask = mem_0_mask; 
  assign io_async_mem_0_data = mem_0_data; 
  assign io_async_mem_0_corrupt = mem_0_corrupt; 
  assign io_async_mem_1_opcode = mem_1_opcode; 
  assign io_async_mem_1_param = mem_1_param; 
  assign io_async_mem_1_size = mem_1_size; 
  assign io_async_mem_1_source = mem_1_source; 
  assign io_async_mem_1_address = mem_1_address; 
  assign io_async_mem_1_mask = mem_1_mask; 
  assign io_async_mem_1_data = mem_1_data; 
  assign io_async_mem_1_corrupt = mem_1_corrupt; 
  assign io_async_mem_2_opcode = mem_2_opcode; 
  assign io_async_mem_2_param = mem_2_param; 
  assign io_async_mem_2_size = mem_2_size; 
  assign io_async_mem_2_source = mem_2_source; 
  assign io_async_mem_2_address = mem_2_address; 
  assign io_async_mem_2_mask = mem_2_mask; 
  assign io_async_mem_2_data = mem_2_data; 
  assign io_async_mem_2_corrupt = mem_2_corrupt; 
  assign io_async_mem_3_opcode = mem_3_opcode; 
  assign io_async_mem_3_param = mem_3_param; 
  assign io_async_mem_3_size = mem_3_size; 
  assign io_async_mem_3_source = mem_3_source; 
  assign io_async_mem_3_address = mem_3_address; 
  assign io_async_mem_3_mask = mem_3_mask; 
  assign io_async_mem_3_data = mem_3_data; 
  assign io_async_mem_3_corrupt = mem_3_corrupt; 
  assign io_async_mem_4_opcode = mem_4_opcode; 
  assign io_async_mem_4_param = mem_4_param; 
  assign io_async_mem_4_size = mem_4_size; 
  assign io_async_mem_4_source = mem_4_source; 
  assign io_async_mem_4_address = mem_4_address; 
  assign io_async_mem_4_mask = mem_4_mask; 
  assign io_async_mem_4_data = mem_4_data; 
  assign io_async_mem_4_corrupt = mem_4_corrupt; 
  assign io_async_mem_5_opcode = mem_5_opcode; 
  assign io_async_mem_5_param = mem_5_param; 
  assign io_async_mem_5_size = mem_5_size; 
  assign io_async_mem_5_source = mem_5_source; 
  assign io_async_mem_5_address = mem_5_address; 
  assign io_async_mem_5_mask = mem_5_mask; 
  assign io_async_mem_5_data = mem_5_data; 
  assign io_async_mem_5_corrupt = mem_5_corrupt; 
  assign io_async_mem_6_opcode = mem_6_opcode; 
  assign io_async_mem_6_param = mem_6_param; 
  assign io_async_mem_6_size = mem_6_size; 
  assign io_async_mem_6_source = mem_6_source; 
  assign io_async_mem_6_address = mem_6_address; 
  assign io_async_mem_6_mask = mem_6_mask; 
  assign io_async_mem_6_data = mem_6_data; 
  assign io_async_mem_6_corrupt = mem_6_corrupt; 
  assign io_async_mem_7_opcode = mem_7_opcode; 
  assign io_async_mem_7_param = mem_7_param; 
  assign io_async_mem_7_size = mem_7_size; 
  assign io_async_mem_7_source = mem_7_source; 
  assign io_async_mem_7_address = mem_7_address; 
  assign io_async_mem_7_mask = mem_7_mask; 
  assign io_async_mem_7_data = mem_7_data; 
  assign io_async_mem_7_corrupt = mem_7_corrupt; 
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
  assign widx_gray_io_d = _T_70 ^ _GEN_129; 
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
  _RAND_0 = {1{`RANDOM}};
  mem_0_opcode = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_param = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mem_0_size = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mem_0_source = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  mem_0_address = _RAND_4[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  mem_0_mask = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  mem_0_data = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mem_0_corrupt = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  mem_1_opcode = _RAND_8[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  mem_1_param = _RAND_9[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  mem_1_size = _RAND_10[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  mem_1_source = _RAND_11[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {2{`RANDOM}};
  mem_1_address = _RAND_12[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  mem_1_mask = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {2{`RANDOM}};
  mem_1_data = _RAND_14[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  mem_1_corrupt = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  mem_2_opcode = _RAND_16[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  mem_2_param = _RAND_17[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  mem_2_size = _RAND_18[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  mem_2_source = _RAND_19[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {2{`RANDOM}};
  mem_2_address = _RAND_20[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  mem_2_mask = _RAND_21[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {2{`RANDOM}};
  mem_2_data = _RAND_22[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  mem_2_corrupt = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  mem_3_opcode = _RAND_24[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  mem_3_param = _RAND_25[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  mem_3_size = _RAND_26[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  mem_3_source = _RAND_27[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {2{`RANDOM}};
  mem_3_address = _RAND_28[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  mem_3_mask = _RAND_29[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {2{`RANDOM}};
  mem_3_data = _RAND_30[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  mem_3_corrupt = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  mem_4_opcode = _RAND_32[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  mem_4_param = _RAND_33[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  mem_4_size = _RAND_34[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  mem_4_source = _RAND_35[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {2{`RANDOM}};
  mem_4_address = _RAND_36[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  mem_4_mask = _RAND_37[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {2{`RANDOM}};
  mem_4_data = _RAND_38[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  mem_4_corrupt = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  mem_5_opcode = _RAND_40[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  mem_5_param = _RAND_41[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  mem_5_size = _RAND_42[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  mem_5_source = _RAND_43[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {2{`RANDOM}};
  mem_5_address = _RAND_44[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  mem_5_mask = _RAND_45[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {2{`RANDOM}};
  mem_5_data = _RAND_46[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  mem_5_corrupt = _RAND_47[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  mem_6_opcode = _RAND_48[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  mem_6_param = _RAND_49[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  mem_6_size = _RAND_50[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  mem_6_source = _RAND_51[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {2{`RANDOM}};
  mem_6_address = _RAND_52[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  mem_6_mask = _RAND_53[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {2{`RANDOM}};
  mem_6_data = _RAND_54[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  mem_6_corrupt = _RAND_55[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  mem_7_opcode = _RAND_56[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  mem_7_param = _RAND_57[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  mem_7_size = _RAND_58[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  mem_7_source = _RAND_59[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {2{`RANDOM}};
  mem_7_address = _RAND_60[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  mem_7_mask = _RAND_61[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {2{`RANDOM}};
  mem_7_data = _RAND_62[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  mem_7_corrupt = _RAND_63[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_opcode <= io_enq_bits_opcode;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_param <= io_enq_bits_param;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_size <= io_enq_bits_size;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_source <= io_enq_bits_source;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_address <= io_enq_bits_address;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_mask <= io_enq_bits_mask;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h0 == index) begin
        mem_0_corrupt <= io_enq_bits_corrupt;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_opcode <= io_enq_bits_opcode;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_param <= io_enq_bits_param;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_size <= io_enq_bits_size;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_source <= io_enq_bits_source;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_address <= io_enq_bits_address;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_mask <= io_enq_bits_mask;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h1 == index) begin
        mem_1_corrupt <= io_enq_bits_corrupt;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_opcode <= io_enq_bits_opcode;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_param <= io_enq_bits_param;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_size <= io_enq_bits_size;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_source <= io_enq_bits_source;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_address <= io_enq_bits_address;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_mask <= io_enq_bits_mask;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h2 == index) begin
        mem_2_corrupt <= io_enq_bits_corrupt;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_opcode <= io_enq_bits_opcode;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_param <= io_enq_bits_param;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_size <= io_enq_bits_size;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_source <= io_enq_bits_source;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_address <= io_enq_bits_address;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_mask <= io_enq_bits_mask;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h3 == index) begin
        mem_3_corrupt <= io_enq_bits_corrupt;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_opcode <= io_enq_bits_opcode;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_param <= io_enq_bits_param;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_size <= io_enq_bits_size;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_source <= io_enq_bits_source;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_address <= io_enq_bits_address;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_mask <= io_enq_bits_mask;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h4 == index) begin
        mem_4_corrupt <= io_enq_bits_corrupt;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_opcode <= io_enq_bits_opcode;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_param <= io_enq_bits_param;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_size <= io_enq_bits_size;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_source <= io_enq_bits_source;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_address <= io_enq_bits_address;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_mask <= io_enq_bits_mask;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h5 == index) begin
        mem_5_corrupt <= io_enq_bits_corrupt;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_opcode <= io_enq_bits_opcode;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_param <= io_enq_bits_param;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_size <= io_enq_bits_size;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_source <= io_enq_bits_source;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_address <= io_enq_bits_address;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_mask <= io_enq_bits_mask;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h6 == index) begin
        mem_6_corrupt <= io_enq_bits_corrupt;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_opcode <= io_enq_bits_opcode;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_param <= io_enq_bits_param;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_size <= io_enq_bits_size;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_source <= io_enq_bits_source;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_address <= io_enq_bits_address;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_mask <= io_enq_bits_mask;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_data <= io_enq_bits_data;
      end
    end
    if (_T_64) begin
      if (3'h7 == index) begin
        mem_7_corrupt <= io_enq_bits_corrupt;
      end
    end
  end
endmodule
