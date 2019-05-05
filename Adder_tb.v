`timescale 10ps/1ps
`include "Adder.v"

module Adder_tb;

reg [7:0] DOut1;
reg [7:0] DOut2;
wire [7:0] ADDOut;
integer k = 0;

Adder dut(
.DOut1(DOut1),
.DOut2(DOut2),
.ADDOut(ADDOut)
);

initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0,Adder_tb);
    DOut1 = 8'h1;
    DOut2 = 8'hF;
    for(k=0;k<10;k=k+1)
        begin
        #5 DOut1 = DOut1 + 1;
        #5 DOut2 = DOut2 - 1;
        end
end

endmodule
