`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 02:57:51 PM
// Design Name: 
// Module Name: Lab_5_tb
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


module Lab_5_tb();
    wire [3:0]seg_anode;
    wire [6:0]seg_cathode;
    reg [15:0]BCD_in;
    reg clk=0;
    
//    integer i;
    
//    wire [3:0]thou = BCD_in[15:12];
//    wire [3:0]hund = BCD_in[11:8];
//    wire [3:0]tens = BCD_in[7:4];
//    wire [3:0]ones = BCD_in[3:0];
    
//    wire [3:0]digit;
    
    Lab_5 uut(seg_anode, seg_cathode, BCD_in, clk);
    
    initial begin
        forever begin
            #1 clk = ~clk;
        end
    end
    
   
   initial begin
    #500 BCD_in=16'b0010000101010110; 
    #500 BCD_in=16'b0000000010000001;
    #500 BCD_in=16'b0000100000000010;
    #500 BCD_in=16'b0000000100000100;
    #500 BCD_in=16'b1000000000001000;
    #500 BCD_in=16'b0000100000010000;
    #500 BCD_in=16'b0010000000100000;
    
    #10000 $stop;
       end
    
endmodule
