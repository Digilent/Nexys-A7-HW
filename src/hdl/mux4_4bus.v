`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         Digilent Inc
// Engineer:        Tudor Roxana-Ioana
// 
// Create Date:     02:26:40 09/09/2014 
// Design Name:     Mux 8x4
// Module Name:     4 x mux4_2bus 
// Project Name:    Mux 8x4
// Target Devices:  Nexys A7-50T
// Tool versions:   Vivado2021.1
// Description: 
//
// Dependencies: 
//
// Revision:  20/07/2021
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
// Purpose: Mux8X4 to select the data on the bus that will go to the sevensegdecoder 
//
//////////////////////////////////////////////////////////////////////////////////
module mux4_4bus(
    input [3:0] I0,
    input [3:0] I1,
	input [3:0] I2,
    input [3:0] I3,
    input [3:0] I4,
    input [3:0] I5,
    input [3:0] I6,
    input [3:0] I7,
    input  [2:0] Sel,
    output [3:0] Y
); 


assign Y = ( Sel == 0 )? I0 : ( Sel == 1 )? I1 : ( Sel == 2 )? I2 : ( Sel == 3 )? I3 : ( Sel == 4 )? I4 :( Sel == 5 )? I5 :( Sel == 6 )? I6 : I7;

endmodule
