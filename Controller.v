module Controller(
    clock,
    Reset,
    IncA,
    IncB,
    WEA,
    WEB,
    counter
);

input clock, Reset;

output IncA, IncB, WEA, WEB;
output [4:0] counter;

wire clock, Reset;
reg IncA, IncB, WEA, WEB;
reg [4:0] counter = 5'b00000;

always @(posedge clock) 
begin
    if(Reset == 1'b1 || counter == 5'b10010)
        counter = 5'b0;
    else
        counter = counter + 1;
    
    if(counter >= 5'd1 && counter <= 5'd8)
        WEA = 1'b1;
    else
        WEA = 1'b0;

    if(counter != 5'b10001 && counter != 5'b10010 && counter != 5'b10011)
		IncA = 1;
	else
        IncA = 0;

	if(counter == 5'b01011 || counter == 5'b01101 || counter == 5'b01111 || counter == 5'b10001)
		WEB = 1;
	else
        WEB = 0;

	if(counter == 5'b01100 || counter == 5'b01110 || counter == 5'b10000 || counter == 5'b10010)
		IncB = 1;
	else
        IncB = 0;
end

endmodule