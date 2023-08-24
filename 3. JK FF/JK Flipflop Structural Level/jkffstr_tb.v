`timescale 1ns/1ns // Set timescale for simulation
`include "jkffstr.v" //Including code file

module jkffstr_tb;
reg J,K, CLK;
wire Q1,QBAR1,Q2,QBAR2;
integer i;
//input output declaration
jkffstr uut (.q1(Q1), .qbar1(QBAR1), .q2(Q2), .qbar2(QBAR2), .clk(CLK), .j(J), .k(K)); 

initial begin
  CLK=0; //forcing outputs to predefined conditions
  force Q1 =1;
  force QBAR1=0;
  force Q2 =0;
  force QBAR2=1;
  #1  //releasing outputs
  release Q1;
  release Q2;
  release QBAR1;
  release QBAR2;
//generating clock
     for(i=0;i<10;i=i+1)
          #10 CLK = ~CLK;  
end 
initial begin 
    $dumpfile("jkffstr.vcd");  //generating vcd file
    $dumpvars(0, jkffstr_tb);
 $monitor("  J = %b K = %b Q= %b QBAR = %b clk=\t",J,K,Q2,QBAR2,CLK);
 //testcases
 J= 1; K= 0;
 #20; J= 0; K= 1; 
 #20; J= 0; K= 0; 
 #20; J= 1; K=1; 
end 
endmodule