module DebugTransportModuleJTAG( 
  input         clock, 
  input         reset, 
  input         io_dmi_req_ready, 
  output        io_dmi_req_valid, 
  output [6:0]  io_dmi_req_bits_addr, 
  output [31:0] io_dmi_req_bits_data, 
  output [1:0]  io_dmi_req_bits_op, 
  output        io_dmi_resp_ready, 
  input         io_dmi_resp_valid, 
  input  [31:0] io_dmi_resp_bits_data, 
  input  [1:0]  io_dmi_resp_bits_resp, 
  input         io_jtag_TMS, 
  input         io_jtag_TDI, 
  output        io_jtag_TDO_data, 
  input         io_jtag_reset, 
  output        io_fsmReset 
);
  wire  dtmInfoChain_clock; 
  wire  dtmInfoChain_reset; 
  wire  dtmInfoChain_io_chainIn_shift; 
  wire  dtmInfoChain_io_chainIn_data; 
  wire  dtmInfoChain_io_chainIn_capture; 
  wire  dtmInfoChain_io_chainIn_update; 
  wire  dtmInfoChain_io_chainOut_data; 
  wire [1:0] dtmInfoChain_io_capture_bits_dmiStatus; 
  wire  dtmInfoChain_io_update_valid; 
  wire  dtmInfoChain_io_update_bits_dmireset; 
  wire  dmiAccessChain_clock; 
  wire  dmiAccessChain_reset; 
  wire  dmiAccessChain_io_chainIn_shift; 
  wire  dmiAccessChain_io_chainIn_data; 
  wire  dmiAccessChain_io_chainIn_capture; 
  wire  dmiAccessChain_io_chainIn_update; 
  wire  dmiAccessChain_io_chainOut_data; 
  wire [6:0] dmiAccessChain_io_capture_bits_addr; 
  wire [31:0] dmiAccessChain_io_capture_bits_data; 
  wire [1:0] dmiAccessChain_io_capture_bits_resp; 
  wire  dmiAccessChain_io_capture_capture; 
  wire  dmiAccessChain_io_update_valid; 
  wire [6:0] dmiAccessChain_io_update_bits_addr; 
  wire [31:0] dmiAccessChain_io_update_bits_data; 
  wire [1:0] dmiAccessChain_io_update_bits_op; 
  wire  idcodeChain_clock; 
  wire  idcodeChain_reset; 
  wire  idcodeChain_io_chainIn_shift; 
  wire  idcodeChain_io_chainIn_data; 
  wire  idcodeChain_io_chainIn_capture; 
  wire  idcodeChain_io_chainIn_update; 
  wire  idcodeChain_io_chainOut_data; 
  wire  JtagTapController_clock; 
  wire  JtagTapController_reset; 
  wire  JtagTapController_io_jtag_TMS; 
  wire  JtagTapController_io_jtag_TDI; 
  wire  JtagTapController_io_jtag_TDO_data; 
  wire  JtagTapController_io_control_jtag_reset; 
  wire [4:0] JtagTapController_io_output_instruction; 
  wire  JtagTapController_io_output_reset; 
  wire  JtagTapController_io_dataChainOut_shift; 
  wire  JtagTapController_io_dataChainOut_data; 
  wire  JtagTapController_io_dataChainOut_capture; 
  wire  JtagTapController_io_dataChainOut_update; 
  wire  JtagTapController_io_dataChainIn_data; 
  wire  JtagBypassChain_clock; 
  wire  JtagBypassChain_reset; 
  wire  JtagBypassChain_io_chainIn_shift; 
  wire  JtagBypassChain_io_chainIn_data; 
  wire  JtagBypassChain_io_chainIn_capture; 
  wire  JtagBypassChain_io_chainIn_update; 
  wire  JtagBypassChain_io_chainOut_data; 
  reg  busyReg; 
  reg [31:0] _RAND_0;
  reg  stickyBusyReg; 
  reg [31:0] _RAND_1;
  reg  stickyNonzeroRespReg; 
  reg [31:0] _RAND_2;
  reg  skipOpReg; 
  reg [31:0] _RAND_3;
  reg  downgradeOpReg; 
  reg [31:0] _RAND_4;
  reg [6:0] dmiReqReg_addr; 
  reg [31:0] _RAND_5;
  reg [31:0] dmiReqReg_data; 
  reg [31:0] _RAND_6;
  reg [1:0] dmiReqReg_op; 
  reg [31:0] _RAND_7;
  reg  dmiReqValidReg; 
  reg [31:0] _RAND_8;
  wire  _T_40; 
  wire  _T_45; 
  wire  _T_46; 
  wire  _T_47; 
  wire  busy; 
  wire  _T_49; 
  wire  _T_51; 
  wire  _T_52; 
  wire  nonzeroResp; 
  wire  _T_50; 
  wire  _T_54; 
  wire  _T_56; 
  wire  _T_57; 
  wire  _T_58; 
  wire  _T_60; 
  wire  _T_61; 
  wire [6:0] _T_63_addr; 
  wire [31:0] _T_63_data; 
  wire [1:0] _T_63_resp; 
  wire  _T_68; 
  wire  _T_74; 
  wire  _T_75; 
  wire  _GEN_22; 
  wire  _GEN_27; 
  wire  dmiReqValidCheck; 
  wire  _T_69; 
  wire  _T_70; 
  wire  _T_72; 
  wire  _T_73; 
  wire  _T_77; 
  wire [31:0] _GEN_0; 
  wire [1:0] _T_136; 
  wire  _T_137; 
  wire  _T_139; 
  wire  _T_140; 
  wire [12:0] _T_143; 
  wire [12:0] _T_144; 
  wire [11:0] _T_145; 
  wire [30:0] _GEN_62; 
  wire [30:0] _T_146; 
  wire  _T_147; 
  wire  _T_149; 
  wire  _T_150; 
  wire  _T_153; 
  wire  _T_154; 
  wire  _T_155; 
  wire  _GEN_35; 
  wire  _GEN_39; 
  CaptureUpdateChain dtmInfoChain ( 
    .clock(dtmInfoChain_clock),
    .reset(dtmInfoChain_reset),
    .io_chainIn_shift(dtmInfoChain_io_chainIn_shift),
    .io_chainIn_data(dtmInfoChain_io_chainIn_data),
    .io_chainIn_capture(dtmInfoChain_io_chainIn_capture),
    .io_chainIn_update(dtmInfoChain_io_chainIn_update),
    .io_chainOut_data(dtmInfoChain_io_chainOut_data),
    .io_capture_bits_dmiStatus(dtmInfoChain_io_capture_bits_dmiStatus),
    .io_update_valid(dtmInfoChain_io_update_valid),
    .io_update_bits_dmireset(dtmInfoChain_io_update_bits_dmireset)
  );
  CaptureUpdateChain_1 dmiAccessChain ( 
    .clock(dmiAccessChain_clock),
    .reset(dmiAccessChain_reset),
    .io_chainIn_shift(dmiAccessChain_io_chainIn_shift),
    .io_chainIn_data(dmiAccessChain_io_chainIn_data),
    .io_chainIn_capture(dmiAccessChain_io_chainIn_capture),
    .io_chainIn_update(dmiAccessChain_io_chainIn_update),
    .io_chainOut_data(dmiAccessChain_io_chainOut_data),
    .io_capture_bits_addr(dmiAccessChain_io_capture_bits_addr),
    .io_capture_bits_data(dmiAccessChain_io_capture_bits_data),
    .io_capture_bits_resp(dmiAccessChain_io_capture_bits_resp),
    .io_capture_capture(dmiAccessChain_io_capture_capture),
    .io_update_valid(dmiAccessChain_io_update_valid),
    .io_update_bits_addr(dmiAccessChain_io_update_bits_addr),
    .io_update_bits_data(dmiAccessChain_io_update_bits_data),
    .io_update_bits_op(dmiAccessChain_io_update_bits_op)
  );
  CaptureChain idcodeChain ( 
    .clock(idcodeChain_clock),
    .reset(idcodeChain_reset),
    .io_chainIn_shift(idcodeChain_io_chainIn_shift),
    .io_chainIn_data(idcodeChain_io_chainIn_data),
    .io_chainIn_capture(idcodeChain_io_chainIn_capture),
    .io_chainIn_update(idcodeChain_io_chainIn_update),
    .io_chainOut_data(idcodeChain_io_chainOut_data)
  );
  JtagTapController JtagTapController ( 
    .clock(JtagTapController_clock),
    .reset(JtagTapController_reset),
    .io_jtag_TMS(JtagTapController_io_jtag_TMS),
    .io_jtag_TDI(JtagTapController_io_jtag_TDI),
    .io_jtag_TDO_data(JtagTapController_io_jtag_TDO_data),
    .io_control_jtag_reset(JtagTapController_io_control_jtag_reset),
    .io_output_instruction(JtagTapController_io_output_instruction),
    .io_output_reset(JtagTapController_io_output_reset),
    .io_dataChainOut_shift(JtagTapController_io_dataChainOut_shift),
    .io_dataChainOut_data(JtagTapController_io_dataChainOut_data),
    .io_dataChainOut_capture(JtagTapController_io_dataChainOut_capture),
    .io_dataChainOut_update(JtagTapController_io_dataChainOut_update),
    .io_dataChainIn_data(JtagTapController_io_dataChainIn_data)
  );
  JtagBypassChain JtagBypassChain ( 
    .clock(JtagBypassChain_clock),
    .reset(JtagBypassChain_reset),
    .io_chainIn_shift(JtagBypassChain_io_chainIn_shift),
    .io_chainIn_data(JtagBypassChain_io_chainIn_data),
    .io_chainIn_capture(JtagBypassChain_io_chainIn_capture),
    .io_chainIn_update(JtagBypassChain_io_chainIn_update),
    .io_chainOut_data(JtagBypassChain_io_chainOut_data)
  );
  assign _T_40 = stickyNonzeroRespReg | stickyBusyReg; 
  assign _T_45 = io_dmi_resp_ready & io_dmi_resp_valid; 
  assign _T_46 = io_dmi_resp_valid == 1'h0; 
  assign _T_47 = busyReg & _T_46; 
  assign busy = _T_47 | stickyBusyReg; 
  assign _T_49 = busy == 1'h0; 
  assign _T_51 = io_dmi_resp_bits_resp != 2'h0; 
  assign _T_52 = io_dmi_resp_valid & _T_51; 
  assign nonzeroResp = stickyNonzeroRespReg | _T_52; 
  assign _T_50 = _T_49 & nonzeroResp; 
  assign _T_54 = nonzeroResp == 1'h0; 
  assign _T_56 = _T_54 | reset; 
  assign _T_57 = _T_56 == 1'h0; 
  assign _T_58 = stickyNonzeroRespReg == 1'h0; 
  assign _T_60 = _T_58 | reset; 
  assign _T_61 = _T_60 == 1'h0; 
  assign _T_63_addr = io_dmi_resp_valid ? dmiReqReg_addr : 7'h0; 
  assign _T_63_data = io_dmi_resp_valid ? io_dmi_resp_bits_data : 32'h0; 
  assign _T_63_resp = io_dmi_resp_valid ? io_dmi_resp_bits_resp : 2'h0; 
  assign _T_68 = io_dmi_req_ready & io_dmi_req_valid; 
  assign _T_74 = dmiAccessChain_io_update_bits_op == 2'h0; 
  assign _T_75 = downgradeOpReg | _T_74; 
  assign _GEN_22 = _T_75 ? 1'h0 : 1'h1; 
  assign _GEN_27 = skipOpReg ? 1'h0 : _GEN_22; 
  assign dmiReqValidCheck = dmiAccessChain_io_update_valid ? _GEN_27 : 1'h0; 
  assign _T_69 = dmiReqValidCheck & _T_68; 
  assign _T_70 = _T_69 == 1'h0; 
  assign _T_72 = _T_70 | reset; 
  assign _T_73 = _T_72 == 1'h0; 
  assign _T_77 = dmiReqReg_op == 2'h2; 
  assign _GEN_0 = 32'h20000913 % 32'h2; 
  assign _T_136 = _GEN_0[1:0]; 
  assign _T_137 = _T_136 == 2'h1; 
  assign _T_139 = _T_137 | reset; 
  assign _T_140 = _T_139 == 1'h0; 
  assign _T_143 = 12'h800 - 12'h1; 
  assign _T_144 = $unsigned(_T_143); 
  assign _T_145 = _T_144[11:0]; 
  assign _GEN_62 = {{19'd0}, _T_145}; 
  assign _T_146 = 31'h10000489 & _GEN_62; 
  assign _T_147 = _T_146 != 31'h7f; 
  assign _T_149 = _T_147 | reset; 
  assign _T_150 = _T_149 == 1'h0; 
  assign _T_153 = JtagTapController_io_output_instruction == 5'h1; 
  assign _T_154 = JtagTapController_io_output_instruction == 5'h10; 
  assign _T_155 = JtagTapController_io_output_instruction == 5'h11; 
  assign _GEN_35 = _T_155 ? dmiAccessChain_io_chainOut_data : JtagBypassChain_io_chainOut_data; 
  assign _GEN_39 = _T_154 ? dtmInfoChain_io_chainOut_data : _GEN_35; 
  assign io_dmi_req_valid = dmiReqValidReg; 
  assign io_dmi_req_bits_addr = dmiReqReg_addr; 
  assign io_dmi_req_bits_data = dmiReqReg_data; 
  assign io_dmi_req_bits_op = dmiReqReg_op; 
  assign io_dmi_resp_ready = _T_77 ? io_dmi_resp_valid : dmiAccessChain_io_capture_capture; 
  assign io_jtag_TDO_data = JtagTapController_io_jtag_TDO_data; 
  assign io_fsmReset = JtagTapController_io_output_reset; 
  assign dtmInfoChain_clock = clock; 
  assign dtmInfoChain_reset = reset; 
  assign dtmInfoChain_io_chainIn_shift = _T_154 ? JtagTapController_io_dataChainOut_shift : 1'h0; 
  assign dtmInfoChain_io_chainIn_data = _T_154 ? JtagTapController_io_dataChainOut_data : 1'h0; 
  assign dtmInfoChain_io_chainIn_capture = _T_154 ? JtagTapController_io_dataChainOut_capture : 1'h0; 
  assign dtmInfoChain_io_chainIn_update = _T_154 ? JtagTapController_io_dataChainOut_update : 1'h0; 
  assign dtmInfoChain_io_capture_bits_dmiStatus = {stickyNonzeroRespReg,_T_40}; 
  assign dmiAccessChain_clock = clock; 
  assign dmiAccessChain_reset = reset; 
  assign dmiAccessChain_io_chainIn_shift = _T_155 ? JtagTapController_io_dataChainOut_shift : 1'h0; 
  assign dmiAccessChain_io_chainIn_data = _T_155 ? JtagTapController_io_dataChainOut_data : 1'h0; 
  assign dmiAccessChain_io_chainIn_capture = _T_155 ? JtagTapController_io_dataChainOut_capture : 1'h0; 
  assign dmiAccessChain_io_chainIn_update = _T_155 ? JtagTapController_io_dataChainOut_update : 1'h0; 
  assign dmiAccessChain_io_capture_bits_addr = busy ? 7'h0 : _T_63_addr; 
  assign dmiAccessChain_io_capture_bits_data = busy ? 32'h0 : _T_63_data; 
  assign dmiAccessChain_io_capture_bits_resp = busy ? 2'h3 : _T_63_resp; 
  assign idcodeChain_clock = clock; 
  assign idcodeChain_reset = reset; 
  assign idcodeChain_io_chainIn_shift = _T_153 ? JtagTapController_io_dataChainOut_shift : 1'h0; 
  assign idcodeChain_io_chainIn_data = _T_153 ? JtagTapController_io_dataChainOut_data : 1'h0; 
  assign idcodeChain_io_chainIn_capture = _T_153 ? JtagTapController_io_dataChainOut_capture : 1'h0; 
  assign idcodeChain_io_chainIn_update = _T_153 ? JtagTapController_io_dataChainOut_update : 1'h0; 
  assign JtagTapController_clock = clock; 
  assign JtagTapController_reset = reset; 
  assign JtagTapController_io_jtag_TMS = io_jtag_TMS; 
  assign JtagTapController_io_jtag_TDI = io_jtag_TDI; 
  assign JtagTapController_io_control_jtag_reset = io_jtag_reset; 
  assign JtagTapController_io_dataChainIn_data = _T_153 ? idcodeChain_io_chainOut_data : _GEN_39; 
  assign JtagBypassChain_clock = clock; 
  assign JtagBypassChain_reset = reset; 
  assign JtagBypassChain_io_chainIn_shift = JtagTapController_io_dataChainOut_shift; 
  assign JtagBypassChain_io_chainIn_data = JtagTapController_io_dataChainOut_data; 
  assign JtagBypassChain_io_chainIn_capture = JtagTapController_io_dataChainOut_capture; 
  assign JtagBypassChain_io_chainIn_update = JtagTapController_io_dataChainOut_update; 
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
  busyReg = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  stickyBusyReg = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  stickyNonzeroRespReg = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  skipOpReg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  downgradeOpReg = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  dmiReqReg_addr = _RAND_5[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  dmiReqReg_data = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  dmiReqReg_op = _RAND_7[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  dmiReqValidReg = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      busyReg <= 1'h0;
    end else begin
      if (_T_45) begin
        busyReg <= 1'h0;
      end else begin
        if (io_dmi_req_valid) begin
          busyReg <= 1'h1;
        end
      end
    end
    if (reset) begin
      stickyBusyReg <= 1'h0;
    end else begin
      if (dmiAccessChain_io_capture_capture) begin
        stickyBusyReg <= busy;
      end else begin
        if (dtmInfoChain_io_update_valid) begin
          if (dtmInfoChain_io_update_bits_dmireset) begin
            stickyBusyReg <= 1'h0;
          end else begin
            if (dmiAccessChain_io_capture_capture) begin
              stickyBusyReg <= busy;
            end
          end
        end else begin
          if (dmiAccessChain_io_capture_capture) begin
            stickyBusyReg <= busy;
          end
        end
      end
    end
    if (reset) begin
      stickyNonzeroRespReg <= 1'h0;
    end else begin
      if (dmiAccessChain_io_capture_capture) begin
        stickyNonzeroRespReg <= nonzeroResp;
      end else begin
        if (dtmInfoChain_io_update_valid) begin
          if (dtmInfoChain_io_update_bits_dmireset) begin
            stickyNonzeroRespReg <= 1'h0;
          end else begin
            if (dmiAccessChain_io_capture_capture) begin
              stickyNonzeroRespReg <= nonzeroResp;
            end
          end
        end else begin
          if (dmiAccessChain_io_capture_capture) begin
            stickyNonzeroRespReg <= nonzeroResp;
          end
        end
      end
    end
    if (reset) begin
      skipOpReg <= 1'h0;
    end else begin
      if (dmiAccessChain_io_capture_capture) begin
        skipOpReg <= busy;
      end else begin
        if (dmiAccessChain_io_update_valid) begin
          skipOpReg <= 1'h0;
        end else begin
          if (dmiAccessChain_io_capture_capture) begin
            skipOpReg <= busy;
          end else begin
            if (dmiAccessChain_io_update_valid) begin
              skipOpReg <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      downgradeOpReg <= 1'h0;
    end else begin
      if (dmiAccessChain_io_capture_capture) begin
        downgradeOpReg <= _T_50;
      end else begin
        if (dmiAccessChain_io_update_valid) begin
          downgradeOpReg <= 1'h0;
        end else begin
          if (dmiAccessChain_io_capture_capture) begin
            downgradeOpReg <= _T_50;
          end else begin
            if (dmiAccessChain_io_update_valid) begin
              downgradeOpReg <= 1'h0;
            end
          end
        end
      end
    end
    if (dmiAccessChain_io_update_valid) begin
      if (!(skipOpReg)) begin
        if (_T_75) begin
          dmiReqReg_addr <= 7'h0;
        end else begin
          dmiReqReg_addr <= dmiAccessChain_io_update_bits_addr;
        end
      end
    end
    if (dmiAccessChain_io_update_valid) begin
      if (!(skipOpReg)) begin
        if (_T_75) begin
          dmiReqReg_data <= 32'h0;
        end else begin
          dmiReqReg_data <= dmiAccessChain_io_update_bits_data;
        end
      end
    end
    if (dmiAccessChain_io_update_valid) begin
      if (!(skipOpReg)) begin
        if (_T_75) begin
          dmiReqReg_op <= 2'h0;
        end else begin
          dmiReqReg_op <= dmiAccessChain_io_update_bits_op;
        end
      end
    end
    if (reset) begin
      dmiReqValidReg <= 1'h0;
    end else begin
      if (_T_68) begin
        dmiReqValidReg <= 1'h0;
      end else begin
        if (dmiAccessChain_io_update_valid) begin
          if (!(skipOpReg)) begin
            if (!(_T_75)) begin
              dmiReqValidReg <= 1'h1;
            end
          end
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_57) begin
          $fwrite(32'h80000002,"Assertion failed: There is no reason to get a non zero response in the current system.\n    at DebugTransport.scala:177 assert(!nonzeroResp, \"There is no reason to get a non zero response in the current system.\");\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_57) begin
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
        if (_T_61) begin
          $fwrite(32'h80000002,"Assertion failed: There is no reason to have a sticky non zero response in the current system.\n    at DebugTransport.scala:178 assert(!stickyNonzeroRespReg, \"There is no reason to have a sticky non zero response in the current system.\");\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_61) begin
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
        if (_T_73) begin
          $fwrite(32'h80000002,"Assertion failed: Conflicting updates for dmiReqValidReg, should not happen.\n    at DebugTransport.scala:211 assert(!(dmiReqValidCheck && io.dmi.req.fire()), \"Conflicting updates for dmiReqValidReg, should not happen.\");\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_73) begin
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
        if (_T_140) begin
          $fwrite(32'h80000002,"Assertion failed: LSB must be set in IDCODE, see 12.1.1d\n    at JtagTap.scala:192 assert(i %% 2.U === 1.U, \"LSB must be set in IDCODE, see 12.1.1d\")\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_140) begin
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
        if (_T_150) begin
          $fwrite(32'h80000002,"Assertion failed: IDCODE must not have 0b00001111111 as manufacturer identity, see 12.2.1b\n    at JtagTap.scala:193 assert(((i >> 1) & ((1.U << 11) - 1.U)) =/= JtagIdcode.dummyMfrId.U,\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_150) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
