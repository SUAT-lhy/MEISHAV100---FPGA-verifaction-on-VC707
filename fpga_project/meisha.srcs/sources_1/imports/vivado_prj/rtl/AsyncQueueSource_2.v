module AsyncQueueSource_2( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [2:0]  io_enq_bits_opcode, 
  input  [1:0]  io_enq_bits_size, 
  input         io_enq_bits_source, 
  input  [31:0] io_enq_bits_data, 
  output [2:0]  io_async_mem_0_opcode, 
  output [1:0]  io_async_mem_0_size, 
  output        io_async_mem_0_source, 
  output [31:0] io_async_mem_0_data, 
  input         io_async_ridx, 
  output        io_async_widx, 
  input         io_async_safe_ridx_valid, 
  output        io_async_safe_widx_valid, 
  output        io_async_safe_source_reset_n, 
  input         io_async_safe_sink_reset_n 
);
  wire  widx_bin_clock; 
  wire  widx_bin_reset; 
  wire  widx_bin_io_d; 
  wire  widx_bin_io_q; 
  wire  widx_bin_io_en; 
  wire  ridx_gray_clock; 
  wire  ridx_gray_reset; 
  wire  ridx_gray_io_d; 
  wire  ridx_gray_io_q; 
  wire  ready_reg_clock; 
  wire  ready_reg_reset; 
  wire  ready_reg_io_d; 
  wire  ready_reg_io_q; 
  wire  ready_reg_io_en; 
  wire  widx_gray_clock; 
  wire  widx_gray_reset; 
  wire  widx_gray_io_d; 
  wire  widx_gray_io_q; 
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
  reg [1:0] mem_0_size; 
  reg [31:0] _RAND_1;
  reg  mem_0_source; 
  reg [31:0] _RAND_2;
  reg [31:0] mem_0_data; 
  reg [31:0] _RAND_3;
  wire  _T_43; 
  wire  sink_ready; 
  wire  _T_44; 
  wire  _T_48; 
  wire  widx; 
  wire  ridx; 
  wire  _T_52; 
  wire  _T_53; 
  wire  ready_reg_1; 
  wire  _T_58; 
  AsyncResetRegVec_w1_i0 widx_bin ( 
    .clock(widx_bin_clock),
    .reset(widx_bin_reset),
    .io_d(widx_bin_io_d),
    .io_q(widx_bin_io_q),
    .io_en(widx_bin_io_en)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 ridx_gray ( 
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
  AsyncResetRegVec_w1_i0 widx_gray ( 
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
  assign _T_43 = io_enq_ready & io_enq_valid; 
  assign sink_ready = AsyncValidSync_2_io_out; 
  assign _T_44 = sink_ready == 1'h0; 
  assign _T_48 = widx_bin_io_q + _T_43; 
  assign widx = _T_44 ? 1'h0 : _T_48; 
  assign ridx = ridx_gray_io_q; 
  assign _T_52 = ridx ^ 1'h1; 
  assign _T_53 = widx != _T_52; 
  assign ready_reg_1 = ready_reg_io_q; 
  assign _T_58 = io_async_safe_sink_reset_n == 1'h0; 
  assign io_enq_ready = ready_reg_1 & sink_ready; 
  assign io_async_mem_0_opcode = mem_0_opcode; 
  assign io_async_mem_0_size = mem_0_size; 
  assign io_async_mem_0_source = mem_0_source; 
  assign io_async_mem_0_data = mem_0_data; 
  assign io_async_widx = widx_gray_io_q; 
  assign io_async_safe_widx_valid = AsyncValidSync_io_out; 
  assign io_async_safe_source_reset_n = reset == 1'h0; 
  assign widx_bin_clock = clock; 
  assign widx_bin_reset = reset; 
  assign widx_bin_io_d = _T_44 ? 1'h0 : _T_48; 
  assign widx_bin_io_en = 1'h1; 
  assign ridx_gray_clock = clock; 
  assign ridx_gray_reset = reset; 
  assign ridx_gray_io_d = io_async_ridx; 
  assign ready_reg_clock = clock; 
  assign ready_reg_reset = reset; 
  assign ready_reg_io_d = sink_ready & _T_53; 
  assign ready_reg_io_en = 1'h1; 
  assign widx_gray_clock = clock; 
  assign widx_gray_reset = reset; 
  assign widx_gray_io_d = _T_44 ? 1'h0 : _T_48; 
  assign widx_gray_io_en = 1'h1; 
  assign AsyncValidSync_clock = clock; 
  assign AsyncValidSync_reset = reset | _T_58; 
  assign AsyncValidSync_io_in = 1'h1; 
  assign AsyncValidSync_1_clock = clock; 
  assign AsyncValidSync_1_reset = reset | _T_58; 
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
  mem_0_size = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mem_0_source = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mem_0_data = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_43) begin
      mem_0_opcode <= io_enq_bits_opcode;
    end
    if (_T_43) begin
      mem_0_size <= io_enq_bits_size;
    end
    if (_T_43) begin
      mem_0_source <= io_enq_bits_source;
    end
    if (_T_43) begin
      mem_0_data <= io_enq_bits_data;
    end
  end
endmodule
