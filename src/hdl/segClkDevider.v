`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         Digilent Inc
// Engineer:        Tudor Roxana-Ioana
// 
// Create Date:     02:03:00 09/16/2014 
// Design Name:     Clock divider for the Seven Segment Display used to set the active anodes
// Module Name:     segClkDevider 
// Project Name:    XADCdemo
// Target Devices:  Nexys-A7-100T
// Tool versions:   Vivado 2021.1
// Description:     Clock divider for the Seven Segment Display used to set the active anodes
//
// Dependencies: 
//
// Revision: 
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
// Purpose: Clock divider for the Seven Segment Display used to set the active anodes
//
//////////////////////////////////////////////////////////////////////////////////
module segClkDivider(
    input clk,
    input rst,
    output reg clk_div
);

    localparam constantNumber = 10000;
    reg [31:0] count;

    // Process for counting up 
    always @ (posedge(clk), posedge(rst))
    begin
        if (rst == 1'b1)
            count <= 32'b0;
        else if (count == constantNumber - 1)
            count <= 32'b0;
        else
            count <= count + 1;
    end

    // Process for dividing the clock. The active edge of the clock would be 10 KHz => 0.01 MHZ
    always @ (posedge(clk), posedge(rst))
    begin
        if (rst == 1'b1)
            clk_div <= 1'b0;
        else if (count == constantNumber - 1)
            clk_div <= ~clk_div;
        else
            clk_div <= clk_div;
    end
endmodule