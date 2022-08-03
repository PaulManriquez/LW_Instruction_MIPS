module Adder(

  input 	[31:0] SrA,SrB,
  output 	[31:0] result
);
  
  assign result = SrA + SrB;
  
endmodule