module UARTRx( 
  input         clock, 
  input         reset, 
  input         io_en, 
  input         io_in, 
  output        io_out_valid, 
  output [7:0]  io_out_bits, 
  input  [15:0] io_div 
);
  reg [1:0] debounce; 
  reg [31:0] _RAND_0;
  wire  debounce_max; 
  wire  debounce_min; 
  reg [12:0] prescaler; 
  reg [31:0] _RAND_1;
  wire  pulse; 
  reg [3:0] data_count; 
  reg [31:0] _RAND_2;
  wire  data_last; 
  reg [3:0] sample_count; 
  reg [31:0] _RAND_3;
  wire  sample_mid; 
  wire [7:0] _T_14; 
  wire [8:0] _T_15; 
  wire [8:0] _T_16; 
  wire [7:0] countdown; 
  wire [3:0] remainder; 
  wire  extend; 
  reg  state; 
  reg [31:0] _RAND_4;
  wire  _T_34; 
  wire  _T_42; 
  wire  _GEN_8; 
  wire  start; 
  wire  restore; 
  wire [11:0] _T_17; 
  wire [12:0] prescaler_in; 
  wire  _T_18; 
  wire  _T_19; 
  wire [12:0] _GEN_41; 
  wire [13:0] _T_20; 
  wire [13:0] _T_21; 
  wire [12:0] prescaler_next; 
  reg [2:0] sample; 
  reg [31:0] _RAND_5;
  wire  _T_23; 
  wire  _T_24; 
  wire  _T_25; 
  wire  _T_26; 
  wire  _T_27; 
  wire  _T_28; 
  wire  _T_29; 
  wire  voter; 
  reg [7:0] shifter; 
  reg [31:0] _RAND_6;
  reg  valid; 
  reg [31:0] _RAND_7;
  wire  _T_36; 
  wire  _T_37; 
  wire  _T_38; 
  wire [2:0] _T_39; 
  wire [2:0] _T_40; 
  wire [1:0] _T_41; 
  wire [1:0] _T_44; 
  wire [3:0] _T_46; 
  wire [3:0] _T_47; 
  wire [3:0] _T_48; 
  wire [6:0] _T_49; 
  wire [7:0] _T_50; 
  wire [3:0] _GEN_18; 
  wire [3:0] _GEN_25; 
  wire [3:0] _GEN_37; 
  wire  _T_51; 
  assign debounce_max = debounce == 2'h3; 
  assign debounce_min = debounce == 2'h0; 
  assign pulse = prescaler == 13'h0; 
  assign data_last = data_count == 4'h0; 
  assign sample_mid = sample_count == 4'h7; 
  assign _T_14 = {data_count,sample_count}; 
  assign _T_15 = _T_14 - 8'h1; 
  assign _T_16 = $unsigned(_T_15); 
  assign countdown = _T_16[7:0]; 
  assign remainder = io_div[3:0]; 
  assign extend = sample_count < remainder; 
  assign _T_34 = 1'h0 == state; 
  assign _T_42 = io_in == 1'h0; 
  assign _GEN_8 = _T_42 ? debounce_max : 1'h0; 
  assign start = _T_34 ? _GEN_8 : 1'h0; 
  assign restore = start | pulse; 
  assign _T_17 = io_div[15:4]; 
  assign prescaler_in = restore ? {{1'd0}, _T_17} : prescaler; 
  assign _T_18 = restore & extend; 
  assign _T_19 = _T_18 ? 1'h0 : 1'h1; 
  assign _GEN_41 = {{12'd0}, _T_19}; 
  assign _T_20 = prescaler_in - _GEN_41; 
  assign _T_21 = $unsigned(_T_20); 
  assign prescaler_next = _T_21[12:0]; 
  assign _T_23 = sample[0]; 
  assign _T_24 = sample[1]; 
  assign _T_25 = sample[2]; 
  assign _T_26 = _T_23 & _T_24; 
  assign _T_27 = _T_23 & _T_25; 
  assign _T_28 = _T_26 | _T_27; 
  assign _T_29 = _T_24 & _T_25; 
  assign voter = _T_28 | _T_29; 
  assign _T_36 = _T_42 == 1'h0; 
  assign _T_37 = debounce_min == 1'h0; 
  assign _T_38 = _T_36 & _T_37; 
  assign _T_39 = debounce - 2'h1; 
  assign _T_40 = $unsigned(_T_39); 
  assign _T_41 = _T_40[1:0]; 
  assign _T_44 = debounce + 2'h1; 
  assign _T_46 = {sample,io_in}; 
  assign _T_47 = countdown[7:4]; 
  assign _T_48 = countdown[3:0]; 
  assign _T_49 = shifter[7:1]; 
  assign _T_50 = {voter,_T_49}; 
  assign _GEN_18 = pulse ? _T_46 : {{1'd0}, sample}; 
  assign _GEN_25 = state ? _GEN_18 : {{1'd0}, sample}; 
  assign _GEN_37 = _T_34 ? {{1'd0}, sample} : _GEN_25; 
  assign _T_51 = io_en == 1'h0; 
  assign io_out_valid = valid; 
  assign io_out_bits = shifter; 
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
  debounce = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  prescaler = _RAND_1[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  data_count = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  sample_count = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  state = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  sample = _RAND_5[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  shifter = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      debounce <= 2'h0;
    end else begin
      if (_T_51) begin
        debounce <= 2'h0;
      end else begin
        if (_T_34) begin
          if (_T_42) begin
            debounce <= _T_44;
          end else begin
            if (_T_38) begin
              debounce <= _T_41;
            end
          end
        end
      end
    end
    if (_T_34) begin
      if (_T_42) begin
        if (debounce_max) begin
          prescaler <= prescaler_next;
        end
      end
    end else begin
      if (state) begin
        prescaler <= prescaler_next;
      end
    end
    if (_T_34) begin
      if (_T_42) begin
        if (debounce_max) begin
          data_count <= 4'h9;
        end
      end
    end else begin
      if (state) begin
        if (pulse) begin
          data_count <= _T_47;
        end
      end
    end
    if (_T_34) begin
      if (_T_42) begin
        if (debounce_max) begin
          sample_count <= 4'hf;
        end
      end
    end else begin
      if (state) begin
        if (pulse) begin
          sample_count <= _T_48;
        end
      end
    end
    if (reset) begin
      state <= 1'h0;
    end else begin
      if (_T_34) begin
        if (_T_42) begin
          if (debounce_max) begin
            state <= 1'h1;
          end
        end
      end else begin
        if (state) begin
          if (pulse) begin
            if (sample_mid) begin
              if (data_last) begin
                state <= 1'h0;
              end
            end
          end
        end
      end
    end
    sample <= _GEN_37[2:0];
    if (!(_T_34)) begin
      if (state) begin
        if (pulse) begin
          if (sample_mid) begin
            if (!(data_last)) begin
              shifter <= _T_50;
            end
          end
        end
      end
    end
    if (reset) begin
      valid <= 1'h0;
    end else begin
      if (_T_34) begin
        valid <= 1'h0;
      end else begin
        if (state) begin
          if (pulse) begin
            if (sample_mid) begin
              valid <= data_last;
            end else begin
              valid <= 1'h0;
            end
          end else begin
            valid <= 1'h0;
          end
        end else begin
          valid <= 1'h0;
        end
      end
    end
  end
endmodule
