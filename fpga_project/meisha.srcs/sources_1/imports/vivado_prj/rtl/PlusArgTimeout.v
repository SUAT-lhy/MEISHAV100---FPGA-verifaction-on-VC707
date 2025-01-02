module PlusArgTimeout( 
  input         clock, 
  input         reset, 
  input  [31:0] io_count 
);
  wire [31:0] plusarg_reader_out; 
  wire  _T_5; 
  wire  _T_6; 
  wire  _T_8; 
  wire  _T_9; 
  plusarg_reader #(.FORMAT("max_core_cycles=%d"), .DEFAULT(0)) plusarg_reader ( 
    .out(plusarg_reader_out)
  );
  assign _T_5 = plusarg_reader_out > 32'h0; 
  assign _T_6 = io_count < plusarg_reader_out; 
  assign _T_8 = _T_6 | reset; 
  assign _T_9 = _T_8 == 1'h0; 
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_5 & _T_9) begin
          $fwrite(32'h80000002,"Assertion failed: Timeout exceeded: Kill the emulation after INT rdtime cycles. Off if 0.\n    at PlusArg.scala:28 assert (io.count < max, s\"Timeout exceeded: $docstring\")\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_5 & _T_9) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
