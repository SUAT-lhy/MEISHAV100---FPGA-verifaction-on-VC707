module TLDebugModuleOuter( 
  input         clock, 
  input         reset, 
  output        auto_dmi_in_a_ready, 
  input         auto_dmi_in_a_valid, 
  input  [2:0]  auto_dmi_in_a_bits_opcode, 
  input  [6:0]  auto_dmi_in_a_bits_address, 
  input  [3:0]  auto_dmi_in_a_bits_mask, 
  input  [31:0] auto_dmi_in_a_bits_data, 
  input         auto_dmi_in_d_ready, 
  output        auto_dmi_in_d_valid, 
  output [2:0]  auto_dmi_in_d_bits_opcode, 
  output [31:0] auto_dmi_in_d_bits_data, 
  output        auto_int_out_3_0, 
  output        auto_int_out_2_0, 
  output        auto_int_out_1_0, 
  output        auto_int_out_0_0, 
  output        io_ctrl_ndreset, 
  output        io_ctrl_dmactive, 
  output        io_innerCtrl_valid, 
  output        io_innerCtrl_bits_resumereq, 
  output [9:0]  io_innerCtrl_bits_hartsel, 
  output        io_innerCtrl_bits_ackhavereset 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [6:0] TLMonitor_io_in_a_bits_address; 
  wire [3:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire  DMCONTROL_clock; 
  wire  DMCONTROL_reset; 
  wire [31:0] DMCONTROL_io_d; 
  wire [31:0] DMCONTROL_io_q; 
  wire  debugInterrupts_clock; 
  wire  debugInterrupts_reset; 
  wire [3:0] debugInterrupts_io_d; 
  wire [3:0] debugInterrupts_io_q; 
  wire  debugInterrupts_io_en; 
  wire [31:0] _T_298; 
  wire  DMCONTROLReg_dmactive; 
  wire  _T_330; 
  wire  _T_348; 
  wire [4:0] _T_349; 
  wire  _T_345_bits_index; 
  wire  _T_368; 
  wire  _T_514; 
  wire  _T_515; 
  wire  _T_516; 
  wire [1:0] _T_456; 
  wire  _T_457; 
  wire  _T_519; 
  wire  _T_520; 
  wire  _T_416; 
  wire [7:0] _T_424; 
  wire  _T_415; 
  wire [7:0] _T_422; 
  wire [15:0] _T_426; 
  wire  _T_414; 
  wire [7:0] _T_420; 
  wire  _T_413; 
  wire [7:0] _T_418; 
  wire [15:0] _T_425; 
  wire [31:0] _T_427; 
  wire [31:0] _T_436; 
  wire  _T_437; 
  wire  DMCONTROLWrEn; 
  wire [31:0] DMCONTROLWrDataVal; 
  wire  DMCONTROLWrData_ndmreset; 
  wire  DMCONTROLReg_ndmreset; 
  wire  _GEN_0; 
  wire  DMCONTROLNxt_ndmreset; 
  wire  DMCONTROLWrData_dmactive; 
  wire  _GEN_15; 
  wire  DMCONTROLNxt_dmactive; 
  wire [1:0] _T_285; 
  wire [9:0] DMCONTROLWrData_hartsello; 
  wire [9:0] DMCONTROLReg_hartsello; 
  wire [9:0] _GEN_1; 
  wire [9:0] DMCONTROLNxt_hartsello; 
  wire [9:0] DMCONTROLReg_hartselhi; 
  wire [9:0] DMCONTROLNxt_hartselhi; 
  wire [19:0] _T_286; 
  wire [3:0] DMCONTROLReg_reserved1; 
  wire [3:0] DMCONTROLNxt_reserved1; 
  wire [23:0] _T_287; 
  wire [25:0] _T_288; 
  wire  DMCONTROLWrData_ackhavereset; 
  wire  DMCONTROLReg_ackhavereset; 
  wire  _GEN_4; 
  wire  DMCONTROLNxt_ackhavereset; 
  wire  DMCONTROLReg_reserved0; 
  wire  DMCONTROLNxt_reserved0; 
  wire [1:0] _T_289; 
  wire  DMCONTROLReg_hasel; 
  wire  DMCONTROLNxt_hasel; 
  wire [2:0] _T_290; 
  wire  DMCONTROLWrData_haltreq; 
  wire  DMCONTROLReg_haltreq; 
  wire  _GEN_2; 
  wire  DMCONTROLNxt_haltreq; 
  wire  DMCONTROLWrData_resumereq; 
  wire  DMCONTROLReg_resumereq; 
  wire  _GEN_3; 
  wire  DMCONTROLNxt_resumereq; 
  wire [1:0] _T_291; 
  wire  DMCONTROLReg_hartreset; 
  wire  DMCONTROLNxt_hartreset; 
  wire [2:0] _T_292; 
  wire [5:0] _T_293; 
  wire [1:0] _T_331; 
  wire [19:0] _T_332; 
  wire [23:0] _T_333; 
  wire [25:0] _T_334; 
  wire [1:0] _T_335; 
  wire [2:0] _T_336; 
  wire [1:0] _T_337; 
  wire [2:0] _T_338; 
  wire [5:0] _T_339; 
  wire [31:0] _T_340; 
  wire  _T_652; 
  wire  _T_653; 
  wire  debugIntRegs_1; 
  wire  _GEN_20; 
  wire  debugIntNxt_1; 
  wire  _T_649; 
  wire  _T_650; 
  wire  debugIntRegs_0; 
  wire  _GEN_18; 
  wire  debugIntNxt_0; 
  wire [1:0] _T_603; 
  wire  _T_658; 
  wire  _T_659; 
  wire  debugIntRegs_3; 
  wire  _GEN_24; 
  wire  debugIntNxt_3; 
  wire  _T_655; 
  wire  _T_656; 
  wire  debugIntRegs_2; 
  wire  _GEN_22; 
  wire  debugIntNxt_2; 
  wire [1:0] _T_604; 
  TLMonitor_60 TLMonitor ( 
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode)
  );
  AsyncResetRegVec_w32_i0 DMCONTROL ( 
    .clock(DMCONTROL_clock),
    .reset(DMCONTROL_reset),
    .io_d(DMCONTROL_io_d),
    .io_q(DMCONTROL_io_q)
  );
  AsyncResetRegVec_w4_i0 debugInterrupts ( 
    .clock(debugInterrupts_clock),
    .reset(debugInterrupts_reset),
    .io_d(debugInterrupts_io_d),
    .io_q(debugInterrupts_io_q),
    .io_en(debugInterrupts_io_en)
  );
  assign _T_298 = DMCONTROL_io_q; 
  assign DMCONTROLReg_dmactive = _T_298[0]; 
  assign _T_330 = ~ DMCONTROLReg_dmactive; 
  assign _T_348 = auto_dmi_in_a_bits_opcode == 3'h4; 
  assign _T_349 = auto_dmi_in_a_bits_address[6:2]; 
  assign _T_345_bits_index = _T_349[0]; 
  assign _T_368 = _T_345_bits_index == 1'h0; 
  assign _T_514 = auto_dmi_in_a_valid & auto_dmi_in_d_ready; 
  assign _T_515 = _T_348 == 1'h0; 
  assign _T_516 = _T_514 & _T_515; 
  assign _T_456 = 2'h1 << 1'h0; 
  assign _T_457 = _T_456[0]; 
  assign _T_519 = _T_516 & _T_457; 
  assign _T_520 = _T_519 & _T_368; 
  assign _T_416 = auto_dmi_in_a_bits_mask[3]; 
  assign _T_424 = _T_416 ? 8'hff : 8'h0; 
  assign _T_415 = auto_dmi_in_a_bits_mask[2]; 
  assign _T_422 = _T_415 ? 8'hff : 8'h0; 
  assign _T_426 = {_T_424,_T_422}; 
  assign _T_414 = auto_dmi_in_a_bits_mask[1]; 
  assign _T_420 = _T_414 ? 8'hff : 8'h0; 
  assign _T_413 = auto_dmi_in_a_bits_mask[0]; 
  assign _T_418 = _T_413 ? 8'hff : 8'h0; 
  assign _T_425 = {_T_420,_T_418}; 
  assign _T_427 = {_T_426,_T_425}; 
  assign _T_436 = ~ _T_427; 
  assign _T_437 = _T_436 == 32'h0; 
  assign DMCONTROLWrEn = _T_520 & _T_437; 
  assign DMCONTROLWrDataVal = DMCONTROLWrEn ? auto_dmi_in_a_bits_data : 32'h0; 
  assign DMCONTROLWrData_ndmreset = DMCONTROLWrDataVal[1]; 
  assign DMCONTROLReg_ndmreset = _T_298[1]; 
  assign _GEN_0 = DMCONTROLWrEn ? DMCONTROLWrData_ndmreset : DMCONTROLReg_ndmreset; 
  assign DMCONTROLNxt_ndmreset = _T_330 ? 1'h0 : _GEN_0; 
  assign DMCONTROLWrData_dmactive = DMCONTROLWrDataVal[0]; 
  assign _GEN_15 = _T_330 ? 1'h0 : DMCONTROLReg_dmactive; 
  assign DMCONTROLNxt_dmactive = DMCONTROLWrEn ? DMCONTROLWrData_dmactive : _GEN_15; 
  assign _T_285 = {DMCONTROLNxt_ndmreset,DMCONTROLNxt_dmactive}; 
  assign DMCONTROLWrData_hartsello = DMCONTROLWrDataVal[25:16]; 
  assign DMCONTROLReg_hartsello = _T_298[25:16]; 
  assign _GEN_1 = DMCONTROLWrEn ? DMCONTROLWrData_hartsello : DMCONTROLReg_hartsello; 
  assign DMCONTROLNxt_hartsello = _T_330 ? 10'h0 : _GEN_1; 
  assign DMCONTROLReg_hartselhi = _T_298[15:6]; 
  assign DMCONTROLNxt_hartselhi = _T_330 ? 10'h0 : DMCONTROLReg_hartselhi; 
  assign _T_286 = {DMCONTROLNxt_hartsello,DMCONTROLNxt_hartselhi}; 
  assign DMCONTROLReg_reserved1 = _T_298[5:2]; 
  assign DMCONTROLNxt_reserved1 = _T_330 ? 4'h0 : DMCONTROLReg_reserved1; 
  assign _T_287 = {_T_286,DMCONTROLNxt_reserved1}; 
  assign _T_288 = {_T_287,_T_285}; 
  assign DMCONTROLWrData_ackhavereset = DMCONTROLWrDataVal[28]; 
  assign DMCONTROLReg_ackhavereset = _T_298[28]; 
  assign _GEN_4 = DMCONTROLWrEn ? DMCONTROLWrData_ackhavereset : DMCONTROLReg_ackhavereset; 
  assign DMCONTROLNxt_ackhavereset = _T_330 ? 1'h0 : _GEN_4; 
  assign DMCONTROLReg_reserved0 = _T_298[27]; 
  assign DMCONTROLNxt_reserved0 = _T_330 ? 1'h0 : DMCONTROLReg_reserved0; 
  assign _T_289 = {DMCONTROLNxt_ackhavereset,DMCONTROLNxt_reserved0}; 
  assign DMCONTROLReg_hasel = _T_298[26]; 
  assign DMCONTROLNxt_hasel = _T_330 ? 1'h0 : DMCONTROLReg_hasel; 
  assign _T_290 = {_T_289,DMCONTROLNxt_hasel}; 
  assign DMCONTROLWrData_haltreq = DMCONTROLWrDataVal[31]; 
  assign DMCONTROLReg_haltreq = _T_298[31]; 
  assign _GEN_2 = DMCONTROLWrEn ? DMCONTROLWrData_haltreq : DMCONTROLReg_haltreq; 
  assign DMCONTROLNxt_haltreq = _T_330 ? 1'h0 : _GEN_2; 
  assign DMCONTROLWrData_resumereq = DMCONTROLWrDataVal[30]; 
  assign DMCONTROLReg_resumereq = _T_298[30]; 
  assign _GEN_3 = DMCONTROLWrEn ? DMCONTROLWrData_resumereq : DMCONTROLReg_resumereq; 
  assign DMCONTROLNxt_resumereq = _T_330 ? 1'h0 : _GEN_3; 
  assign _T_291 = {DMCONTROLNxt_haltreq,DMCONTROLNxt_resumereq}; 
  assign DMCONTROLReg_hartreset = _T_298[29]; 
  assign DMCONTROLNxt_hartreset = _T_330 ? 1'h0 : DMCONTROLReg_hartreset; 
  assign _T_292 = {_T_291,DMCONTROLNxt_hartreset}; 
  assign _T_293 = {_T_292,_T_290}; 
  assign _T_331 = {DMCONTROLReg_ndmreset,DMCONTROLReg_dmactive}; 
  assign _T_332 = {DMCONTROLReg_hartsello,DMCONTROLReg_hartselhi}; 
  assign _T_333 = {_T_332,DMCONTROLReg_reserved1}; 
  assign _T_334 = {_T_333,_T_331}; 
  assign _T_335 = {DMCONTROLReg_ackhavereset,DMCONTROLReg_reserved0}; 
  assign _T_336 = {_T_335,DMCONTROLReg_hasel}; 
  assign _T_337 = {DMCONTROLReg_haltreq,DMCONTROLReg_resumereq}; 
  assign _T_338 = {_T_337,DMCONTROLReg_hartreset}; 
  assign _T_339 = {_T_338,_T_336}; 
  assign _T_340 = {_T_339,_T_334}; 
  assign _T_652 = DMCONTROLWrData_hartsello == 10'h1; 
  assign _T_653 = DMCONTROLWrEn & _T_652; 
  assign debugIntRegs_1 = debugInterrupts_io_q[1]; 
  assign _GEN_20 = _T_653 ? DMCONTROLWrData_haltreq : debugIntRegs_1; 
  assign debugIntNxt_1 = _T_330 ? 1'h0 : _GEN_20; 
  assign _T_649 = DMCONTROLWrData_hartsello == 10'h0; 
  assign _T_650 = DMCONTROLWrEn & _T_649; 
  assign debugIntRegs_0 = debugInterrupts_io_q[0]; 
  assign _GEN_18 = _T_650 ? DMCONTROLWrData_haltreq : debugIntRegs_0; 
  assign debugIntNxt_0 = _T_330 ? 1'h0 : _GEN_18; 
  assign _T_603 = {debugIntNxt_1,debugIntNxt_0}; 
  assign _T_658 = DMCONTROLWrData_hartsello == 10'h3; 
  assign _T_659 = DMCONTROLWrEn & _T_658; 
  assign debugIntRegs_3 = debugInterrupts_io_q[3]; 
  assign _GEN_24 = _T_659 ? DMCONTROLWrData_haltreq : debugIntRegs_3; 
  assign debugIntNxt_3 = _T_330 ? 1'h0 : _GEN_24; 
  assign _T_655 = DMCONTROLWrData_hartsello == 10'h2; 
  assign _T_656 = DMCONTROLWrEn & _T_655; 
  assign debugIntRegs_2 = debugInterrupts_io_q[2]; 
  assign _GEN_22 = _T_656 ? DMCONTROLWrData_haltreq : debugIntRegs_2; 
  assign debugIntNxt_2 = _T_330 ? 1'h0 : _GEN_22; 
  assign _T_604 = {debugIntNxt_3,debugIntNxt_2}; 
  assign auto_dmi_in_a_ready = auto_dmi_in_d_ready; 
  assign auto_dmi_in_d_valid = auto_dmi_in_a_valid; 
  assign auto_dmi_in_d_bits_opcode = {{2'd0}, _T_348}; 
  assign auto_dmi_in_d_bits_data = _T_368 ? _T_340 : 32'h0; 
  assign auto_int_out_3_0 = debugInterrupts_io_q[3]; 
  assign auto_int_out_2_0 = debugInterrupts_io_q[2]; 
  assign auto_int_out_1_0 = debugInterrupts_io_q[1]; 
  assign auto_int_out_0_0 = debugInterrupts_io_q[0]; 
  assign io_ctrl_ndreset = _T_298[1]; 
  assign io_ctrl_dmactive = _T_298[0]; 
  assign io_innerCtrl_valid = _T_520 & _T_437; 
  assign io_innerCtrl_bits_resumereq = DMCONTROLWrDataVal[30]; 
  assign io_innerCtrl_bits_hartsel = DMCONTROLWrDataVal[25:16]; 
  assign io_innerCtrl_bits_ackhavereset = DMCONTROLWrDataVal[28]; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = auto_dmi_in_d_ready; 
  assign TLMonitor_io_in_a_valid = auto_dmi_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_dmi_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_address = auto_dmi_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_dmi_in_a_bits_mask; 
  assign TLMonitor_io_in_d_ready = auto_dmi_in_d_ready; 
  assign TLMonitor_io_in_d_valid = auto_dmi_in_a_valid; 
  assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, _T_348}; 
  assign DMCONTROL_clock = clock; 
  assign DMCONTROL_reset = reset; 
  assign DMCONTROL_io_d = {_T_293,_T_288}; 
  assign debugInterrupts_clock = clock; 
  assign debugInterrupts_reset = reset; 
  assign debugInterrupts_io_d = {_T_604,_T_603}; 
  assign debugInterrupts_io_en = 1'h1; 
endmodule
