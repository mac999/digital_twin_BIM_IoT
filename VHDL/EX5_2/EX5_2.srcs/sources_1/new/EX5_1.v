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
`timescale 1 ns / 1 ps

module EX5_1(in, result);
    input [3:0] in;
    output reg [6:0] result;
    
    always @(in)
    begin
        case (in)
            4'b0000:
                result = 7'b1111110;
            4'b0001:
                result = 7'b0110000;
            4'b0010:
                result = 7'b1101101;
            4'b0011:
                result = 7'b1111001;    
            4'b0100:
                result = 7'b0110011;    
            4'b0101:
                result = 7'b1011011;    
            4'b0110:
                result = 7'b0011111;    
            4'b0111:
                result = 7'b1110000;    
            4'b1000:
                result = 7'b1111111;    
            4'b1001:
                result = 7'b1110011;
            default:
                result = 7'b0000001;                
        endcase 
    end
endmodule
