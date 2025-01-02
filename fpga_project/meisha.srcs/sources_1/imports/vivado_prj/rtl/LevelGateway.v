module LevelGateway( 
  input   clock, 
  input   reset, 
  input   io_interrupt, 
  output  io_plic_valid, 
  input   io_plic_ready, 
  input   io_plic_complete 
);
  reg  inFlight; 
  reg [31:0] _RAND_0;
  wire  _T_9; 
  wire  _T_10; 
  assign _T_9 = io_interrupt & io_plic_ready; 
  assign _T_10 = inFlight == 1'h0; 
  assign io_plic_valid = io_interrupt & _T_10; 
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
  inFlight = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      inFlight <= 1'h0;
    end else begin
      if (io_plic_complete) begin
        inFlight <= 1'h0;
      end else begin
        if (_T_9) begin
          inFlight <= 1'h1;
        end
      end
    end
  end
endmodule
