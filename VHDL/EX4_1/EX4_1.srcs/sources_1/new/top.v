`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/13 20:07:16
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
`timescale 1 ns / 1 ps

module top(top_a, top_b, top_result);
    input [3:0] top_a, top_b;
    output [3:0] top_result;
    
    ander u1 (top_a[3], top_b[3], top_result[3]);
    ander u2 (top_a[2], top_b[2], top_result[2]);
    ander u3 (top_a[1], top_b[1], top_result[1]);
    ander u4 (top_a[0], top_b[0], top_result[0]);    
endmodule
