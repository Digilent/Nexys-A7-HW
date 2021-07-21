//////////////////////////////////////////////////////////////////////////////////
// Company:         Digilent Inc
// Engineer:        Tudor Roxana-Ioana
// 
// Create Date:     02:03:00 09/16/2014 
// Design Name:     Counter on 3 bits
// Module Name:     counter3bit
// Project Name:    XADCdemo
// Target Devices:  Nexys-A7-50T
// Tool versions:   Vivado 2021.1
// Description:     Counter on 3 bits
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
// Purpose: Counter on 3 bits
//
//////////////////////////////////////////////////////////////////////////////////
module counter3bit (
    input clk,
    input rst,
    output reg [2:0] Q
);
    //Process for counter on 3 bits
    always @ (posedge(clk))     
    begin
        if (rst == 3'b111)
            // How Output reacts when Reset Is Asserted
            Q <= 3'b0;
        else
            // How Output reacts when Rising Edge of Clock Arrives
            Q <= Q + 1'b1;
    end

endmodule
