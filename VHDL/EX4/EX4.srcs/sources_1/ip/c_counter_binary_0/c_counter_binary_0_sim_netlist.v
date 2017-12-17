// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1733598 Wed Dec 14 22:35:39 MST 2016
// Date        : Wed Dec 13 16:50:49 2017
// Host        : DESKTOP-VN8J9QP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Project/VHDL/EX4/EX4.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_10,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
   (CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) output [31:0]Q;

  wire CLK;
  wire [31:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_10 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "32" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_10" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_0_c_counter_binary_v12_0_10
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [31:0]L;
  output THRESH0;
  output [31:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [31:0]Q;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_10_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
aLmCh07kamflOuBaaM0+v7gF3ZQCN4uTPS49jGLZrm9CPd5dKgOoOsd31lVTa39JRx8k8u0RZFFV
nw3upaAZ/Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Aw2ILhM4six9UWZ51f4Gy1qRmB5epLhkXLiUel7/FHhV7ItYiMTQtS+L83Mc+nltIzBz41zx1hg+
tXO5AqTS9y6LHQ1ArWATw/2MxHpqqoQIEm/MMEqmD/Abq3WrBTKsP7RX5Dxj9tAlh7xY+e7JDk+a
sjJqfmxL57ISjzlKoaQ=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
0/1mLFI6+FTTZyqv+sYB352QRZ5wrgfyuO8Nkt+jQDUoTWGXOFvLM95e0B7u7pGyVXEuiRNaS/1C
9K5laxba09UTfWZfUB2hMm6rnfWn8YWcIaVNd02hszTUlzNTayWvVsa2FTdMCLRIiFK8u1RBHLVP
UcX9x/96nygRGOLoIfE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TwF12B0FENmte69HLik7RgUzysvY8+HuB8EGjVY6poUa8iBKzPda2TQoHnlJTqGe1+FzZYUJuhGB
clNU6Lk8Bkwu2Zvg4jDN7NVaR9NLeQFwNSRsk3xulCw6V567vcil0zGYyjbOnYYTHzq7HsSH/Bm0
xq4+RgccqurbpDb3jMTCnrT8FdAbNHrYUODBgqb2jIwhD7/OPqJ0SEE3ixLW7nbxBsRKHm9Kma6y
1hzP9cz3Q0EBN5F8DlAfJL6l/k/Fca4GPaKT+xXlCPkuH9S4142Gj3BthEYVN4LNQxtTwa2uY31y
sgCqBN1SJYOxVE7rwfYIV4u6ydorl0NL4b8SIA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Dd8zTWz32pUa1MkJJ89cKoEsw+888js7vmFz+G6UXbaPykBi5+zzNJq/ma/zLUevoDTleeS0vnkG
+JIO9/zchHNr4qeCqpsII+gVnZw6HhC58DuHvYGN1Y7TBoUJRH+MKXVyK2yMhoejeeHyO4lNN+gN
S1MgvOyCze3SyHsJ+SIEqHrYsnjDZhaMLEzXqyA22EZM4EzfOyYnjWMgZaxxaMYob5z9jzxpSYIp
TO40Bd6Pm8WauMjFHordqiQfK5Pjpzcdo5mK2zhDq99Ps7biiaBYj2fl31Z9/oKSUs3+8cqx2lgf
9kXg8/E4aiAcL+A6bP9qcYXM24+6CVH25++cBg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T1OzwxahBz+3DD3Rm3j/gjV9y0afSZCx2fO2ZTfZP7ske+MGwxAEj6thGu3zcWtqmD0GiLn0cY5l
S56WD0icxE6wHjkL4oa4WujMcCwuovMioF6lkvnUzL1+y6Wu503nnT0iCczMIQadO2UcfK1jYsxZ
JhFAghVKjOTgZLvrbU6a9oJbmXaFjPdoVXULO6RJRtupdQ2VPxYp8PFoTxnXXp50G4hGNkviUtRA
KTHBgrmSN0y7lDM3qlsTT4fhiGuveo50Ihz8U+fAZ+maBUixwOJLCGV+jx11R/FO3KUwnuLfoOnp
XIvpC/RD2PuDhUsd27pxO1aeLeOP2B+LsTouLw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
MOy8t02xXxl20OR7vn70lWblnRRU5EKEkPSSToRVFoZimGBVNSZYLTHtZDXt5C88n1C0ro2znUgA
CMzrbjpTSQ6Okh+TLp6j7uR8g25UVdhly3oIGo31l2ktADwDmhohgXQcqlrTU7+jLShJnN3LmkKB
Vm9O8gccNBmIjzNsNlnEK5monwDdIFoUTYvBOsjhp5erOOhfxuyCiQdxlxMaafRT/mquiiTC8zjB
IZyI64EfKf2EWCqLp6IlqnhjiFAdYN7ozBqBlt/hXZcPCxkJTYh9b2+kh9w8cnPvJiwRVodo56h7
JYHptg8IoJXFXIOa8ImljxEwaewxTyjpE19XUQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
SP/O5Rywe6oH7nq1ohEbb665jbALu86cgbO1CTnqcgao+Rpja9CuR8WcToHkrH8awj6QA9VRDIEg
3aOz94Yiv0oT2uGu8El90+8O+b8aBUivORZxptIISqVZSz41MSbdr1UOqc/mXeeWKebDebNh4vZR
qaQIVLZ4zfGGWLYHiAH0o57JlrXgM4q6PCLytGV/PaPo30D7zEOVogzJDEuFotVoex+8lUMmlyjz
o0BSKq+3eV1BFke2iiFYYp40bpS8WlXRFbHHZyroxM/vSIIHIiMKm2piOeGRDcznuuO3VjSTNOB7
2vtL3McKN46UKyADwqGBw7fJqMGVUCx5LrfEUg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17232)
`pragma protect data_block
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
iseBtMvfmlawlJbMAZgKrU77
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
