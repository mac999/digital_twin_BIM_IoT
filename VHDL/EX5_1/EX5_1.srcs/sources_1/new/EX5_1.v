`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/14 10:20:25
// Design Name: 
// Module Name: EX5_1
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


module EX5_1(in, result);
    input [3:0] in;
    output reg [6:0] result;
    
    always @(in)
    begin
        if(in == 4'b0000)
            result = 7'b1111110;
        else if(in == 4'b0001)
            result = 7'b0110000;
        else if(in == 4'b0010)
            result = 7'b1101101;
        else if(in == 4'b0011)
            result = 7'b1111001;    
        else if(in == 4'b0100)
            result = 7'b0110011;    
        else if(in == 4'b0101)
            result = 7'b1011011;    
        else if(in == 4'b0110)
            result = 7'b0011111;    
        else if(in == 4'b0111)
            result = 7'b1110000;    
        else if(in == 4'b1000)
            result = 7'b1111111;    
        else if(in == 4'b1001)
            result = 7'b1110011;
        else 
            result = 7'b0000001;                
    end 
    
endmodule
