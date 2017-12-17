//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/14 16:40:52
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

module counter3(clk, clr, q);
    input clk, clr;
    output reg [31:0] q = 32'h00000000;
    
    always @(posedge clk)
    begin
        if(clr)
            q <= 32'h00000000;
        else 
        begin
            q <= q + 1;
            if(q == 125000000)
                q <= 0;
        end
    end
endmodule
