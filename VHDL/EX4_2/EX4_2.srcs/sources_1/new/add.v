`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/13 20:45:49
// Design Name: 
// Module Name: add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ps

module add(a, b, CLK, c);
    input [3:0] a, b;
    input CLK;
    output [3:0] c;

    c_addsub_0 add1 (
      a,      // input wire [14 : 0] A
      b,      // input wire [14 : 0] B
      CLK,  // input wire CLK
      1,    // input wire CE
      c      // output wire [14 : 0] S
    );
endmodule
