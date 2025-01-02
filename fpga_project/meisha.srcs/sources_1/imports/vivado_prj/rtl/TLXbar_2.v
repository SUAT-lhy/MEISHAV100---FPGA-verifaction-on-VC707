module TLXbar_2( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [2:0]  auto_in_a_bits_size, 
  input  [4:0]  auto_in_a_bits_source, 
  input  [30:0] auto_in_a_bits_address, 
  input  [7:0]  auto_in_a_bits_mask, 
  input  [63:0] auto_in_a_bits_data, 
  input         auto_in_a_bits_corrupt, 
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
  input         auto_out_4_a_ready, 
  output        auto_out_4_a_valid, 
  output [2:0]  auto_out_4_a_bits_opcode, 
  output [2:0]  auto_out_4_a_bits_param, 
  output [2:0]  auto_out_4_a_bits_size, 
  output [4:0]  auto_out_4_a_bits_source, 
  output [16:0] auto_out_4_a_bits_address, 
  output [7:0]  auto_out_4_a_bits_mask, 
  output        auto_out_4_a_bits_corrupt, 
  output        auto_out_4_d_ready, 
  input         auto_out_4_d_valid, 
  input  [2:0]  auto_out_4_d_bits_size, 
  input  [4:0]  auto_out_4_d_bits_source, 
  input  [63:0] auto_out_4_d_bits_data, 
  input         auto_out_4_d_bits_corrupt, 
  input         auto_out_3_a_ready, 
  output        auto_out_3_a_valid, 
  output [2:0]  auto_out_3_a_bits_opcode, 
  output [2:0]  auto_out_3_a_bits_param, 
  output [2:0]  auto_out_3_a_bits_size, 
  output [4:0]  auto_out_3_a_bits_source, 
  output [11:0] auto_out_3_a_bits_address, 
  output [7:0]  auto_out_3_a_bits_mask, 
  output [63:0] auto_out_3_a_bits_data, 
  output        auto_out_3_a_bits_corrupt, 
  output        auto_out_3_d_ready, 
  input         auto_out_3_d_valid, 
  input  [2:0]  auto_out_3_d_bits_opcode, 
  input  [2:0]  auto_out_3_d_bits_size, 
  input  [4:0]  auto_out_3_d_bits_source, 
  input  [63:0] auto_out_3_d_bits_data, 
  input         auto_out_2_a_ready, 
  output        auto_out_2_a_valid, 
  output [2:0]  auto_out_2_a_bits_opcode, 
  output [2:0]  auto_out_2_a_bits_param, 
  output [2:0]  auto_out_2_a_bits_size, 
  output [4:0]  auto_out_2_a_bits_source, 
  output [25:0] auto_out_2_a_bits_address, 
  output [7:0]  auto_out_2_a_bits_mask, 
  output [63:0] auto_out_2_a_bits_data, 
  output        auto_out_2_a_bits_corrupt, 
  output        auto_out_2_d_ready, 
  input         auto_out_2_d_valid, 
  input  [2:0]  auto_out_2_d_bits_opcode, 
  input  [2:0]  auto_out_2_d_bits_size, 
  input  [4:0]  auto_out_2_d_bits_source, 
  input  [63:0] auto_out_2_d_bits_data, 
  input         auto_out_1_a_ready, 
  output        auto_out_1_a_valid, 
  output [2:0]  auto_out_1_a_bits_opcode, 
  output [2:0]  auto_out_1_a_bits_param, 
  output [2:0]  auto_out_1_a_bits_size, 
  output [4:0]  auto_out_1_a_bits_source, 
  output [27:0] auto_out_1_a_bits_address, 
  output [7:0]  auto_out_1_a_bits_mask, 
  output [63:0] auto_out_1_a_bits_data, 
  output        auto_out_1_a_bits_corrupt, 
  output        auto_out_1_d_ready, 
  input         auto_out_1_d_valid, 
  input  [2:0]  auto_out_1_d_bits_opcode, 
  input  [2:0]  auto_out_1_d_bits_size, 
  input  [4:0]  auto_out_1_d_bits_source, 
  input  [63:0] auto_out_1_d_bits_data, 
  input         auto_out_0_a_ready, 
  output        auto_out_0_a_valid, 
  output [2:0]  auto_out_0_a_bits_opcode, 
  output [2:0]  auto_out_0_a_bits_param, 
  output [2:0]  auto_out_0_a_bits_size, 
  output [4:0]  auto_out_0_a_bits_source, 
  output [30:0] auto_out_0_a_bits_address, 
  output [7:0]  auto_out_0_a_bits_mask, 
  output [63:0] auto_out_0_a_bits_data, 
  output        auto_out_0_a_bits_corrupt, 
  output        auto_out_0_d_ready, 
  input         auto_out_0_d_valid, 
  input  [2:0]  auto_out_0_d_bits_opcode, 
  input  [1:0]  auto_out_0_d_bits_param, 
  input  [2:0]  auto_out_0_d_bits_size, 
  input  [4:0]  auto_out_0_d_bits_source, 
  input         auto_out_0_d_bits_sink, 
  input         auto_out_0_d_bits_denied, 
  input  [63:0] auto_out_0_d_bits_data, 
  input         auto_out_0_d_bits_corrupt 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire [4:0] TLMonitor_io_in_a_bits_source; 
  wire [30:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_param; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire [4:0] TLMonitor_io_in_d_bits_source; 
  wire  TLMonitor_io_in_d_bits_sink; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  reg [2:0] _T_1753; 
  reg [31:0] _RAND_0;
  wire  _T_1754; 
  wire [1:0] _T_1757; 
  wire [2:0] _T_1758; 
  wire [1:0] _T_1756; 
  wire [4:0] _T_1759; 
  reg [4:0] _T_1767; 
  reg [31:0] _RAND_1;
  wire [4:0] _T_1768; 
  wire [4:0] _T_1769; 
  wire [9:0] _T_1770; 
  wire [8:0] _T_1771; 
  wire [9:0] _GEN_1; 
  wire [9:0] _T_1772; 
  wire [7:0] _T_1773; 
  wire [9:0] _GEN_2; 
  wire [9:0] _T_1774; 
  wire [5:0] _T_1775; 
  wire [9:0] _GEN_3; 
  wire [9:0] _T_1776; 
  wire [8:0] _T_1778; 
  wire [9:0] _GEN_4; 
  wire [9:0] _T_1779; 
  wire [9:0] _GEN_5; 
  wire [9:0] _T_1780; 
  wire [4:0] _T_1781; 
  wire [4:0] _T_1782; 
  wire [4:0] _T_1783; 
  wire [4:0] _T_1784; 
  wire  _T_1799; 
  wire  _T_1815; 
  reg  _T_1910_0; 
  reg [31:0] _RAND_2;
  wire  _T_1930_0; 
  wire [4:0] _T_1985; 
  wire [7:0] _T_1984; 
  wire [12:0] _T_1986; 
  wire [1:0] _T_1982; 
  wire [64:0] _T_1981; 
  wire [66:0] _T_1983; 
  wire [79:0] _T_1987; 
  wire [79:0] _T_1988; 
  wire  _T_1800; 
  wire  _T_1816; 
  reg  _T_1910_1; 
  reg [31:0] _RAND_3;
  wire  _T_1930_1; 
  wire [4:0] _T_1993; 
  wire [7:0] _T_1992; 
  wire [12:0] _T_1994; 
  wire [64:0] _T_1989; 
  wire [66:0] _T_1991; 
  wire [79:0] _T_1995; 
  wire [79:0] _T_1996; 
  wire [79:0] _T_2021; 
  wire  _T_1801; 
  wire  _T_1817; 
  reg  _T_1910_2; 
  reg [31:0] _RAND_4;
  wire  _T_1930_2; 
  wire [4:0] _T_2001; 
  wire [7:0] _T_2000; 
  wire [12:0] _T_2002; 
  wire [64:0] _T_1997; 
  wire [66:0] _T_1999; 
  wire [79:0] _T_2003; 
  wire [79:0] _T_2004; 
  wire [79:0] _T_2022; 
  wire  _T_1802; 
  wire  _T_1818; 
  reg  _T_1910_3; 
  reg [31:0] _RAND_5;
  wire  _T_1930_3; 
  wire [4:0] _T_2009; 
  wire [7:0] _T_2008; 
  wire [12:0] _T_2010; 
  wire [64:0] _T_2005; 
  wire [66:0] _T_2007; 
  wire [79:0] _T_2011; 
  wire [79:0] _T_2012; 
  wire [79:0] _T_2023; 
  wire  _T_1803; 
  wire  _T_1819; 
  reg  _T_1910_4; 
  reg [31:0] _RAND_6;
  wire  _T_1930_4; 
  wire [7:0] _T_2016; 
  wire [12:0] _T_2018; 
  wire [64:0] _T_2013; 
  wire [66:0] _T_2015; 
  wire [79:0] _T_2019; 
  wire [79:0] _T_2020; 
  wire [79:0] _T_2024; 
  wire [30:0] _T_1150; 
  wire [31:0] _T_1151; 
  wire [31:0] _T_1152; 
  wire [31:0] _T_1153; 
  wire  requestAIO_0_0; 
  wire [30:0] _T_1155; 
  wire [31:0] _T_1156; 
  wire [31:0] _T_1157; 
  wire [31:0] _T_1158; 
  wire  requestAIO_0_1; 
  wire [30:0] _T_1160; 
  wire [31:0] _T_1161; 
  wire [31:0] _T_1162; 
  wire [31:0] _T_1163; 
  wire  requestAIO_0_2; 
  wire [31:0] _T_1166; 
  wire [31:0] _T_1167; 
  wire [31:0] _T_1168; 
  wire  requestAIO_0_3; 
  wire [30:0] _T_1170; 
  wire [31:0] _T_1171; 
  wire [31:0] _T_1172; 
  wire [31:0] _T_1173; 
  wire  requestAIO_0_4; 
  wire [12:0] _T_1319; 
  wire [5:0] _T_1320; 
  wire [5:0] _T_1321; 
  wire [2:0] _T_1322; 
  wire  _T_1323; 
  wire [2:0] beatsDO_0; 
  wire [12:0] _T_1325; 
  wire [5:0] _T_1326; 
  wire [5:0] _T_1327; 
  wire [2:0] _T_1328; 
  wire  _T_1329; 
  wire [2:0] beatsDO_1; 
  wire [12:0] _T_1331; 
  wire [5:0] _T_1332; 
  wire [5:0] _T_1333; 
  wire [2:0] _T_1334; 
  wire  _T_1335; 
  wire [2:0] beatsDO_2; 
  wire [12:0] _T_1337; 
  wire [5:0] _T_1338; 
  wire [5:0] _T_1339; 
  wire [2:0] _T_1340; 
  wire  _T_1341; 
  wire [2:0] beatsDO_3; 
  wire [12:0] _T_1343; 
  wire [5:0] _T_1344; 
  wire [5:0] _T_1345; 
  wire [2:0] beatsDO_4; 
  wire  _T_1405; 
  wire  _T_1406; 
  wire  _T_1407; 
  wire  _T_1408; 
  wire  _T_1409; 
  wire  _T_1410; 
  wire  _T_1411; 
  wire  _T_1412; 
  wire  _T_1755; 
  wire  _T_1761; 
  wire  _T_1763; 
  wire  _T_1764; 
  wire  _T_1785; 
  wire  _T_1786; 
  wire [4:0] _T_1787; 
  wire [5:0] _GEN_6; 
  wire [5:0] _T_1788; 
  wire [4:0] _T_1789; 
  wire [4:0] _T_1790; 
  wire [6:0] _GEN_7; 
  wire [6:0] _T_1791; 
  wire [4:0] _T_1792; 
  wire [4:0] _T_1793; 
  wire [8:0] _GEN_8; 
  wire [8:0] _T_1794; 
  wire [4:0] _T_1795; 
  wire [4:0] _T_1796; 
  wire  _T_1832; 
  wire  _T_1833; 
  wire  _T_1834; 
  wire  _T_1835; 
  wire  _T_1837; 
  wire  _T_1840; 
  wire  _T_1841; 
  wire  _T_1842; 
  wire  _T_1843; 
  wire  _T_1844; 
  wire  _T_1845; 
  wire  _T_1846; 
  wire  _T_1847; 
  wire  _T_1848; 
  wire  _T_1849; 
  wire  _T_1850; 
  wire  _T_1852; 
  wire  _T_1853; 
  wire  _T_1854; 
  wire  _T_1856; 
  wire  _T_1857; 
  wire  _T_1858; 
  wire  _T_1859; 
  wire  _T_1860; 
  wire  _T_1861; 
  wire  _T_1862; 
  wire  _T_1867; 
  wire  _T_1869; 
  wire  _T_1870; 
  wire [2:0] _T_1871; 
  wire [2:0] _T_1872; 
  wire [2:0] _T_1873; 
  wire [2:0] _T_1874; 
  wire [2:0] _T_1875; 
  wire [2:0] _T_1876; 
  wire [2:0] _T_1877; 
  wire [2:0] _T_1878; 
  wire [2:0] _T_1879; 
  wire  _T_1968; 
  wire  _T_1969; 
  wire  _T_1973; 
  wire  _T_1970; 
  wire  _T_1974; 
  wire  _T_1971; 
  wire  _T_1975; 
  wire  _T_1972; 
  wire  _T_1976; 
  wire  in_0_d_valid; 
  wire  _T_1880; 
  wire [2:0] _GEN_9; 
  wire [3:0] _T_1881; 
  wire [3:0] _T_1882; 
  wire [2:0] _T_1883; 
  wire  _T_1944_0; 
  wire  _T_1944_1; 
  wire  _T_1944_2; 
  wire  _T_1944_3; 
  wire  _T_1944_4; 
  TLMonitor_6 TLMonitor ( 
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
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt)
  );
  assign _T_1754 = _T_1753 == 3'h0; 
  assign _T_1757 = {auto_out_4_d_valid,auto_out_3_d_valid}; 
  assign _T_1758 = {_T_1757,auto_out_2_d_valid}; 
  assign _T_1756 = {auto_out_1_d_valid,auto_out_0_d_valid}; 
  assign _T_1759 = {_T_1758,_T_1756}; 
  assign _T_1768 = ~ _T_1767; 
  assign _T_1769 = _T_1759 & _T_1768; 
  assign _T_1770 = {_T_1769,_T_1759}; 
  assign _T_1771 = _T_1770[9:1]; 
  assign _GEN_1 = {{1'd0}, _T_1771}; 
  assign _T_1772 = _T_1770 | _GEN_1; 
  assign _T_1773 = _T_1772[9:2]; 
  assign _GEN_2 = {{2'd0}, _T_1773}; 
  assign _T_1774 = _T_1772 | _GEN_2; 
  assign _T_1775 = _T_1774[9:4]; 
  assign _GEN_3 = {{4'd0}, _T_1775}; 
  assign _T_1776 = _T_1774 | _GEN_3; 
  assign _T_1778 = _T_1776[9:1]; 
  assign _GEN_4 = {{5'd0}, _T_1767}; 
  assign _T_1779 = _GEN_4 << 5; 
  assign _GEN_5 = {{1'd0}, _T_1778}; 
  assign _T_1780 = _GEN_5 | _T_1779; 
  assign _T_1781 = _T_1780[9:5]; 
  assign _T_1782 = _T_1780[4:0]; 
  assign _T_1783 = _T_1781 & _T_1782; 
  assign _T_1784 = ~ _T_1783; 
  assign _T_1799 = _T_1784[0]; 
  assign _T_1815 = _T_1799 & auto_out_0_d_valid; 
  assign _T_1930_0 = _T_1754 ? _T_1815 : _T_1910_0; 
  assign _T_1985 = {auto_out_0_d_bits_opcode,auto_out_0_d_bits_param}; 
  assign _T_1984 = {auto_out_0_d_bits_size,auto_out_0_d_bits_source}; 
  assign _T_1986 = {_T_1985,_T_1984}; 
  assign _T_1982 = {auto_out_0_d_bits_sink,auto_out_0_d_bits_denied}; 
  assign _T_1981 = {auto_out_0_d_bits_data,auto_out_0_d_bits_corrupt}; 
  assign _T_1983 = {_T_1982,_T_1981}; 
  assign _T_1987 = {_T_1986,_T_1983}; 
  assign _T_1988 = _T_1930_0 ? _T_1987 : 80'h0; 
  assign _T_1800 = _T_1784[1]; 
  assign _T_1816 = _T_1800 & auto_out_1_d_valid; 
  assign _T_1930_1 = _T_1754 ? _T_1816 : _T_1910_1; 
  assign _T_1993 = {auto_out_1_d_bits_opcode,2'h0}; 
  assign _T_1992 = {auto_out_1_d_bits_size,auto_out_1_d_bits_source}; 
  assign _T_1994 = {_T_1993,_T_1992}; 
  assign _T_1989 = {auto_out_1_d_bits_data,1'h0}; 
  assign _T_1991 = {2'h0,_T_1989}; 
  assign _T_1995 = {_T_1994,_T_1991}; 
  assign _T_1996 = _T_1930_1 ? _T_1995 : 80'h0; 
  assign _T_2021 = _T_1988 | _T_1996; 
  assign _T_1801 = _T_1784[2]; 
  assign _T_1817 = _T_1801 & auto_out_2_d_valid; 
  assign _T_1930_2 = _T_1754 ? _T_1817 : _T_1910_2; 
  assign _T_2001 = {auto_out_2_d_bits_opcode,2'h0}; 
  assign _T_2000 = {auto_out_2_d_bits_size,auto_out_2_d_bits_source}; 
  assign _T_2002 = {_T_2001,_T_2000}; 
  assign _T_1997 = {auto_out_2_d_bits_data,1'h0}; 
  assign _T_1999 = {2'h0,_T_1997}; 
  assign _T_2003 = {_T_2002,_T_1999}; 
  assign _T_2004 = _T_1930_2 ? _T_2003 : 80'h0; 
  assign _T_2022 = _T_2021 | _T_2004; 
  assign _T_1802 = _T_1784[3]; 
  assign _T_1818 = _T_1802 & auto_out_3_d_valid; 
  assign _T_1930_3 = _T_1754 ? _T_1818 : _T_1910_3; 
  assign _T_2009 = {auto_out_3_d_bits_opcode,2'h0}; 
  assign _T_2008 = {auto_out_3_d_bits_size,auto_out_3_d_bits_source}; 
  assign _T_2010 = {_T_2009,_T_2008}; 
  assign _T_2005 = {auto_out_3_d_bits_data,1'h0}; 
  assign _T_2007 = {2'h0,_T_2005}; 
  assign _T_2011 = {_T_2010,_T_2007}; 
  assign _T_2012 = _T_1930_3 ? _T_2011 : 80'h0; 
  assign _T_2023 = _T_2022 | _T_2012; 
  assign _T_1803 = _T_1784[4]; 
  assign _T_1819 = _T_1803 & auto_out_4_d_valid; 
  assign _T_1930_4 = _T_1754 ? _T_1819 : _T_1910_4; 
  assign _T_2016 = {auto_out_4_d_bits_size,auto_out_4_d_bits_source}; 
  assign _T_2018 = {5'h4,_T_2016}; 
  assign _T_2013 = {auto_out_4_d_bits_data,auto_out_4_d_bits_corrupt}; 
  assign _T_2015 = {2'h0,_T_2013}; 
  assign _T_2019 = {_T_2018,_T_2015}; 
  assign _T_2020 = _T_1930_4 ? _T_2019 : 80'h0; 
  assign _T_2024 = _T_2023 | _T_2020; 
  assign _T_1150 = auto_in_a_bits_address ^ 31'h44000000; 
  assign _T_1151 = {1'b0,$signed(_T_1150)}; 
  assign _T_1152 = $signed(_T_1151) & $signed(32'sh46010000); 
  assign _T_1153 = $signed(_T_1152); 
  assign requestAIO_0_0 = $signed(_T_1153) == $signed(32'sh0); 
  assign _T_1155 = auto_in_a_bits_address ^ 31'h4000000; 
  assign _T_1156 = {1'b0,$signed(_T_1155)}; 
  assign _T_1157 = $signed(_T_1156) & $signed(32'sh44000000); 
  assign _T_1158 = $signed(_T_1157); 
  assign requestAIO_0_1 = $signed(_T_1158) == $signed(32'sh0); 
  assign _T_1160 = auto_in_a_bits_address ^ 31'h2000000; 
  assign _T_1161 = {1'b0,$signed(_T_1160)}; 
  assign _T_1162 = $signed(_T_1161) & $signed(32'sh46010000); 
  assign _T_1163 = $signed(_T_1162); 
  assign requestAIO_0_2 = $signed(_T_1163) == $signed(32'sh0); 
  assign _T_1166 = {1'b0,$signed(auto_in_a_bits_address)}; 
  assign _T_1167 = $signed(_T_1166) & $signed(32'sh46010000); 
  assign _T_1168 = $signed(_T_1167); 
  assign requestAIO_0_3 = $signed(_T_1168) == $signed(32'sh0); 
  assign _T_1170 = auto_in_a_bits_address ^ 31'h10000; 
  assign _T_1171 = {1'b0,$signed(_T_1170)}; 
  assign _T_1172 = $signed(_T_1171) & $signed(32'sh46010000); 
  assign _T_1173 = $signed(_T_1172); 
  assign requestAIO_0_4 = $signed(_T_1173) == $signed(32'sh0); 
  assign _T_1319 = 13'h3f << auto_out_0_d_bits_size; 
  assign _T_1320 = _T_1319[5:0]; 
  assign _T_1321 = ~ _T_1320; 
  assign _T_1322 = _T_1321[5:3]; 
  assign _T_1323 = auto_out_0_d_bits_opcode[0]; 
  assign beatsDO_0 = _T_1323 ? _T_1322 : 3'h0; 
  assign _T_1325 = 13'h3f << auto_out_1_d_bits_size; 
  assign _T_1326 = _T_1325[5:0]; 
  assign _T_1327 = ~ _T_1326; 
  assign _T_1328 = _T_1327[5:3]; 
  assign _T_1329 = auto_out_1_d_bits_opcode[0]; 
  assign beatsDO_1 = _T_1329 ? _T_1328 : 3'h0; 
  assign _T_1331 = 13'h3f << auto_out_2_d_bits_size; 
  assign _T_1332 = _T_1331[5:0]; 
  assign _T_1333 = ~ _T_1332; 
  assign _T_1334 = _T_1333[5:3]; 
  assign _T_1335 = auto_out_2_d_bits_opcode[0]; 
  assign beatsDO_2 = _T_1335 ? _T_1334 : 3'h0; 
  assign _T_1337 = 13'h3f << auto_out_3_d_bits_size; 
  assign _T_1338 = _T_1337[5:0]; 
  assign _T_1339 = ~ _T_1338; 
  assign _T_1340 = _T_1339[5:3]; 
  assign _T_1341 = auto_out_3_d_bits_opcode[0]; 
  assign beatsDO_3 = _T_1341 ? _T_1340 : 3'h0; 
  assign _T_1343 = 13'h3f << auto_out_4_d_bits_size; 
  assign _T_1344 = _T_1343[5:0]; 
  assign _T_1345 = ~ _T_1344; 
  assign beatsDO_4 = _T_1345[5:3]; 
  assign _T_1405 = requestAIO_0_0 ? auto_out_0_a_ready : 1'h0; 
  assign _T_1406 = requestAIO_0_1 ? auto_out_1_a_ready : 1'h0; 
  assign _T_1407 = requestAIO_0_2 ? auto_out_2_a_ready : 1'h0; 
  assign _T_1408 = requestAIO_0_3 ? auto_out_3_a_ready : 1'h0; 
  assign _T_1409 = requestAIO_0_4 ? auto_out_4_a_ready : 1'h0; 
  assign _T_1410 = _T_1405 | _T_1406; 
  assign _T_1411 = _T_1410 | _T_1407; 
  assign _T_1412 = _T_1411 | _T_1408; 
  assign _T_1755 = _T_1754 & auto_in_d_ready; 
  assign _T_1761 = _T_1759 == _T_1759; 
  assign _T_1763 = _T_1761 | reset; 
  assign _T_1764 = _T_1763 == 1'h0; 
  assign _T_1785 = _T_1759 != 5'h0; 
  assign _T_1786 = _T_1755 & _T_1785; 
  assign _T_1787 = _T_1784 & _T_1759; 
  assign _GEN_6 = {{1'd0}, _T_1787}; 
  assign _T_1788 = _GEN_6 << 1; 
  assign _T_1789 = _T_1788[4:0]; 
  assign _T_1790 = _T_1787 | _T_1789; 
  assign _GEN_7 = {{2'd0}, _T_1790}; 
  assign _T_1791 = _GEN_7 << 2; 
  assign _T_1792 = _T_1791[4:0]; 
  assign _T_1793 = _T_1790 | _T_1792; 
  assign _GEN_8 = {{4'd0}, _T_1793}; 
  assign _T_1794 = _GEN_8 << 4; 
  assign _T_1795 = _T_1794[4:0]; 
  assign _T_1796 = _T_1793 | _T_1795; 
  assign _T_1832 = _T_1815 | _T_1816; 
  assign _T_1833 = _T_1832 | _T_1817; 
  assign _T_1834 = _T_1833 | _T_1818; 
  assign _T_1835 = _T_1834 | _T_1819; 
  assign _T_1837 = _T_1815 == 1'h0; 
  assign _T_1840 = _T_1816 == 1'h0; 
  assign _T_1841 = _T_1837 | _T_1840; 
  assign _T_1842 = _T_1832 == 1'h0; 
  assign _T_1843 = _T_1817 == 1'h0; 
  assign _T_1844 = _T_1842 | _T_1843; 
  assign _T_1845 = _T_1833 == 1'h0; 
  assign _T_1846 = _T_1818 == 1'h0; 
  assign _T_1847 = _T_1845 | _T_1846; 
  assign _T_1848 = _T_1834 == 1'h0; 
  assign _T_1849 = _T_1819 == 1'h0; 
  assign _T_1850 = _T_1848 | _T_1849; 
  assign _T_1852 = _T_1841 & _T_1844; 
  assign _T_1853 = _T_1852 & _T_1847; 
  assign _T_1854 = _T_1853 & _T_1850; 
  assign _T_1856 = _T_1854 | reset; 
  assign _T_1857 = _T_1856 == 1'h0; 
  assign _T_1858 = auto_out_0_d_valid | auto_out_1_d_valid; 
  assign _T_1859 = _T_1858 | auto_out_2_d_valid; 
  assign _T_1860 = _T_1859 | auto_out_3_d_valid; 
  assign _T_1861 = _T_1860 | auto_out_4_d_valid; 
  assign _T_1862 = _T_1861 == 1'h0; 
  assign _T_1867 = _T_1862 | _T_1835; 
  assign _T_1869 = _T_1867 | reset; 
  assign _T_1870 = _T_1869 == 1'h0; 
  assign _T_1871 = _T_1815 ? beatsDO_0 : 3'h0; 
  assign _T_1872 = _T_1816 ? beatsDO_1 : 3'h0; 
  assign _T_1873 = _T_1817 ? beatsDO_2 : 3'h0; 
  assign _T_1874 = _T_1818 ? beatsDO_3 : 3'h0; 
  assign _T_1875 = _T_1819 ? beatsDO_4 : 3'h0; 
  assign _T_1876 = _T_1871 | _T_1872; 
  assign _T_1877 = _T_1876 | _T_1873; 
  assign _T_1878 = _T_1877 | _T_1874; 
  assign _T_1879 = _T_1878 | _T_1875; 
  assign _T_1968 = _T_1910_0 ? auto_out_0_d_valid : 1'h0; 
  assign _T_1969 = _T_1910_1 ? auto_out_1_d_valid : 1'h0; 
  assign _T_1973 = _T_1968 | _T_1969; 
  assign _T_1970 = _T_1910_2 ? auto_out_2_d_valid : 1'h0; 
  assign _T_1974 = _T_1973 | _T_1970; 
  assign _T_1971 = _T_1910_3 ? auto_out_3_d_valid : 1'h0; 
  assign _T_1975 = _T_1974 | _T_1971; 
  assign _T_1972 = _T_1910_4 ? auto_out_4_d_valid : 1'h0; 
  assign _T_1976 = _T_1975 | _T_1972; 
  assign in_0_d_valid = _T_1754 ? _T_1861 : _T_1976; 
  assign _T_1880 = auto_in_d_ready & in_0_d_valid; 
  assign _GEN_9 = {{2'd0}, _T_1880}; 
  assign _T_1881 = _T_1753 - _GEN_9; 
  assign _T_1882 = $unsigned(_T_1881); 
  assign _T_1883 = _T_1882[2:0]; 
  assign _T_1944_0 = _T_1754 ? _T_1799 : _T_1910_0; 
  assign _T_1944_1 = _T_1754 ? _T_1800 : _T_1910_1; 
  assign _T_1944_2 = _T_1754 ? _T_1801 : _T_1910_2; 
  assign _T_1944_3 = _T_1754 ? _T_1802 : _T_1910_3; 
  assign _T_1944_4 = _T_1754 ? _T_1803 : _T_1910_4; 
  assign auto_in_a_ready = _T_1412 | _T_1409; 
  assign auto_in_d_valid = _T_1754 ? _T_1861 : _T_1976; 
  assign auto_in_d_bits_opcode = _T_2024[79:77]; 
  assign auto_in_d_bits_param = _T_2024[76:75]; 
  assign auto_in_d_bits_size = _T_2024[74:72]; 
  assign auto_in_d_bits_source = _T_2024[71:67]; 
  assign auto_in_d_bits_sink = _T_2024[66]; 
  assign auto_in_d_bits_denied = _T_2024[65]; 
  assign auto_in_d_bits_data = _T_2024[64:1]; 
  assign auto_in_d_bits_corrupt = _T_2024[0]; 
  assign auto_out_4_a_valid = auto_in_a_valid & requestAIO_0_4; 
  assign auto_out_4_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_4_a_bits_param = auto_in_a_bits_param; 
  assign auto_out_4_a_bits_size = auto_in_a_bits_size; 
  assign auto_out_4_a_bits_source = auto_in_a_bits_source; 
  assign auto_out_4_a_bits_address = auto_in_a_bits_address[16:0]; 
  assign auto_out_4_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_4_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign auto_out_4_d_ready = auto_in_d_ready & _T_1944_4; 
  assign auto_out_3_a_valid = auto_in_a_valid & requestAIO_0_3; 
  assign auto_out_3_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_3_a_bits_param = auto_in_a_bits_param; 
  assign auto_out_3_a_bits_size = auto_in_a_bits_size; 
  assign auto_out_3_a_bits_source = auto_in_a_bits_source; 
  assign auto_out_3_a_bits_address = auto_in_a_bits_address[11:0]; 
  assign auto_out_3_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_3_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_3_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign auto_out_3_d_ready = auto_in_d_ready & _T_1944_3; 
  assign auto_out_2_a_valid = auto_in_a_valid & requestAIO_0_2; 
  assign auto_out_2_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_2_a_bits_param = auto_in_a_bits_param; 
  assign auto_out_2_a_bits_size = auto_in_a_bits_size; 
  assign auto_out_2_a_bits_source = auto_in_a_bits_source; 
  assign auto_out_2_a_bits_address = auto_in_a_bits_address[25:0]; 
  assign auto_out_2_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_2_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_2_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign auto_out_2_d_ready = auto_in_d_ready & _T_1944_2; 
  assign auto_out_1_a_valid = auto_in_a_valid & requestAIO_0_1; 
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_1_a_bits_param = auto_in_a_bits_param; 
  assign auto_out_1_a_bits_size = auto_in_a_bits_size; 
  assign auto_out_1_a_bits_source = auto_in_a_bits_source; 
  assign auto_out_1_a_bits_address = auto_in_a_bits_address[27:0]; 
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_1_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_1_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign auto_out_1_d_ready = auto_in_d_ready & _T_1944_1; 
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0; 
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_0_a_bits_param = auto_in_a_bits_param; 
  assign auto_out_0_a_bits_size = auto_in_a_bits_size; 
  assign auto_out_0_a_bits_source = auto_in_a_bits_source; 
  assign auto_out_0_a_bits_address = auto_in_a_bits_address; 
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_0_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_0_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign auto_out_0_d_ready = auto_in_d_ready & _T_1944_0; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = _T_1412 | _T_1409; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = _T_1754 ? _T_1861 : _T_1976; 
  assign TLMonitor_io_in_d_bits_opcode = _T_2024[79:77]; 
  assign TLMonitor_io_in_d_bits_param = _T_2024[76:75]; 
  assign TLMonitor_io_in_d_bits_size = _T_2024[74:72]; 
  assign TLMonitor_io_in_d_bits_source = _T_2024[71:67]; 
  assign TLMonitor_io_in_d_bits_sink = _T_2024[66]; 
  assign TLMonitor_io_in_d_bits_denied = _T_2024[65]; 
  assign TLMonitor_io_in_d_bits_corrupt = _T_2024[0]; 
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
  _T_1753 = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1767 = _RAND_1[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1910_0 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1910_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_1910_2 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_1910_3 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_1910_4 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_1753 <= 3'h0;
    end else begin
      if (_T_1755) begin
        _T_1753 <= _T_1879;
      end else begin
        _T_1753 <= _T_1883;
      end
    end
    if (reset) begin
      _T_1767 <= 5'h1f;
    end else begin
      if (_T_1786) begin
        _T_1767 <= _T_1796;
      end
    end
    if (reset) begin
      _T_1910_0 <= 1'h0;
    end else begin
      if (_T_1754) begin
        _T_1910_0 <= _T_1815;
      end
    end
    if (reset) begin
      _T_1910_1 <= 1'h0;
    end else begin
      if (_T_1754) begin
        _T_1910_1 <= _T_1816;
      end
    end
    if (reset) begin
      _T_1910_2 <= 1'h0;
    end else begin
      if (_T_1754) begin
        _T_1910_2 <= _T_1817;
      end
    end
    if (reset) begin
      _T_1910_3 <= 1'h0;
    end else begin
      if (_T_1754) begin
        _T_1910_3 <= _T_1818;
      end
    end
    if (reset) begin
      _T_1910_4 <= 1'h0;
    end else begin
      if (_T_1754) begin
        _T_1910_4 <= _T_1819;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1764) begin
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
        if (_T_1764) begin
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
        if (_T_1857) begin
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
        if (_T_1857) begin
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
        if (_T_1870) begin
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
        if (_T_1870) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
