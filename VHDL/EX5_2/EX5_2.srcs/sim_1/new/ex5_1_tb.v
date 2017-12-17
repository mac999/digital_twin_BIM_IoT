`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/14 13:22:14
// Design Name: 
// Module Name: ex5_1_tb
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

module ex5_1_tb;
    reg [3:0] in;
    wire [6:0] result;
    
    EX5_1 exut(.in(in), .result(result));
    initial begin
        in=4'b0000;
        #200;
        in=4'b0001;
        #200;
        in=4'b0010;
        #200;
        in=4'b0011;
        #200;
        in=4'b0100;
        #200;
        in=4'b0101;     
    end
endmodule
