`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Tudor Roxana-Ioana
// 
// Create Date:     01:55:33 09/09/2014 
// Design Name:     Seven Segment Display Decoder
// Module Name:     sevensegdecoder 
// Project Name:    Seven Segment Display Decoder
// Target Devices:  Nexys A7-50T
// Tool versions:   Vivado 2021.1
// Description:     Seven Segment Display Decoder
//
// Dependencies: 
//
// Revision: 20/07/2021 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//MIT License

//Copyright (c) 2017 Digilent

//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//////////////////////////////////////////////////////////////////////////////////
//
// Purpose: Decoder for seven segment display
//
//////////////////////////////////////////////////////////////////////////////////
module sevensegdecoder(

	input [3:0] nIn,
	output reg [6:0] ssOut  
);

// The input signal is interpreted and encoded acodringly
// 7-segment encoding
//      0
//     ---
//  5 |   | 1
//     --- <--6
//  4 |   | 2
//     ---
//      3 
always @(nIn)        
    case (nIn)      // 6543210 (bit index)
      4'h0: ssOut = 7'b1000000;
      4'h1: ssOut = 7'b1111001;
      4'h2: ssOut = 7'b0100100;
      4'h3: ssOut = 7'b0110000;
      4'h4: ssOut = 7'b0011001;
      4'h5: ssOut = 7'b0010010;
      4'h6: ssOut = 7'b0000010;
      4'h7: ssOut = 7'b1111000;
      4'h8: ssOut = 7'b0000000;
      4'h9: ssOut = 7'b0011000;
      4'hA: ssOut = 7'b0001000;
      4'hB: ssOut = 7'b0000011;
      4'hC: ssOut = 7'b1000110;
      4'hD: ssOut = 7'b0100001;
      4'hE: ssOut = 7'b0000110;
      4'hF: ssOut = 7'b0001110;
      default: ssOut = 7'b1001001;
    endcase

endmodule
