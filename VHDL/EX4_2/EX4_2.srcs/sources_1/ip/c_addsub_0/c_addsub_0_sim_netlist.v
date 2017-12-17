// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1733598 Wed Dec 14 22:35:39 MST 2016
// Date        : Wed Dec 13 20:49:18 2017
// Host        : DESKTOP-VN8J9QP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Project/VHDL/EX4_2/EX4_2.srcs/sources_1/ip/c_addsub_0/c_addsub_0_sim_netlist.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_10,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module c_addsub_0
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
  c_addsub_0_c_addsub_v12_0_10 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_addsub_v12_0_10" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_addsub_0_c_addsub_v12_0_10
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
  c_addsub_0_c_addsub_v12_0_10_viv xst_addsub
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
oBLGzt1ZQ0FQOBDUZvYiUVEUawOKQiy/shvXuT7FMk/0/ZZk6E+N1gb2boMkfUv6GAwsF+KSoyUK
J9Zf5Q5lfbhfm2gO9377ZvvKNkZ1Q6eEf9XrHHHDvQHlG5vuqs/a2ouDuRTYy/RjHzV+ZmQMEq0C
LAe+Lv4m+3n/JDy40itRm0xeuLG5zlW28oYn7TtcMwEpaMgvqjlJVaYpV6GtJFf2TbgavBEmQ7x6
UgAN1yGOw5D0oY4EABs8Ck8eHO0UTHCdgxeuDdZbTRoX/MZSzW3wsrDg1tUiM6LgPWtTP4/DyWxE
JgTD5IVzMDzj42T2ROjcgEC7m0Yln7FrQqBOQw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
R1qVpofhh7JQo33JsRixfmFwQT+clWgEGWMSI1TSxcxxs0cvGukFTQlNoRz1A7fWSNOz2nO78oaX
tPBXLfUtA3ZGqGUxS1DYj2/HxUNg1FV7925yQ+nDuEIlFXzdipNSwi9T0EDDtgH7k8Zv4QSQbNJY
oKXj3CtfIaXkuxfp4a9EN978E8d+L5Q57YZz+G3D8bk1/Vy1CChdqfqrhWHwnMoLW4H5wcKkSSmv
Ve79jMSCv+wiYzKK+zV6eIApVwkPsVFzPGj77MHzB13TEiP9yl3gCz2Xuk9JJ7VdYGYjnOZr8I3m
/HH2qJJaSzNNCJitekrktNVxvOZ5KTXnVygu4A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12816)
`pragma protect data_block
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
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
