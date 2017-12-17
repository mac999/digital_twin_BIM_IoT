// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1733598 Wed Dec 14 22:35:39 MST 2016
// Date        : Wed Dec 13 20:49:18 2017
// Host        : DESKTOP-VN8J9QP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_addsub_0_sim_netlist.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_10,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [14:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [14:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [14:0]S;

  wire [14:0]A;
  wire [14:0]B;
  wire CE;
  wire CLK;
  wire [14:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "15" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "000000000000000" *) 
  (* c_b_width = "15" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "15" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_10 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "15" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "000000000000000" *) 
(* C_B_WIDTH = "15" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "15" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_10
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [14:0]A;
  input [14:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [14:0]S;

  wire \<const0> ;
  wire [14:0]A;
  wire [14:0]B;
  wire CE;
  wire CLK;
  wire [14:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "15" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "000000000000000" *) 
  (* c_b_width = "15" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "15" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_10_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
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
KPdyXTwyMEetqlZsif0kSCJEECXMW9pL0vc2rKHvDhLSRGfeEkdkZwrxPEl4qZn+Z4nM8MBGEXmq
ksxkBmV0hEWgmsyCeAYFuG+4wqAxCp1Lf2OMYTcwYNS9Ukd5340WpnUuUE8joYbbOom0abL8eQnc
iY/YPZZFffTpIIoZA9mv9cHSdbWvk3eyKjO3RcTRHVkWuTswqCiZUgjrs3JiUJ8bD3cA26lsgJlW
liyUU87Qo7okwYQIkC6SqTQFPBu5Ay9+7N0NvXG2/C0I6JjLOQXKrKf4747DbcifG0NamgFqJV5A
yn0UoP5ZK6fPdo+4YuIS8L/BQMavXB0gLXgV4w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
r5WQA6e06ff7uU1eqe/eX/IeA9HXNSiIYzl7E+3M87q5bHyRvCTrDUn4HVvML6FUqHY9ZZGeqQk4
m1ILj7fFSuhO9a0MPCmt9y3Rxj1UOX+HZBhYn63GXXmTBAmavVE8sXoGjzNNujHtt8beKfy3OcPm
WYargHX3wO960vpDecUn6ttx5ZxQT9no8/tukRNZ+y2+XHMkERx2dy4vwG8CXBZoTw8JHA2kvD/Q
l5xU9TzmmD/v1CIZuaWLB2soWu78oOB02Vph/ivqBv3HUAzbUf3rmhyhv4JgWfEDIz0K377tYaKL
OVKHBsQkgw6Hnz91hEVdeGxB2AjJ2z29WM5f2Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12848)
`pragma protect data_block
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
fyGGeyf+Pq72T2z83PEKMpdHVbYT3Ls=
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
