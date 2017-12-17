`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/13 15:18:54
// Design Name: 
// Module Name: bit2led
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


module bit2led(a, b, r1, r2, r3, r4);
    input a, b;
    output r1, r2, r3, r4;
    
    assign r1 = (!a & !b) ? 1: 0;
    assign r2 = (a & !b) ? 1: 0;
    assign r3 = (!a & b) ? 1: 0;
    assign r4 = (a & b) ? 1: 0;    
endmodule
