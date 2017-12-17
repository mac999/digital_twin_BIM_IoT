`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/13 16:52:11
// Design Name: 
// Module Name: top
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


module top(CLK, Q);
    input CLK;
    output [31:0] Q;
    
    c_counter_binary_0 u1(
      .CLK(CLK),  // input wire CLK
      .Q(Q)      // output wire [31 : 0] Q
    );
endmodule
