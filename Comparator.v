module Comparator(
    DOut1,
    DOut2,
    Sign
);

input [7:0]DOut1,DOut2;
output Sign;

wire [7:0] DOut1;
wire [7:0] DOut2;
reg Sign;

always @(*)
if(DOut1 > DOut2)
    Sign <= 0;
else
    Sign <= 1;

endmodule
