module Subber(
    DOut1, 
    DOut2,
    SUBOut
);

input [7:0] DOut1;
input [7:0] DOut2;
output [7:0] SUBOut;

wire [7:0] DOut1;
wire [7:0] DOut2;
reg [7:0] SUBOut;

always @ (*)
SUBOut <= DOut1 - DOut2;

endmodule
