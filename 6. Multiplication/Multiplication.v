`timescale 1ns / 1ps
module MUL_datapath (eqz, LdA, LdB, LdP, clrP, decB, data_in, clk, Result);
input LdA, LdB, LdP, clrP, decB, clk;
input [15:0] data_in;
output eqz;
output [15:0] Result;
wire [15:0] X, Y, Z, Bout, Bus;
assign Bus=data_in;
PIPO1 A (X, Bus, LdA, clk);
PIPO2 P (Y, Z, LdP, clrP, clk);
CNTR B (Bout, Bus, LdB, decB, clk);
ADD AD (Z, X, Y);
EQZ COMP (eqz, Bout);
assign Result=Z;
endmodule