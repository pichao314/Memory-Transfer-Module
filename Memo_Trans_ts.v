`timescale 10ps/1ps
`include "MC_A.v"
`include "MC_B.v"
`include "D_Flip_Flop.v"
`include "Adder.v"
`include "Subber.v"
`include "Comparator.v"
`include "Controller.v"

module test;
reg Reset,clock,sign;
reg[7:0] DataInA;
wire WEA,WEB,IncA,IncB;
wire [2:0]AddrA;
wire [7:0]DOut1,DOut2,DataInB, ADDOut, SUBOut;
wire [1:0]AddrB;
wire [4:0]counter;

integer k = 0;

MC_A ma(
    .IncA(IncA),
    .Reset(Reset),
    .clock(clock),
    .AddrA(AddrA),
    .WEA(WEA),
    .DataInA(DataInA),
    .DOut1(DOut1)
);

MC_B mb(
    .IncB(IncB),
    .Reset(Reset),
    .clock(clock),
    .AddrB(AddrB),
    .WEB(WEB),
    .DataInB(DataInB)
);

D_Flip_Flop dff(
    .DOut1(DOut1),
    .clock(clock),
    .DOut2(DOut2)
);

Adder ad(
    .DOut1(DOut1),
    .DOut2(DOut2),
    .ADDOut(ADDOut)
);

Subber sb(
    .DOut1(DOut1),
    .DOut2(DOut2),
    .SUBOut(SUBOut)
);

Comparator cp(
    .DOut1(DOut1),
    .DOut2(DOut2),
    .Sign(Sign)
);

Controller ct(
    .clock(clock),
    .Reset(Reset),
    .IncA(IncA),
    .IncB(IncB),
    .WEA(WEA),
    .WEB(WEB),
    .counter(counter)
);

initial
begin
	clock = 1'b0;
	Reset = 1'b1;
	DataInA = 8'b0;
    for(k = 0; k < 20; k = k + 1)
    begin
          #10 clock = ~clock;
    end
end

initial
begin
    $dumpfile("memo_trans.vcd");
    $dumpvars(0, test);

	#10
	DataInA = 8'b0;
	repeat(8) begin
	#20 DataInA = DataInA + 1;
	end
	DataInA = 8'bz;
end

initial
begin
    #8 Reset = ~Reset;
    #360 Reset = 1'b1;
end
endmodule
