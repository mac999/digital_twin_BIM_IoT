// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1733598 Wed Dec 14 22:35:39 MST 2016
// Date        : Wed Dec 13 16:50:49 2017
// Host        : DESKTOP-VN8J9QP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_10,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_10 U0
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
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_10
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_10_viv i_synth
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
kDJGFvn+teKLzZ2GDGKaHGTUKM0qHxhGHAJbp2tQutJlirkqdOi2GTk1Au+ypY7NR3z+JYoATwGf
/fhvMjRCc9t4W+Pxy03tCQdR1R+hIZOH0ivmHOT4orfCa4YZ6N5M6FeGSXFVpvJKQ2uGmyOM5jRD
QCOR96O0nNXhOLL+sPwOgg1go+x1GZEoDLXIuUu6RQCXKEiio/+VHOzylG2HfOQIeTz/VUOes9w7
SvmqJHqCciBEmRwlSU5ZBntsXjzdPjsm1m6oIZ11EIeF3dDlIxYQmPFRpPJJcVqTC++owhqsVjaY
S7D0kaMl+y5TnJXClovqKnWuckm0IwV4a0vyLQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
L3prMYH6Dm5/gdmk95nWfuVoTq5SfHSNkDfBf3e2n5iXGlyrJ5DoacdXF5qkaqMotT7WIUVe7xx3
s5M14Kze70yt5mytIpTd+YQs1gib4Ufa4fiUTbUVkZdW47KWj0RGw5mHeSBssNOE6KIiF3Mz8rMo
LGgb+732AuiBaLZaHDap3jnlPnsFb31HDvPAPgJnp34Xf/99MF0Ag2A7IWZNl2L/uEgENphi2OHH
MhTM/uHUJjB/9s+K2yL5KvQalGtjA1Dj2ZlnV94OSaFDxoQQ1NIgkIXiFXpoeRe4+TFHsJ+Db2xu
aFKUiMTa3Q1puj/kLUitdXl6493SPXRxxTryZg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17168)
`pragma protect data_block
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
57hyyPDVFjD5HDg=
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
