module UARTTx( 
  input         clock, 
  input         reset, 
  input         io_en, 
  output        io_in_ready, 
  input         io_in_valid, 
  input  [7:0]  io_in_bits, 
  output        io_out, 
  input  [15:0] io_div, 
  input         io_nstop 
);
  wire [31:0] plusarg_reader_out; 
  reg [15:0] prescaler; 
  reg [31:0] _RAND_0;
  wire  pulse; 
  reg [3:0] counter; 
  reg [31:0] _RAND_1;
  reg [8:0] shifter; 
  reg [31:0] _RAND_2;
  reg  out; 
  reg [31:0] _RAND_3;
  wire  plusarg_tx; 
  wire  busy; 
  wire  _T_18; 
  wire  _T_20; 
  wire  _T_22; 
  wire  _T_24; 
  wire [8:0] _T_25; 
  wire  _T_26; 
  wire [3:0] _T_29; 
  wire [3:0] _T_30; 
  wire [3:0] _T_31; 
  wire [16:0] _T_34; 
  wire [16:0] _T_35; 
  wire [15:0] _T_36; 
  wire  _T_38; 
  wire [4:0] _T_39; 
  wire [4:0] _T_40; 
  wire [3:0] _T_41; 
  wire [7:0] _T_42; 
  wire [8:0] _T_43; 
  wire  _T_44; 
  wire print_uart;
  plusarg_reader #(.FORMAT("uart_tx=%d"), .DEFAULT(1)) plusarg_reader ( 
    .out(plusarg_reader_out)
  );
  assign pulse = prescaler == 16'h0; 
  assign plusarg_tx = plusarg_reader_out != 32'h0; 
  assign busy = counter != 4'h0; 
  assign _T_18 = busy == 1'h0; 
  assign _T_20 = io_in_ready & io_in_valid; 
  assign _T_22 = reset == 1'h0; 
  assign _T_24 = _T_20 & plusarg_tx; 
  assign _T_25 = {io_in_bits,1'h0}; 
  assign _T_26 = io_nstop == 1'h0; 
  assign _T_29 = _T_26 ? 4'ha : 4'h0; 
  assign _T_30 = io_nstop ? 4'hb : 4'h0; 
  assign _T_31 = _T_29 | _T_30; 
  assign _T_34 = prescaler - 16'h1; 
  assign _T_35 = $unsigned(_T_34); 
  assign _T_36 = _T_35[15:0]; 
  assign _T_38 = pulse & busy; 
  assign _T_39 = counter - 4'h1; 
  assign _T_40 = $unsigned(_T_39); 
  assign _T_41 = _T_40[3:0]; 
  assign _T_42 = shifter[8:1]; 
  assign _T_43 = {1'h1,_T_42}; 
  assign _T_44 = shifter[0]; 
  assign io_in_ready = io_en & _T_18; 
  assign io_out = out; 
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
  prescaler = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  counter = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  shifter = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  out = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  assign print_uart = 1'b1;
  always @(posedge clock) begin
    if (reset) begin
      prescaler <= 16'h0;
    end else begin
      if (busy) begin
        if (pulse) begin
          prescaler <= io_div;
        end else begin
          prescaler <= _T_36;
        end
      end
    end
    if (reset) begin
      counter <= 4'h0;
    end else begin
      if (_T_38) begin
        counter <= _T_41;
      end else begin
        if (_T_24) begin
          counter <= _T_31;
        end
      end
    end
    if (_T_38) begin
      shifter <= _T_43;
    end else begin
      if (_T_24) begin
        shifter <= _T_25;
      end
    end
    if (reset) begin
      out <= 1'h1;
    end else begin
      if (_T_38) begin
        out <= _T_44;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND & print_uart) begin
    `endif
        if (_T_20 & _T_22) begin
          //$fwrite(32'h80000002,"UART TX (%x): %c\n",io_in_bits,io_in_bits); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
