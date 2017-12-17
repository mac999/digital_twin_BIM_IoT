`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/14 14:29:55
// Design Name: 
// Module Name: counter3_tb
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

module counter3_tb;
    reg clk = 0, clr = 0, cnten = 1;
    wire [31:0] q;    
    
    counter3 cut (clk, clr, cnten, q);
    
    always
    begin
        #100;
        clk = ~clk;
    end
endmodule
