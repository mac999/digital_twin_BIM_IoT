`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/14 16:31:30
// Design Name: 
// Module Name: EX8_3
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


module EX8_3(clk, seg);
    input clk;
    wire [31:0] q;
    reg [7:0] rom_out [15:0];
    integer addr;
    output reg [6:0] seg;
    
    initial 
    begin
        rom_out[0]= 7'b1111110;
        rom_out[1] = 7'b0110000;
        rom_out[2] = 7'b1101101;
        rom_out[3] = 7'b1111001;    
        rom_out[4] = 7'b0110011;    
        rom_out[5] = 7'b1011011;    
        rom_out[6] = 7'b0011111;    
        rom_out[7] = 7'b1110000;    
        rom_out[8] = 7'b1111111;    
        rom_out[9] = 7'b1110011;
        rom_out[10] = 7'b0000001;  
        rom_out[11] = 7'b0000001;  
        rom_out[12] = 7'b0000001;  
        rom_out[13] = 7'b0000001;  
        rom_out[14] = 7'b0000001;  
        rom_out[15] = 7'b0000001; 
    end

    counter3 ct(clk, 0, q);

    
    always @ (q)
    begin
        addr = q[31:28];
        seg = rom_out[addr];
    end
    
endmodule
