module MC_B (
    IncB,
    Reset,
    clock,
    AddrB,
    WEB,
    DataInB
);

input IncB, WEB, Reset, clock;
input [7:0] DataInB;
output [1:0] AddrB;

wire IncB, WEB, Reset, clock;
reg [1:0] AddrB;
reg [7:0] MemB[0:3];

always @(posedge clock)
    begin
        if(!Reset)
            begin
                if((IncB == 1'b0 && WEB == 1'b1) || (IncB == 1'b1 && WEB == 1'b0))
                    begin
                        if(WEB)
                            MemB[AddrB] <= DataInB;
                        if(IncB == 1'b0 && WEB == 1'b1)
                            AddrB = AddrB + 1;
                    end
                else
                    AddrB <= 2'b00;
            end
        else
            AddrB <= 2'b00;
    end

endmodule
