module TLBroadcastTracker_1( 
  input         clock, 
  input         reset, 
  input         io_in_a_first, 
  output        io_in_a_ready, 
  input         io_in_a_valid, 
  input  [2:0]  io_in_a_bits_opcode, 
  input  [2:0]  io_in_a_bits_param, 
  input  [2:0]  io_in_a_bits_size, 
  input  [4:0]  io_in_a_bits_source, 
  input  [31:0] io_in_a_bits_address, 
  input  [7:0]  io_in_a_bits_mask, 
  input  [63:0] io_in_a_bits_data, 
  input         io_out_a_ready, 
  output        io_out_a_valid, 
  output [2:0]  io_out_a_bits_opcode, 
  output [2:0]  io_out_a_bits_param, 
  output [2:0]  io_out_a_bits_size, 
  output [6:0]  io_out_a_bits_source, 
  output [31:0] io_out_a_bits_address, 
  output [7:0]  io_out_a_bits_mask, 
  output [63:0] io_out_a_bits_data, 
  input  [2:0]  io_probe, 
  input         io_probenack, 
  input         io_probedack, 
  input         io_d_last, 
  input         io_e_last, 
  output [4:0]  io_source, 
  output [25:0] io_line, 
  output        io_idle 
);
  wire  o_data_clock; 
  wire  o_data_reset; 
  wire  o_data_io_enq_ready; 
  wire  o_data_io_enq_valid; 
  wire [7:0] o_data_io_enq_bits_mask; 
  wire [63:0] o_data_io_enq_bits_data; 
  wire  o_data_io_deq_ready; 
  wire  o_data_io_deq_valid; 
  wire [7:0] o_data_io_deq_bits_mask; 
  wire [63:0] o_data_io_deq_bits_data; 
  reg  got_e; 
  reg [31:0] _RAND_0;
  reg  sent_d; 
  reg [31:0] _RAND_1;
  reg [2:0] opcode; 
  reg [31:0] _RAND_2;
  reg [2:0] param; 
  reg [31:0] _RAND_3;
  reg [2:0] size; 
  reg [31:0] _RAND_4;
  reg [4:0] source; 
  reg [31:0] _RAND_5;
  reg [31:0] address; 
  reg [31:0] _RAND_6;
  reg [2:0] count; 
  reg [31:0] _RAND_7;
  wire  idle; 
  wire  _T_26; 
  wire  _T_27; 
  wire  _T_29; 
  wire  _T_30; 
  wire  _T_31; 
  wire  _T_32; 
  wire  _T_33; 
  wire  _T_34; 
  wire  _T_36; 
  wire  _T_37; 
  wire  _T_38; 
  wire  _T_40; 
  wire  _T_41; 
  wire  _T_42; 
  wire  _T_43; 
  wire  _T_45; 
  wire  _T_46; 
  wire  _T_47; 
  wire [1:0] _T_48; 
  wire [2:0] _GEN_11; 
  wire [3:0] _T_49; 
  wire [3:0] _T_50; 
  wire [2:0] _T_51; 
  wire  _T_59; 
  wire  _T_60; 
  wire  i_data_ready; 
  wire  probe_done; 
  wire  _T_65; 
  wire  _T_66; 
  wire  acquire; 
  wire  _T_69; 
  wire [1:0] _T_70; 
  wire  _T_71; 
  wire [1:0] _T_72; 
  wire  _T_73; 
  wire [1:0] transform; 
  wire [1:0] _T_78; 
  Queue_13 o_data ( 
    .clock(o_data_clock),
    .reset(o_data_reset),
    .io_enq_ready(o_data_io_enq_ready),
    .io_enq_valid(o_data_io_enq_valid),
    .io_enq_bits_mask(o_data_io_enq_bits_mask),
    .io_enq_bits_data(o_data_io_enq_bits_data),
    .io_deq_ready(o_data_io_deq_ready),
    .io_deq_valid(o_data_io_deq_valid),
    .io_deq_bits_mask(o_data_io_deq_bits_mask),
    .io_deq_bits_data(o_data_io_deq_bits_data)
  );
  assign idle = got_e & sent_d; 
  assign _T_26 = io_in_a_ready & io_in_a_valid; 
  assign _T_27 = _T_26 & io_in_a_first; 
  assign _T_29 = idle | reset; 
  assign _T_30 = _T_29 == 1'h0; 
  assign _T_31 = io_in_a_bits_opcode != 3'h6; 
  assign _T_32 = io_in_a_bits_opcode != 3'h7; 
  assign _T_33 = _T_31 & _T_32; 
  assign _T_34 = sent_d == 1'h0; 
  assign _T_36 = _T_34 | reset; 
  assign _T_37 = _T_36 == 1'h0; 
  assign _T_38 = got_e == 1'h0; 
  assign _T_40 = _T_38 | reset; 
  assign _T_41 = _T_40 == 1'h0; 
  assign _T_42 = io_probenack | io_probedack; 
  assign _T_43 = count > 3'h0; 
  assign _T_45 = _T_43 | reset; 
  assign _T_46 = _T_45 == 1'h0; 
  assign _T_47 = io_probenack & io_probedack; 
  assign _T_48 = _T_47 ? 2'h2 : 2'h1; 
  assign _GEN_11 = {{1'd0}, _T_48}; 
  assign _T_49 = count - _GEN_11; 
  assign _T_50 = $unsigned(_T_49); 
  assign _T_51 = _T_50[2:0]; 
  assign _T_59 = io_in_a_first == 1'h0; 
  assign _T_60 = idle | _T_59; 
  assign i_data_ready = o_data_io_enq_ready; 
  assign probe_done = count == 3'h0; 
  assign _T_65 = opcode == 3'h6; 
  assign _T_66 = opcode == 3'h7; 
  assign acquire = _T_65 | _T_66; 
  assign _T_69 = 3'h2 == param; 
  assign _T_70 = _T_69 ? 2'h3 : 2'h0; 
  assign _T_71 = 3'h1 == param; 
  assign _T_72 = _T_71 ? 2'h3 : _T_70; 
  assign _T_73 = 3'h0 == param; 
  assign transform = _T_73 ? 2'h2 : _T_72; 
  assign _T_78 = acquire ? transform : 2'h0; 
  assign io_in_a_ready = _T_60 & i_data_ready; 
  assign io_out_a_valid = o_data_io_deq_valid & probe_done; 
  assign io_out_a_bits_opcode = acquire ? 3'h4 : opcode; 
  assign io_out_a_bits_param = acquire ? 3'h0 : param; 
  assign io_out_a_bits_size = size; 
  assign io_out_a_bits_source = {_T_78,source}; 
  assign io_out_a_bits_address = address; 
  assign io_out_a_bits_mask = o_data_io_deq_bits_mask; 
  assign io_out_a_bits_data = o_data_io_deq_bits_data; 
  assign io_source = source; 
  assign io_line = address[31:6]; 
  assign io_idle = got_e & sent_d; 
  assign o_data_clock = clock; 
  assign o_data_reset = reset; 
  assign o_data_io_enq_valid = _T_60 & io_in_a_valid; 
  assign o_data_io_enq_bits_mask = io_in_a_bits_mask; 
  assign o_data_io_enq_bits_data = io_in_a_bits_data; 
  assign o_data_io_deq_ready = io_out_a_ready & probe_done; 
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
  got_e = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  sent_d = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  opcode = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  param = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  size = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  source = _RAND_5[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  address = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  count = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      got_e <= 1'h1;
    end else begin
      if (io_e_last) begin
        got_e <= 1'h1;
      end else begin
        if (_T_27) begin
          got_e <= _T_33;
        end
      end
    end
    if (reset) begin
      sent_d <= 1'h1;
    end else begin
      if (io_d_last) begin
        sent_d <= 1'h1;
      end else begin
        if (_T_27) begin
          sent_d <= 1'h0;
        end
      end
    end
    if (_T_27) begin
      opcode <= io_in_a_bits_opcode;
    end
    if (_T_27) begin
      param <= io_in_a_bits_param;
    end
    if (_T_27) begin
      size <= io_in_a_bits_size;
    end
    if (_T_27) begin
      source <= io_in_a_bits_source;
    end
    if (reset) begin
      address <= 32'h40;
    end else begin
      if (_T_27) begin
        address <= io_in_a_bits_address;
      end
    end
    if (_T_42) begin
      count <= _T_51;
    end else begin
      if (_T_27) begin
        count <= io_probe;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_27 & _T_30) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Broadcast.scala:250 assert (idle)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_27 & _T_30) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_d_last & _T_37) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Broadcast.scala:261 assert (!sent_d)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_d_last & _T_37) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_e_last & _T_41) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Broadcast.scala:265 assert (!got_e)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_e_last & _T_41) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_42 & _T_46) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Broadcast.scala:270 assert (count > UInt(0))\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_42 & _T_46) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
