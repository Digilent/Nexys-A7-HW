//////////////////////////////////////////////////////////////////////////////////
// Company:         Digilent Inc
// Engineer:        Tudor Roxana-Ioana
// 
// Create Date:     02:03:00 09/16/2014 
// Design Name:     Decoder 3 to 8
// Module Name:     decoder_3_8
// Project Name:    XADCdemo
// Target Devices:  Nexys-A7-50T
// Tool versions:   Vivado 2021.1
// Description:     Decoder 3 to 8
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
// Purpose: Decoder 3 to 8 to select a paritcular decoder_3_8
//
//////////////////////////////////////////////////////////////////////////////////
module decoder_3_8 (
    input [2:0] I,
    output [7:0] an,
    output dp
);
    // anodes outputs are active low 
    assign an[0] = ~(~I[2] & ~I[1] & ~I[0]);
    assign an[1] = ~(~I[2] & ~I[1] & I[0]);

    assign an[2] = ~(~I[2] & I[1] & ~I[0]);
    assign an[3] = ~(~I[2] & I[1] & I[0]);

    assign an[4] = ~(I[2] & ~I[1] & ~I[0]);
    assign an[5] = ~(I[2] & ~I[1] & I[0]);
    assign an[6] = ~(I[2] & I[1] & ~I[0]);
    assign an[7] = ~(I[2] & I[1] & I[0]);

    //decimal place
    assign dp = ~(I[2] & I[1] & ~I[0]);

endmodule
