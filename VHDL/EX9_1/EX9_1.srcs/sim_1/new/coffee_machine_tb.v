`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/15 10:18:23
// Design Name: 
// Module Name: coffee_machine_tb
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


module coffee_machine_tb;

    reg clk, reset;
    reg coin, return_in, coffee_btn;
    reg coffee_out;
    reg [15:0] coin_val;
    wire seg_en, coffee_make, coin_return;

    coffee_machine ctb(clk, reset, coin, return_in, coffee_btn, coffee_out, coin_val, seg_en, coffee_make, coin_return);
   
    initial begin
        clk = 0; coin = 0; reset = 1; return_in = 0; coffee_btn = 0; coin_val = 0; 
        #200;
        coin = 1; reset = 0;
        #200;
        coin = 1; coin_val = 300; coffee_btn = 0;
        #200; 
        coin = 1; coin_val = 300; coffee_btn = 1; coffee_out = 1; 
    end
    
    always begin
        #100 clk = 0;
        #100 clk = 1;
    end
endmodule
