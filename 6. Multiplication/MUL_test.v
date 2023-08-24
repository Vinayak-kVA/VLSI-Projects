`timescale 1ns / 1ps
module MUL_test;
reg [15:0] data_in;
reg clk, start;
wire done;
wire [15:0] Result;
MUL_datapath DP (eqz, LdA, LdB, LdP, clrP, decB, data_in, clk, Result);
controller CON (LdA, LdB, LdP, clrP, decB, done, clk, eqz, start);
initial
begin
clk = 1'b0;
#3 start = 1'b1;
#5000 $finish;
end
always #5 clk = ~clk;
initial
begin
#17 data_in = 17;
#10 data_in = 5;
end
initial
begin
$monitor ($time, " %d %b %d", DP.Y, done, DP.Bout);
//$dumpfile ("mul.vcd"); $dumpvars (0, MUL_test);
end
endmodule

//$monitor($time,"data_in=%d,clk=%b,b[0]=%b,b[1]=%b,y[0]=%b,y[1]=%b,y[2]=%b",data_in,clk,a[1],b[0],b[1],y[0],y[1],y[2]);