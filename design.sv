`include "Adder.sv"
`include "PC.sv"
`include "InstMem.sv"
`include "RegFile.sv"
`include "SignExt.sv"
`include "DataMem.sv"
//Design of the data path of LW Instruction MIPS architecture
//Programmer: Paul Manriquez
//Date: 25/07/2022
module LW(
input clk,rst,we
);
  
  wire [31:0]OutPC,OutR,InstM,OutRegA,SignOut,RDD;
  wire [4:0]NC;//NotConection
  wire [31:0]NC1,NC2;//Not Conection
  wire [31:0]DMResult;//It will be connected
  
  Adder 	U0(32'b1,OutPC,OutR);
  PC		U1(OutR,clk,rst,OutPC);
  InstMem 	U2(OutPC,InstM);
  RegFile	U3(clk,we,InstM[20:16],DMResult,InstM[25:21],OutRegA,NC,NC1);
  SignExt	U4(InstM[15:0],SignOut);
  Adder		U5(OutRegA,SignOut,RDD);
  DataMem	U6(clk,1'b0,RDD,NC2,DMResult);
  
  
endmodule
