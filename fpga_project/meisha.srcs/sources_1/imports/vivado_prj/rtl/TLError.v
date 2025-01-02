module TLError( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [2:0]  auto_in_a_bits_size, 
  input  [4:0]  auto_in_a_bits_source, 
  input  [13:0] auto_in_a_bits_address, 
  input  [7:0]  auto_in_a_bits_mask, 
  input         auto_in_a_bits_corrupt, 
  output        auto_in_c_ready, 
  input         auto_in_c_valid, 
  input  [2:0]  auto_in_c_bits_opcode, 
  input  [2:0]  auto_in_c_bits_param, 
  input  [2:0]  auto_in_c_bits_size, 
  input  [4:0]  auto_in_c_bits_source, 
  input  [13:0] auto_in_c_bits_address, 
  input         auto_in_c_bits_corrupt, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output [2:0]  auto_in_d_bits_opcode, 
  output [1:0]  auto_in_d_bits_param, 
  output [2:0]  auto_in_d_bits_size, 
  output [4:0]  auto_in_d_bits_source, 
  output        auto_in_d_bits_sink, 
  output        auto_in_d_bits_denied, 
  output [63:0] auto_in_d_bits_data, 
  output        auto_in_d_bits_corrupt, 
  input         auto_in_e_valid, 
  input         auto_in_e_bits_sink 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire [4:0] TLMonitor_io_in_a_bits_source; 
  wire [13:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_c_ready; 
  wire  TLMonitor_io_in_c_valid; 
  wire [2:0] TLMonitor_io_in_c_bits_opcode; 
  wire [2:0] TLMonitor_io_in_c_bits_param; 
  wire [2:0] TLMonitor_io_in_c_bits_size; 
  wire [4:0] TLMonitor_io_in_c_bits_source; 
  wire [13:0] TLMonitor_io_in_c_bits_address; 
  wire  TLMonitor_io_in_c_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_param; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire [4:0] TLMonitor_io_in_d_bits_source; 
  wire  TLMonitor_io_in_d_bits_sink; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  wire  TLMonitor_io_in_e_valid; 
  wire  TLMonitor_io_in_e_bits_sink; 
  wire  a_clock; 
  wire  a_reset; 
  wire  a_io_enq_ready; 
  wire  a_io_enq_valid; 
  wire [2:0] a_io_enq_bits_opcode; 
  wire [2:0] a_io_enq_bits_size; 
  wire [4:0] a_io_enq_bits_source; 
  wire  a_io_deq_ready; 
  wire  a_io_deq_valid; 
  wire [2:0] a_io_deq_bits_opcode; 
  wire [2:0] a_io_deq_bits_size; 
  wire [4:0] a_io_deq_bits_source; 
  wire  Queue_clock; 
  wire  Queue_reset; 
  wire  Queue_io_enq_ready; 
  wire  Queue_io_enq_valid; 
  wire [2:0] Queue_io_enq_bits_opcode; 
  wire [2:0] Queue_io_enq_bits_param; 
  wire [2:0] Queue_io_enq_bits_size; 
  wire [4:0] Queue_io_enq_bits_source; 
  wire  Queue_io_deq_ready; 
  wire  Queue_io_deq_valid; 
  wire [2:0] Queue_io_deq_bits_opcode; 
  wire [2:0] Queue_io_deq_bits_param; 
  wire [2:0] Queue_io_deq_bits_size; 
  wire [4:0] Queue_io_deq_bits_source; 
  reg  idle; 
  reg [31:0] _RAND_0;
  wire  _T_159; 
  wire [13:0] _T_161; 
  wire [6:0] _T_162; 
  wire [6:0] _T_163; 
  wire [3:0] _T_164; 
  wire  _T_165; 
  wire  _T_166; 
  wire [3:0] _T_167; 
  reg [3:0] _T_169; 
  reg [31:0] _RAND_1;
  wire [4:0] _T_170; 
  wire [4:0] _T_171; 
  wire [3:0] _T_172; 
  wire  _T_173; 
  wire  _T_174; 
  wire  _T_175; 
  wire  a_last; 
  reg [3:0] _T_304; 
  reg [31:0] _RAND_2;
  wire  _T_305; 
  wire  _T_207; 
  wire  da_valid; 
  reg [3:0] _T_237; 
  reg [31:0] _RAND_3;
  wire  _T_242; 
  wire  _T_234; 
  wire [13:0] _T_230; 
  wire [6:0] _T_231; 
  wire [6:0] _T_232; 
  wire [3:0] _T_233; 
  wire [3:0] _T_235; 
  wire  _T_243; 
  wire  _T_244; 
  wire  _T_277; 
  wire [1:0] _T_307; 
  wire [2:0] _GEN_17; 
  wire [2:0] _T_308; 
  wire [1:0] _T_309; 
  wire [1:0] _T_310; 
  wire [2:0] _GEN_18; 
  wire [2:0] _T_312; 
  wire [1:0] _T_313; 
  wire [1:0] _T_314; 
  wire  _T_316; 
  reg  _T_378_1; 
  reg [31:0] _RAND_4;
  wire  _T_397_1; 
  wire  da_ready; 
  wire  _T_180; 
  wire [2:0] da_bits_size; 
  wire [13:0] _T_182; 
  wire [6:0] _T_183; 
  wire [6:0] _T_184; 
  wire [3:0] _T_185; 
  wire [2:0] _GEN_4; 
  wire [2:0] _GEN_5; 
  wire [2:0] _GEN_6; 
  wire [2:0] _GEN_7; 
  wire [2:0] _GEN_8; 
  wire [2:0] da_bits_opcode; 
  wire  _T_186; 
  wire [3:0] _T_187; 
  reg [3:0] _T_189; 
  reg [31:0] _RAND_5;
  wire [4:0] _T_190; 
  wire [4:0] _T_191; 
  wire [3:0] _T_192; 
  wire  da_first; 
  wire  _T_193; 
  wire  _T_194; 
  wire  da_last; 
  wire  _T_199; 
  wire  _T_201; 
  wire  _T_202; 
  wire  _T_203; 
  wire  _T_204; 
  wire  _T_205; 
  wire  _T_228; 
  wire [4:0] _T_238; 
  wire [4:0] _T_239; 
  wire [3:0] _T_240; 
  wire  _T_241; 
  wire  _T_315; 
  reg  _T_378_0; 
  reg [31:0] _RAND_6;
  wire  _T_397_0; 
  wire  _T_405; 
  wire [2:0] _T_225_bits_size; 
  wire  _T_271; 
  wire  _T_272; 
  wire  _T_275; 
  wire [1:0] _T_288; 
  wire [1:0] _GEN_15; 
  wire [1:0] _GEN_16; 
  wire  _T_306; 
  wire  _T_325; 
  wire  _T_326; 
  wire  _T_336; 
  wire  _T_338; 
  wire  _T_341; 
  wire  _T_342; 
  wire  _T_345; 
  wire  _T_346; 
  wire  _T_347; 
  wire  _T_348; 
  wire  _T_350; 
  wire  _T_352; 
  wire  _T_353; 
  wire  _T_409; 
  wire  _T_410; 
  wire  _T_411; 
  wire  in_d_valid; 
  wire  _T_357; 
  wire [3:0] _GEN_19; 
  wire [4:0] _T_358; 
  wire [4:0] _T_359; 
  wire [3:0] _T_360; 
  wire  _T_389_0; 
  wire  _T_389_1; 
  wire [4:0] _T_225_bits_source; 
  wire [7:0] _T_419; 
  wire [4:0] _T_420; 
  wire [12:0] _T_421; 
  wire [79:0] _T_422; 
  wire [79:0] _T_423; 
  wire [64:0] _T_424; 
  wire [66:0] _T_426; 
  wire [4:0] da_bits_source; 
  wire [7:0] _T_427; 
  wire [4:0] _T_428; 
  wire [12:0] _T_429; 
  wire [79:0] _T_430; 
  wire [79:0] _T_431; 
  wire [79:0] _T_432; 
  TLMonitor_27 TLMonitor ( 
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_io_in_a_bits_corrupt),
    .io_in_c_ready(TLMonitor_io_in_c_ready),
    .io_in_c_valid(TLMonitor_io_in_c_valid),
    .io_in_c_bits_opcode(TLMonitor_io_in_c_bits_opcode),
    .io_in_c_bits_param(TLMonitor_io_in_c_bits_param),
    .io_in_c_bits_size(TLMonitor_io_in_c_bits_size),
    .io_in_c_bits_source(TLMonitor_io_in_c_bits_source),
    .io_in_c_bits_address(TLMonitor_io_in_c_bits_address),
    .io_in_c_bits_corrupt(TLMonitor_io_in_c_bits_corrupt),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt),
    .io_in_e_valid(TLMonitor_io_in_e_valid),
    .io_in_e_bits_sink(TLMonitor_io_in_e_bits_sink)
  );
  Queue_2 a ( 
    .clock(a_clock),
    .reset(a_reset),
    .io_enq_ready(a_io_enq_ready),
    .io_enq_valid(a_io_enq_valid),
    .io_enq_bits_opcode(a_io_enq_bits_opcode),
    .io_enq_bits_size(a_io_enq_bits_size),
    .io_enq_bits_source(a_io_enq_bits_source),
    .io_deq_ready(a_io_deq_ready),
    .io_deq_valid(a_io_deq_valid),
    .io_deq_bits_opcode(a_io_deq_bits_opcode),
    .io_deq_bits_size(a_io_deq_bits_size),
    .io_deq_bits_source(a_io_deq_bits_source)
  );
  Queue_3 Queue ( 
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_opcode(Queue_io_enq_bits_opcode),
    .io_enq_bits_param(Queue_io_enq_bits_param),
    .io_enq_bits_size(Queue_io_enq_bits_size),
    .io_enq_bits_source(Queue_io_enq_bits_source),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_opcode(Queue_io_deq_bits_opcode),
    .io_deq_bits_param(Queue_io_deq_bits_param),
    .io_deq_bits_size(Queue_io_deq_bits_size),
    .io_deq_bits_source(Queue_io_deq_bits_source)
  );
  assign _T_159 = a_io_deq_ready & a_io_deq_valid; 
  assign _T_161 = 14'h7f << a_io_deq_bits_size; 
  assign _T_162 = _T_161[6:0]; 
  assign _T_163 = ~ _T_162; 
  assign _T_164 = _T_163[6:3]; 
  assign _T_165 = a_io_deq_bits_opcode[2]; 
  assign _T_166 = _T_165 == 1'h0; 
  assign _T_167 = _T_166 ? _T_164 : 4'h0; 
  assign _T_170 = _T_169 - 4'h1; 
  assign _T_171 = $unsigned(_T_170); 
  assign _T_172 = _T_171[3:0]; 
  assign _T_173 = _T_169 == 4'h0; 
  assign _T_174 = _T_169 == 4'h1; 
  assign _T_175 = _T_167 == 4'h0; 
  assign a_last = _T_174 | _T_175; 
  assign _T_305 = _T_304 == 4'h0; 
  assign _T_207 = a_io_deq_valid & a_last; 
  assign da_valid = _T_207 & idle; 
  assign _T_242 = _T_237 == 4'h1; 
  assign _T_234 = Queue_io_deq_bits_opcode[0]; 
  assign _T_230 = 14'h7f << Queue_io_deq_bits_size; 
  assign _T_231 = _T_230[6:0]; 
  assign _T_232 = ~ _T_231; 
  assign _T_233 = _T_232[6:3]; 
  assign _T_235 = _T_234 ? _T_233 : 4'h0; 
  assign _T_243 = _T_235 == 4'h0; 
  assign _T_244 = _T_242 | _T_243; 
  assign _T_277 = Queue_io_deq_valid & _T_244; 
  assign _T_307 = {da_valid,_T_277}; 
  assign _GEN_17 = {{1'd0}, _T_307}; 
  assign _T_308 = _GEN_17 << 1; 
  assign _T_309 = _T_308[1:0]; 
  assign _T_310 = _T_307 | _T_309; 
  assign _GEN_18 = {{1'd0}, _T_310}; 
  assign _T_312 = _GEN_18 << 1; 
  assign _T_313 = _T_312[1:0]; 
  assign _T_314 = ~ _T_313; 
  assign _T_316 = _T_314[1]; 
  assign _T_397_1 = _T_305 ? _T_316 : _T_378_1; 
  assign da_ready = auto_in_d_ready & _T_397_1; 
  assign _T_180 = da_ready & da_valid; 
  assign da_bits_size = a_io_deq_bits_size; 
  assign _T_182 = 14'h7f << da_bits_size; 
  assign _T_183 = _T_182[6:0]; 
  assign _T_184 = ~ _T_183; 
  assign _T_185 = _T_184[6:3]; 
  assign _GEN_4 = 3'h2 == a_io_deq_bits_opcode ? 3'h1 : 3'h0; 
  assign _GEN_5 = 3'h3 == a_io_deq_bits_opcode ? 3'h1 : _GEN_4; 
  assign _GEN_6 = 3'h4 == a_io_deq_bits_opcode ? 3'h1 : _GEN_5; 
  assign _GEN_7 = 3'h5 == a_io_deq_bits_opcode ? 3'h2 : _GEN_6; 
  assign _GEN_8 = 3'h6 == a_io_deq_bits_opcode ? 3'h4 : _GEN_7; 
  assign da_bits_opcode = 3'h7 == a_io_deq_bits_opcode ? 3'h4 : _GEN_8; 
  assign _T_186 = da_bits_opcode[0]; 
  assign _T_187 = _T_186 ? _T_185 : 4'h0; 
  assign _T_190 = _T_189 - 4'h1; 
  assign _T_191 = $unsigned(_T_190); 
  assign _T_192 = _T_191[3:0]; 
  assign da_first = _T_189 == 4'h0; 
  assign _T_193 = _T_189 == 4'h1; 
  assign _T_194 = _T_187 == 4'h0; 
  assign da_last = _T_193 | _T_194; 
  assign _T_199 = idle | da_first; 
  assign _T_201 = _T_199 | reset; 
  assign _T_202 = _T_201 == 1'h0; 
  assign _T_203 = da_ready & da_last; 
  assign _T_204 = _T_203 & idle; 
  assign _T_205 = a_last == 1'h0; 
  assign _T_228 = Queue_io_deq_ready & Queue_io_deq_valid; 
  assign _T_238 = _T_237 - 4'h1; 
  assign _T_239 = $unsigned(_T_238); 
  assign _T_240 = _T_239[3:0]; 
  assign _T_241 = _T_237 == 4'h0; 
  assign _T_315 = _T_314[0]; 
  assign _T_397_0 = _T_305 ? _T_315 : _T_378_0; 
  assign _T_405 = auto_in_d_ready & _T_397_0; 
  assign _T_225_bits_size = Queue_io_deq_bits_size; 
  assign _T_271 = da_bits_opcode == 3'h4; 
  assign _T_272 = _T_180 & _T_271; 
  assign _T_275 = _T_244 == 1'h0; 
  assign _T_288 = Queue_io_deq_bits_param[1:0]; 
  assign _GEN_15 = 2'h1 == _T_288 ? 2'h2 : 2'h1; 
  assign _GEN_16 = 2'h2 == _T_288 ? 2'h2 : _GEN_15; 
  assign _T_306 = _T_305 & auto_in_d_ready; 
  assign _T_325 = _T_315 & _T_277; 
  assign _T_326 = _T_316 & da_valid; 
  assign _T_336 = _T_325 | _T_326; 
  assign _T_338 = _T_325 == 1'h0; 
  assign _T_341 = _T_326 == 1'h0; 
  assign _T_342 = _T_338 | _T_341; 
  assign _T_345 = _T_342 | reset; 
  assign _T_346 = _T_345 == 1'h0; 
  assign _T_347 = _T_277 | da_valid; 
  assign _T_348 = _T_347 == 1'h0; 
  assign _T_350 = _T_348 | _T_336; 
  assign _T_352 = _T_350 | reset; 
  assign _T_353 = _T_352 == 1'h0; 
  assign _T_409 = _T_378_0 ? _T_277 : 1'h0; 
  assign _T_410 = _T_378_1 ? da_valid : 1'h0; 
  assign _T_411 = _T_409 | _T_410; 
  assign in_d_valid = _T_305 ? _T_347 : _T_411; 
  assign _T_357 = auto_in_d_ready & in_d_valid; 
  assign _GEN_19 = {{3'd0}, _T_357}; 
  assign _T_358 = _T_304 - _GEN_19; 
  assign _T_359 = $unsigned(_T_358); 
  assign _T_360 = _T_359[3:0]; 
  assign _T_389_0 = _T_305 ? _T_325 : _T_378_0; 
  assign _T_389_1 = _T_305 ? _T_326 : _T_378_1; 
  assign _T_225_bits_source = Queue_io_deq_bits_source; 
  assign _T_419 = {_T_225_bits_size,_T_225_bits_source}; 
  assign _T_420 = {3'h6,_GEN_16}; 
  assign _T_421 = {_T_420,_T_419}; 
  assign _T_422 = {_T_421,67'h0}; 
  assign _T_423 = _T_389_0 ? _T_422 : 80'h0; 
  assign _T_424 = {64'h0,_T_186}; 
  assign _T_426 = {2'h1,_T_424}; 
  assign da_bits_source = a_io_deq_bits_source; 
  assign _T_427 = {da_bits_size,da_bits_source}; 
  assign _T_428 = {da_bits_opcode,2'h0}; 
  assign _T_429 = {_T_428,_T_427}; 
  assign _T_430 = {_T_429,_T_426}; 
  assign _T_431 = _T_389_1 ? _T_430 : 80'h0; 
  assign _T_432 = _T_423 | _T_431; 
  assign auto_in_a_ready = a_io_enq_ready; 
  assign auto_in_c_ready = Queue_io_enq_ready; 
  assign auto_in_d_valid = _T_305 ? _T_347 : _T_411; 
  assign auto_in_d_bits_opcode = _T_432[79:77]; 
  assign auto_in_d_bits_param = _T_432[76:75]; 
  assign auto_in_d_bits_size = _T_432[74:72]; 
  assign auto_in_d_bits_source = _T_432[71:67]; 
  assign auto_in_d_bits_sink = _T_432[66]; 
  assign auto_in_d_bits_denied = _T_432[65]; 
  assign auto_in_d_bits_data = _T_432[64:1]; 
  assign auto_in_d_bits_corrupt = _T_432[0]; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = a_io_enq_ready; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_c_ready = Queue_io_enq_ready; 
  assign TLMonitor_io_in_c_valid = auto_in_c_valid; 
  assign TLMonitor_io_in_c_bits_opcode = auto_in_c_bits_opcode; 
  assign TLMonitor_io_in_c_bits_param = auto_in_c_bits_param; 
  assign TLMonitor_io_in_c_bits_size = auto_in_c_bits_size; 
  assign TLMonitor_io_in_c_bits_source = auto_in_c_bits_source; 
  assign TLMonitor_io_in_c_bits_address = auto_in_c_bits_address; 
  assign TLMonitor_io_in_c_bits_corrupt = auto_in_c_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = _T_305 ? _T_347 : _T_411; 
  assign TLMonitor_io_in_d_bits_opcode = _T_432[79:77]; 
  assign TLMonitor_io_in_d_bits_param = _T_432[76:75]; 
  assign TLMonitor_io_in_d_bits_size = _T_432[74:72]; 
  assign TLMonitor_io_in_d_bits_source = _T_432[71:67]; 
  assign TLMonitor_io_in_d_bits_sink = _T_432[66]; 
  assign TLMonitor_io_in_d_bits_denied = _T_432[65]; 
  assign TLMonitor_io_in_d_bits_corrupt = _T_432[0]; 
  assign TLMonitor_io_in_e_valid = auto_in_e_valid; 
  assign TLMonitor_io_in_e_bits_sink = auto_in_e_bits_sink; 
  assign a_clock = clock; 
  assign a_reset = reset; 
  assign a_io_enq_valid = auto_in_a_valid; 
  assign a_io_enq_bits_opcode = auto_in_a_bits_opcode; 
  assign a_io_enq_bits_size = auto_in_a_bits_size; 
  assign a_io_enq_bits_source = auto_in_a_bits_source; 
  assign a_io_deq_ready = _T_204 | _T_205; 
  assign Queue_clock = clock; 
  assign Queue_reset = reset; 
  assign Queue_io_enq_valid = auto_in_c_valid; 
  assign Queue_io_enq_bits_opcode = auto_in_c_bits_opcode; 
  assign Queue_io_enq_bits_param = auto_in_c_bits_param; 
  assign Queue_io_enq_bits_size = auto_in_c_bits_size; 
  assign Queue_io_enq_bits_source = auto_in_c_bits_source; 
  assign Queue_io_deq_ready = _T_405 | _T_275; 
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
  idle = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_169 = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_304 = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_237 = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_378_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_189 = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_378_0 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      idle <= 1'h1;
    end else begin
      if (auto_in_e_valid) begin
        idle <= 1'h1;
      end else begin
        if (_T_272) begin
          idle <= 1'h0;
        end
      end
    end
    if (reset) begin
      _T_169 <= 4'h0;
    end else begin
      if (_T_159) begin
        if (_T_173) begin
          if (_T_166) begin
            _T_169 <= _T_164;
          end else begin
            _T_169 <= 4'h0;
          end
        end else begin
          _T_169 <= _T_172;
        end
      end
    end
    if (reset) begin
      _T_304 <= 4'h0;
    end else begin
      if (_T_306) begin
        if (_T_326) begin
          if (_T_186) begin
            _T_304 <= _T_185;
          end else begin
            _T_304 <= 4'h0;
          end
        end else begin
          _T_304 <= 4'h0;
        end
      end else begin
        _T_304 <= _T_360;
      end
    end
    if (reset) begin
      _T_237 <= 4'h0;
    end else begin
      if (_T_228) begin
        if (_T_241) begin
          if (_T_234) begin
            _T_237 <= _T_233;
          end else begin
            _T_237 <= 4'h0;
          end
        end else begin
          _T_237 <= _T_240;
        end
      end
    end
    if (reset) begin
      _T_378_1 <= 1'h0;
    end else begin
      if (_T_305) begin
        _T_378_1 <= _T_326;
      end
    end
    if (reset) begin
      _T_189 <= 4'h0;
    end else begin
      if (_T_180) begin
        if (da_first) begin
          if (_T_186) begin
            _T_189 <= _T_185;
          end else begin
            _T_189 <= 4'h0;
          end
        end else begin
          _T_189 <= _T_192;
        end
      end
    end
    if (reset) begin
      _T_378_0 <= 1'h0;
    end else begin
      if (_T_305) begin
        _T_378_0 <= _T_325;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_202) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Error.scala:28 assert (idle || da_first) // we only send Grant, never GrantData => simplified flow control below\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_202) begin
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
        if (_T_346) begin
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
        if (_T_346) begin
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
        if (_T_353) begin
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
        if (_T_353) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
