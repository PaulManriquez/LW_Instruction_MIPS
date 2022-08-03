`timescale 1ns/1ps

module LW_TB;
  
  reg clk_TB,rst_TB,we_TB;
  integer i;
  LW DUT(
    .clk(clk_TB),
    .rst(rst_TB),
    .we(we_TB)
  );
  
  initial begin 
  clk_TB=1'b0; rst_TB=1'b0; we_TB=1'b0; #1; rst_TB=1'b1;
    $display("\tRESET");
    $display("Out:%b\n",DUT.OutPC); #2;
    
    $display("InstMem:%b",DUT.InstM);
    $display("Out:%b\tOutRegA:%b\tSignOut:%b"
             ,DUT.InstM,DUT.OutRegA,DUT.SignOut);
    $display("ALU out point to RAM:%b\tOutRAM:%b\n",DUT.RDD,DUT.DMResult);
    
    #2;
    $display("InstMem:%b",DUT.InstM);
    $display("Out:%b\tOutRegA:%b\tSignOut:%b"
             ,DUT.InstM,DUT.OutRegA,DUT.SignOut);
    $display("ALU out point to RAM:%b\tOutRAM:%b",DUT.RDD,DUT.DMResult);
    
    
  $finish;    
  end
  
  always #1 clk_TB = ~ clk_TB;
endmodule
