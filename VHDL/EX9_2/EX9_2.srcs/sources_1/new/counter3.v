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

module counter3(clk, clr, c, result);
    input clk, clr;
    reg [3:0] in = 4'b0000; 
    reg [3:0] in2 = 4'b0000;
    reg [3:0] data = 4'b0000;
    reg [31:0] q = 32'h00000000;
    reg [31:0] q2 = 32'h00000000;
    output reg c = 0;
    output wire [6:0] result;
    
    always @(posedge clk)
    begin
        if(clr)
            q <= 32'h00000000;
        else 
        begin
            q <= q + 1;
            if(q == 12500000)
            begin
                q = 0;
                in = in + 1;
                if(in >= 10)
                begin
                    in = 0;
                    in2 = in2 + 1;
                end 
            end   
        end
    end

    always @(posedge clk)
    begin
    if(clr)
    begin
        c = 0;
        q2 = 0;
        in = 0;
        in2 = 0;
    end
    else        
        q2 = q2 + 1;
        if(q2 == 10000) 
        begin
            q2 = 0;
            c = !c;
            if(c)
                data = in2;
            else
                data =  in;
        end    
    end

    EX5_1 seg(data, result);
endmodule
