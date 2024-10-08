`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:37:29 PM
// Design Name: 
// Module Name: Lab_5
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


module Lab_5(output [3:0]seg_anode, output [6:0]seg_cathode, input [15:0]BCD_in, input clk);
    wire [3:0] digit;
//    Mux_4_1 Digits(digit, thou, hund, tens, ones, seg_anode);
    Anode_Gen A1(seg_anode, clk, BCD_in, digit);
    Seven_Seg_Decoder S1(seg_cathode, digit);

endmodule

module Anode_Gen(output reg [3:0]anode_o, input clk, input [15:0] BCD_in, output reg [3:0]digit);
    reg [9:0] g_count = 0;
    reg [3:0] anode;
//    wire [3:0]thou = BCD_in[15:12];
//    wire [3:0]hund = BCD_in[11:8];
//    wire [3:0]tens = BCD_in[7:4];
//    wire [3:0]ones = BCD_in[3:0];
    
    initial begin
        anode = 4'b1110;
    end

    always @(posedge clk) //counter
    begin //shift register instead of decoder
        g_count <= g_count+1;
//        if(g_count == 0)
//            begin
//                anode <= {anode[0], anode[3:1]};
////                if (anode == 4'b1110)
////                    anode <= 4'b0111;
////                else
////                    anode <= anode >> 1;
//            end
            
        if(g_count==10'd1023)
            begin
                anode_o <= anode;
                anode <= {anode[0], anode[3:1]};
                case (anode)
                    4'b1110: digit <= BCD_in[3:0];
                    4'b1101: digit <= BCD_in[7:4];
                    4'b1011: digit <= BCD_in[11:8];
                    4'b0111: digit <= BCD_in[15:12];
                    default: digit <= 4'bxxxx;
                endcase;
            end
    end
endmodule


module Seven_Seg_Decoder(output reg [6:0]seg, input [3:0]x);
    always @(*)
        begin
            case (x)
                0: seg = 7'b1000000;
                1: seg = 7'b1111001;
                2: seg = 7'b0100100;
                3: seg = 7'b0110000;
                4: seg = 7'b0011001;
                5: seg = 7'b0010010;
                6: seg = 7'b0000010;
                7: seg = 7'b1111000;
                8: seg = 7'b0000000;
                9: seg = 7'b0010000;
                default: seg = 7'b1111111;
            endcase;
        end
endmodule

//module Mux_4_1(output reg [3:0]y, input [3:0]a,b,c,d, input [3:0]s, input [4:0] g_count); 
////using one-hot sel

//    always@(*)
//    begin
//        case (s)
//            4'b0001: y = a;
//            4'b0010: y = b;
//            4'b0100: y = c;
//            4'b1000: y = d;
//            default: y = 4'bxxxx;
//        endcase;
//    end
//endmodule
