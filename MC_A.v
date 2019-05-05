module MC_A (
    IncA,
    Reset,
    clock,
    AddrA,
    WEA,
    DataInA,
    DOut1
);

input IncA, WEA, Reset, clock;
input [7:0] DataInA;
output [7:0] DOut1;
output [2:0] AddrA;

wire IncA, WEA, Reset, clock;
reg [2:0] AddrA;
reg [7:0] DOut1;
reg [7:0] MemA[0:7];

always @(posedge clock)
    begin
        if(!Reset)
            begin
                if(IncA && WEA && !(DataInA === 8'bz))
                    begin
                        MemA[AddrA] = DataInA;
                        AddrA = AddrA + 1;
                    end
                else if(IncA && !WEA)
                    begin
                        DOut1 = MemA[AddrA];
                        AddrA = AddrA + 1;
                    end
                else if(!IncA && WEA && !(DataInA === 8'bz))
                    MemA[AddrA] = DataInA;
                else if(!IncA && !WEA)
                    DOut1 = MemA[AddrA];
            end
        else
            begin
                AddrA = 3'b000;
                DOut1 = 8'bz;
    end
end

endmodule
