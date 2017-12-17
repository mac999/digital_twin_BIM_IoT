`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/14 13:10:21
// Design Name: 
// Module Name: ander_tb
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

module ander_tb;
    reg a, b;
    wire result;
    
    adder uut (.a(a), .b(b), .result(result));
    initial begin
        a=0; b=0;
        #200;
        a=0; b=1;
        #200;
        a=1; b=1;
    end
endmodule


