`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/14 14:27:01
// Design Name: 
// Module Name: counter3
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

module counter3(clk, clr, cnten, q);
    input clk, clr, cnten;
    output reg [31:0] q = 32'h00000000;
    
    always @(posedge clk)
    begin
        if(clr)
            q <= 32'h00000000;
        else if(cnten)
        begin
            q <= q + 1;
            if(q==999)
            begin
                q <= 32'h00000000;
            end
        end
    end
endmodule
