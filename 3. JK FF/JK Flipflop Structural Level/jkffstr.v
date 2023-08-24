module jkffstr(q1,qbar1,q2,qbar2,clk,j,k);
//Input output initiation
input j,k,clk;
output q1,qbar1,q2,qbar2;
wire nand1_out, nand2_out, nand3_out, nand_out4,clk_not; 
not(clk_not,clk);//Inverting clock 
//Master JK Flipflop
nand(nand1_out, j,clk,qbar2);
nand(nand2_out, k,clk,q2);
nand(q1,qbar1,nand1_out);
nand(qbar1,q1,nand2_out);
//Slave JK Flipflop
nand(nand3_out,q1,clk_not);//slave
nand(nand4_out,qbar1,clk_not);
nand(q2,qbar2,nand3_out);
nand(qbar2,q2,nand4_out);
endmodule