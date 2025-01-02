module TLXbar_7( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [8:0]  auto_in_a_bits_address, 
  input  [3:0]  auto_in_a_bits_mask, 
  input  [31:0] auto_in_a_bits_data, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output        auto_in_d_bits_denied, 
  output [31:0] auto_in_d_bits_data, 
  output        auto_in_d_bits_corrupt, 
  input         auto_out_1_a_ready, 
  output        auto_out_1_a_valid, 
  output [2:0]  auto_out_1_a_bits_opcode, 
  output [6:0]  auto_out_1_a_bits_address, 
  output [3:0]  auto_out_1_a_bits_mask, 
  output [31:0] auto_out_1_a_bits_data, 
  output        auto_out_1_d_ready, 
  input         auto_out_1_d_valid, 
  input  [2:0]  auto_out_1_d_bits_opcode, 
  input  [31:0] auto_out_1_d_bits_data, 
  input         auto_out_0_a_ready, 
  output        auto_out_0_a_valid, 
  output [2:0]  auto_out_0_a_bits_opcode, 
  output [8:0]  auto_out_0_a_bits_address, 
  output [3:0]  auto_out_0_a_bits_mask, 
  output [31:0] auto_out_0_a_bits_data, 
  output        auto_out_0_d_ready, 
  input         auto_out_0_d_valid, 
  input  [2:0]  auto_out_0_d_bits_opcode, 
  input  [1:0]  auto_out_0_d_bits_param, 
  input  [1:0]  auto_out_0_d_bits_size, 
  input         auto_out_0_d_bits_source, 
  input         auto_out_0_d_bits_sink, 
  input         auto_out_0_d_bits_denied, 
  input  [31:0] auto_out_0_d_bits_data, 
  input         auto_out_0_d_bits_corrupt 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [8:0] TLMonitor_io_in_a_bits_address; 
  wire [3:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_param; 
  wire [1:0] TLMonitor_io_in_d_bits_size; 
  wire  TLMonitor_io_in_d_bits_sink; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  wire [9:0] _T_700; 
  wire [9:0] _T_701; 
  wire [9:0] _T_702; 
  wire  _T_703; 
  wire [8:0] _T_704; 
  wire [9:0] _T_705; 
  wire [9:0] _T_706; 
  wire [9:0] _T_707; 
  wire  _T_708; 
  wire [8:0] _T_709; 
  wire [9:0] _T_710; 
  wire [9:0] _T_711; 
  wire [9:0] _T_712; 
  wire  _T_713; 
  wire [8:0] _T_714; 
  wire [9:0] _T_715; 
  wire [9:0] _T_716; 
  wire [9:0] _T_717; 
  wire  _T_718; 
  wire [8:0] _T_719; 
  wire [9:0] _T_720; 
  wire [9:0] _T_721; 
  wire [9:0] _T_722; 
  wire  _T_723; 
  wire [8:0] _T_724; 
  wire [9:0] _T_725; 
  wire [9:0] _T_726; 
  wire [9:0] _T_727; 
  wire  _T_728; 
  wire [8:0] _T_729; 
  wire [9:0] _T_730; 
  wire [9:0] _T_731; 
  wire [9:0] _T_732; 
  wire  _T_733; 
  wire  _T_734; 
  wire  _T_735; 
  wire  _T_736; 
  wire  _T_737; 
  wire  _T_738; 
  wire  requestAIO_0_0; 
  wire [8:0] _T_740; 
  wire [9:0] _T_741; 
  wire [9:0] _T_742; 
  wire [9:0] _T_743; 
  wire  requestAIO_0_1; 
  wire  _T_824; 
  wire  _T_825; 
  reg  _T_980; 
  reg [31:0] _RAND_0;
  wire  _T_981; 
  wire  _T_982; 
  wire [1:0] _T_983; 
  wire  _T_985; 
  wire  _T_987; 
  wire  _T_988; 
  reg [1:0] _T_991; 
  reg [31:0] _RAND_1;
  wire [1:0] _T_992; 
  wire [1:0] _T_993; 
  wire [3:0] _T_994; 
  wire [2:0] _T_995; 
  wire [3:0] _GEN_1; 
  wire [3:0] _T_996; 
  wire [2:0] _T_998; 
  wire [3:0] _GEN_2; 
  wire [3:0] _T_999; 
  wire [3:0] _GEN_3; 
  wire [3:0] _T_1000; 
  wire [1:0] _T_1001; 
  wire [1:0] _T_1002; 
  wire [1:0] _T_1003; 
  wire [1:0] _T_1004; 
  wire  _T_1005; 
  wire  _T_1006; 
  wire [1:0] _T_1007; 
  wire [2:0] _GEN_4; 
  wire [2:0] _T_1008; 
  wire [1:0] _T_1009; 
  wire [1:0] _T_1010; 
  wire  _T_1013; 
  wire  _T_1014; 
  wire  _T_1023; 
  wire  _T_1024; 
  wire  _T_1034; 
  wire  _T_1036; 
  wire  _T_1039; 
  wire  _T_1040; 
  wire  _T_1043; 
  wire  _T_1044; 
  wire  _T_1045; 
  wire  _T_1046; 
  wire  _T_1048; 
  wire  _T_1050; 
  wire  _T_1051; 
  reg  _T_1076_0; 
  reg [31:0] _RAND_2;
  wire  _T_1107; 
  reg  _T_1076_1; 
  reg [31:0] _RAND_3;
  wire  _T_1108; 
  wire  _T_1109; 
  wire  in_0_d_valid; 
  wire  _T_1055; 
  wire [1:0] _T_1056; 
  wire [1:0] _T_1057; 
  wire  _T_1058; 
  wire  _T_1087_0; 
  wire  _T_1087_1; 
  wire  _T_1095_0; 
  wire  _T_1095_1; 
  wire [32:0] _T_1114; 
  wire [1:0] _T_1115; 
  wire [34:0] _T_1116; 
  wire [2:0] _T_1117; 
  wire [4:0] _T_1118; 
  wire [7:0] _T_1119; 
  wire [42:0] _T_1120; 
  wire [42:0] _T_1121; 
  wire [32:0] _T_1122; 
  wire [34:0] _T_1124; 
  wire [4:0] _T_1126; 
  wire [7:0] _T_1127; 
  wire [42:0] _T_1128; 
  wire [42:0] _T_1129; 
  wire [42:0] _T_1130; 
  TLMonitor_59 TLMonitor ( 
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_sink(TLMonitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt)
  );
  assign _T_700 = {1'b0,$signed(auto_in_a_bits_address)}; 
  assign _T_701 = $signed(_T_700) & $signed(10'sh1c0); 
  assign _T_702 = $signed(_T_701); 
  assign _T_703 = $signed(_T_702) == $signed(10'sh0); 
  assign _T_704 = auto_in_a_bits_address ^ 9'h44; 
  assign _T_705 = {1'b0,$signed(_T_704)}; 
  assign _T_706 = $signed(_T_705) & $signed(10'sh1fc); 
  assign _T_707 = $signed(_T_706); 
  assign _T_708 = $signed(_T_707) == $signed(10'sh0); 
  assign _T_709 = auto_in_a_bits_address ^ 9'h48; 
  assign _T_710 = {1'b0,$signed(_T_709)}; 
  assign _T_711 = $signed(_T_710) & $signed(10'sh1f8); 
  assign _T_712 = $signed(_T_711); 
  assign _T_713 = $signed(_T_712) == $signed(10'sh0); 
  assign _T_714 = auto_in_a_bits_address ^ 9'h50; 
  assign _T_715 = {1'b0,$signed(_T_714)}; 
  assign _T_716 = $signed(_T_715) & $signed(10'sh1f0); 
  assign _T_717 = $signed(_T_716); 
  assign _T_718 = $signed(_T_717) == $signed(10'sh0); 
  assign _T_719 = auto_in_a_bits_address ^ 9'h60; 
  assign _T_720 = {1'b0,$signed(_T_719)}; 
  assign _T_721 = $signed(_T_720) & $signed(10'sh1e0); 
  assign _T_722 = $signed(_T_721); 
  assign _T_723 = $signed(_T_722) == $signed(10'sh0); 
  assign _T_724 = auto_in_a_bits_address ^ 9'h80; 
  assign _T_725 = {1'b0,$signed(_T_724)}; 
  assign _T_726 = $signed(_T_725) & $signed(10'sh180); 
  assign _T_727 = $signed(_T_726); 
  assign _T_728 = $signed(_T_727) == $signed(10'sh0); 
  assign _T_729 = auto_in_a_bits_address ^ 9'h100; 
  assign _T_730 = {1'b0,$signed(_T_729)}; 
  assign _T_731 = $signed(_T_730) & $signed(10'sh100); 
  assign _T_732 = $signed(_T_731); 
  assign _T_733 = $signed(_T_732) == $signed(10'sh0); 
  assign _T_734 = _T_703 | _T_708; 
  assign _T_735 = _T_734 | _T_713; 
  assign _T_736 = _T_735 | _T_718; 
  assign _T_737 = _T_736 | _T_723; 
  assign _T_738 = _T_737 | _T_728; 
  assign requestAIO_0_0 = _T_738 | _T_733; 
  assign _T_740 = auto_in_a_bits_address ^ 9'h40; 
  assign _T_741 = {1'b0,$signed(_T_740)}; 
  assign _T_742 = $signed(_T_741) & $signed(10'sh1fc); 
  assign _T_743 = $signed(_T_742); 
  assign requestAIO_0_1 = $signed(_T_743) == $signed(10'sh0); 
  assign _T_824 = requestAIO_0_0 ? auto_out_0_a_ready : 1'h0; 
  assign _T_825 = requestAIO_0_1 ? auto_out_1_a_ready : 1'h0; 
  assign _T_981 = _T_980 == 1'h0; 
  assign _T_982 = _T_981 & auto_in_d_ready; 
  assign _T_983 = {auto_out_1_d_valid,auto_out_0_d_valid}; 
  assign _T_985 = _T_983 == _T_983; 
  assign _T_987 = _T_985 | reset; 
  assign _T_988 = _T_987 == 1'h0; 
  assign _T_992 = ~ _T_991; 
  assign _T_993 = _T_983 & _T_992; 
  assign _T_994 = {_T_993,_T_983}; 
  assign _T_995 = _T_994[3:1]; 
  assign _GEN_1 = {{1'd0}, _T_995}; 
  assign _T_996 = _T_994 | _GEN_1; 
  assign _T_998 = _T_996[3:1]; 
  assign _GEN_2 = {{2'd0}, _T_991}; 
  assign _T_999 = _GEN_2 << 2; 
  assign _GEN_3 = {{1'd0}, _T_998}; 
  assign _T_1000 = _GEN_3 | _T_999; 
  assign _T_1001 = _T_1000[3:2]; 
  assign _T_1002 = _T_1000[1:0]; 
  assign _T_1003 = _T_1001 & _T_1002; 
  assign _T_1004 = ~ _T_1003; 
  assign _T_1005 = _T_983 != 2'h0; 
  assign _T_1006 = _T_982 & _T_1005; 
  assign _T_1007 = _T_1004 & _T_983; 
  assign _GEN_4 = {{1'd0}, _T_1007}; 
  assign _T_1008 = _GEN_4 << 1; 
  assign _T_1009 = _T_1008[1:0]; 
  assign _T_1010 = _T_1007 | _T_1009; 
  assign _T_1013 = _T_1004[0]; 
  assign _T_1014 = _T_1004[1]; 
  assign _T_1023 = _T_1013 & auto_out_0_d_valid; 
  assign _T_1024 = _T_1014 & auto_out_1_d_valid; 
  assign _T_1034 = _T_1023 | _T_1024; 
  assign _T_1036 = _T_1023 == 1'h0; 
  assign _T_1039 = _T_1024 == 1'h0; 
  assign _T_1040 = _T_1036 | _T_1039; 
  assign _T_1043 = _T_1040 | reset; 
  assign _T_1044 = _T_1043 == 1'h0; 
  assign _T_1045 = auto_out_0_d_valid | auto_out_1_d_valid; 
  assign _T_1046 = _T_1045 == 1'h0; 
  assign _T_1048 = _T_1046 | _T_1034; 
  assign _T_1050 = _T_1048 | reset; 
  assign _T_1051 = _T_1050 == 1'h0; 
  assign _T_1107 = _T_1076_0 ? auto_out_0_d_valid : 1'h0; 
  assign _T_1108 = _T_1076_1 ? auto_out_1_d_valid : 1'h0; 
  assign _T_1109 = _T_1107 | _T_1108; 
  assign in_0_d_valid = _T_981 ? _T_1045 : _T_1109; 
  assign _T_1055 = auto_in_d_ready & in_0_d_valid; 
  assign _T_1056 = _T_980 - _T_1055; 
  assign _T_1057 = $unsigned(_T_1056); 
  assign _T_1058 = _T_1057[0:0]; 
  assign _T_1087_0 = _T_981 ? _T_1023 : _T_1076_0; 
  assign _T_1087_1 = _T_981 ? _T_1024 : _T_1076_1; 
  assign _T_1095_0 = _T_981 ? _T_1013 : _T_1076_0; 
  assign _T_1095_1 = _T_981 ? _T_1014 : _T_1076_1; 
  assign _T_1114 = {auto_out_0_d_bits_data,auto_out_0_d_bits_corrupt}; 
  assign _T_1115 = {auto_out_0_d_bits_sink,auto_out_0_d_bits_denied}; 
  assign _T_1116 = {_T_1115,_T_1114}; 
  assign _T_1117 = {auto_out_0_d_bits_size,auto_out_0_d_bits_source}; 
  assign _T_1118 = {auto_out_0_d_bits_opcode,auto_out_0_d_bits_param}; 
  assign _T_1119 = {_T_1118,_T_1117}; 
  assign _T_1120 = {_T_1119,_T_1116}; 
  assign _T_1121 = _T_1087_0 ? _T_1120 : 43'h0; 
  assign _T_1122 = {auto_out_1_d_bits_data,1'h0}; 
  assign _T_1124 = {2'h0,_T_1122}; 
  assign _T_1126 = {auto_out_1_d_bits_opcode,2'h0}; 
  assign _T_1127 = {_T_1126,3'h4}; 
  assign _T_1128 = {_T_1127,_T_1124}; 
  assign _T_1129 = _T_1087_1 ? _T_1128 : 43'h0; 
  assign _T_1130 = _T_1121 | _T_1129; 
  assign auto_in_a_ready = _T_824 | _T_825; 
  assign auto_in_d_valid = _T_981 ? _T_1045 : _T_1109; 
  assign auto_in_d_bits_denied = _T_1130[33]; 
  assign auto_in_d_bits_data = _T_1130[32:1]; 
  assign auto_in_d_bits_corrupt = _T_1130[0]; 
  assign auto_out_1_a_valid = auto_in_a_valid & requestAIO_0_1; 
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_1_a_bits_address = auto_in_a_bits_address[6:0]; 
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_1_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_1_d_ready = auto_in_d_ready & _T_1095_1; 
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0; 
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_0_a_bits_address = auto_in_a_bits_address; 
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_0_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_0_d_ready = auto_in_d_ready & _T_1095_0; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = _T_824 | _T_825; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = _T_981 ? _T_1045 : _T_1109; 
  assign TLMonitor_io_in_d_bits_opcode = _T_1130[42:40]; 
  assign TLMonitor_io_in_d_bits_param = _T_1130[39:38]; 
  assign TLMonitor_io_in_d_bits_size = _T_1130[37:36]; 
  assign TLMonitor_io_in_d_bits_sink = _T_1130[34]; 
  assign TLMonitor_io_in_d_bits_denied = _T_1130[33]; 
  assign TLMonitor_io_in_d_bits_corrupt = _T_1130[0]; 
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
  _T_980 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_991 = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1076_0 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1076_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_980 <= 1'h0;
    end else begin
      if (_T_982) begin
        _T_980 <= 1'h0;
      end else begin
        _T_980 <= _T_1058;
      end
    end
    if (reset) begin
      _T_991 <= 2'h3;
    end else begin
      if (_T_1006) begin
        _T_991 <= _T_1010;
      end
    end
    if (reset) begin
      _T_1076_0 <= 1'h0;
    end else begin
      if (_T_981) begin
        _T_1076_0 <= _T_1023;
      end
    end
    if (reset) begin
      _T_1076_1 <= 1'h0;
    end else begin
      if (_T_981) begin
        _T_1076_1 <= _T_1024;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_988) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:19 assert (valid === valids)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_988) begin
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
        if (_T_1044) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:68 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1044) begin
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
        if (_T_1051) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:70 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1051) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
