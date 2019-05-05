module Adder(
    DOut1, 
    DOut2,
    ADDOut
);

input [7:0] DOut1;
input [7:0] DOut2;
output [7:0] ADDOut;

wire [7:0] DOut1;
wire [7:0] DOut2;
reg [7:0] ADDOut;

always @(*)
    ADDOut <= DOut1 + DOut2;

endmodule
