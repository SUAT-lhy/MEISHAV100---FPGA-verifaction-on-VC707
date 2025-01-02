module JtagTapController( 
  input        clock, 
  input        reset, 
  input        io_jtag_TMS, 
  input        io_jtag_TDI, 
  output       io_jtag_TDO_data, 
  input        io_control_jtag_reset, 
  output [4:0] io_output_instruction, 
  output       io_output_reset, 
  output       io_dataChainOut_shift, 
  output       io_dataChainOut_data, 
  output       io_dataChainOut_capture, 
  output       io_dataChainOut_update, 
  input        io_dataChainIn_data 
);
  wire  stateMachine_clock; 
  wire  stateMachine_reset; 
  wire  stateMachine_io_tms; 
  wire [3:0] stateMachine_io_currState; 
  wire  irChain_clock; 
  wire  irChain_reset; 
  wire  irChain_io_chainIn_shift; 
  wire  irChain_io_chainIn_data; 
  wire  irChain_io_chainIn_capture; 
  wire  irChain_io_chainIn_update; 
  wire  irChain_io_chainOut_data; 
  wire [4:0] irChain_io_update_bits; 
  wire  _T_37; 
  wire  _T_38; 
  wire  _T_39; 
  reg  tdoReg; 
  reg [31:0] _RAND_0;
  wire [3:0] currState; 
  wire  _T_62; 
  wire  _GEN_7; 
  wire  _T_49; 
  reg [4:0] irReg; 
  reg [31:0] _RAND_1;
  wire  updateInstruction; 
  wire [4:0] _GEN_3; 
  JtagStateMachine stateMachine ( 
    .clock(stateMachine_clock),
    .reset(stateMachine_reset),
    .io_tms(stateMachine_io_tms),
    .io_currState(stateMachine_io_currState)
  );
  CaptureUpdateChain_2 irChain ( 
    .clock(irChain_clock),
    .reset(irChain_reset),
    .io_chainIn_shift(irChain_io_chainIn_shift),
    .io_chainIn_data(irChain_io_chainIn_data),
    .io_chainIn_capture(irChain_io_chainIn_capture),
    .io_chainIn_update(irChain_io_chainIn_update),
    .io_chainOut_data(irChain_io_chainOut_data),
    .io_update_bits(irChain_io_update_bits)
  );
  assign _T_37 = $unsigned(clock); 
  assign _T_38 = _T_37 == 1'h0; 
  assign _T_39 = _T_38; 
  assign currState = stateMachine_io_currState; 
  assign _T_62 = currState == 4'h2; 
  assign _GEN_7 = irChain_io_chainOut_data; 
  assign _T_49 = currState == 4'hd; 
  assign updateInstruction = reset ? 1'h1 : _T_49; 
  assign _GEN_3 = irChain_io_update_bits; 
  assign io_jtag_TDO_data = tdoReg; 
  assign io_output_instruction = irReg; 
  assign io_output_reset = currState == 4'hf; 
  assign io_dataChainOut_shift = currState == 4'h2; 
  assign io_dataChainOut_data = io_jtag_TDI; 
  assign io_dataChainOut_capture = currState == 4'h6; 
  assign io_dataChainOut_update = currState == 4'h5; 
  assign stateMachine_clock = clock; 
  assign stateMachine_reset = io_control_jtag_reset; 
  assign stateMachine_io_tms = io_jtag_TMS; 
  assign irChain_clock = clock; 
  assign irChain_reset = reset; 
  assign irChain_io_chainIn_shift = currState == 4'ha; 
  assign irChain_io_chainIn_data = io_jtag_TDI; 
  assign irChain_io_chainIn_capture = currState == 4'he; 
  assign irChain_io_chainIn_update = currState == 4'hd; 
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
  tdoReg = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  irReg = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge _T_39) begin
    if (_T_62) begin
      tdoReg <= io_dataChainIn_data;
    end else begin
      tdoReg <= _GEN_7;
    end
    if (updateInstruction) begin
      if (reset) begin
        irReg <= 5'h1;
      end else begin
        irReg <= _GEN_3;
      end
    end
  end
endmodule
