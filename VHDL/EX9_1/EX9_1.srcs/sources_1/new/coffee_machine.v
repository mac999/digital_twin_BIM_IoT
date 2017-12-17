`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/15 10:01:31
// Design Name: 
// Module Name: coffee_machine
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


module coffee_machine(clk, reset, coin, return_in, coffee_btn, coffee_out, coin_val, seg_en, coffee_make, coin_return);
    input clk, reset;
    input coin, return_in, coffee_btn, coffee_out;
    input [15:0] coin_val;
    output reg seg_en, coffee_make, coin_return;
    reg [2:0] current_state, next_state;
    parameter idle = 0, coin_in = 1, ready = 2, coffee = 3, coin_out = 4;
    parameter coffee_val = 300;
    
    always @(current_state, coin, return_in, coffee_btn, coffee_out, coin_val)
    begin
        next_state = current_state;
        case (current_state)
            idle : if(coin) next_state = coin_in;
            coin_in :
            begin
                if(return_in) next_state = coin_out;
                else if(coin_val >= coffee_val) next_state = ready;
            end
            ready : 
            begin
                if(return_in || coin_val < coffee_val)
                    next_state = coin_out;
                else if(coffee_btn)
                    next_state = coffee;
            end
            coffee : if(coffee_out) next_state = ready;
            coin_out : if(!coin_val) next_state = idle;
            default : next_state = idle;
        endcase
    end
    
    always @(posedge clk)
    begin
        if(reset)
            current_state <= idle;
        else
            current_state <= next_state;
    end
    
    always @(current_state)
    begin
        seg_en = 0;
        coffee_make = 0;
        coin_return = 0;
        
        case(current_state)
            idle: ;
            coin_in: seg_en = 1;
            ready: seg_en = 1;
            coffee: 
            begin
                seg_en = 1;
                coffee_make = 1;
            end
            coin_out:
            begin
                seg_en = 1;
                coin_return = 1;
            end
            default: ;
        endcase
    end
    
endmodule
