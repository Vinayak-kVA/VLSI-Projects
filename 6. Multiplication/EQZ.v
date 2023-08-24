`timescale 1ns / 1ps
module EQZ (eqz, data);
input [15:0] data;
output eqz;
assign eqz = (data == 16'b1);
endmodule
