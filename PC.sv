module PC(
  input 	[31:0]DataIn,
  input 	clk,rst,
  output 	[31:0]DataOut
);
  
  reg [31:0]DataReg;
 
   always@(posedge clk or negedge rst) begin 
    if(!rst)begin 
    	DataReg<=0;
    end else begin 
    	DataReg<=DataIn;
    end
    
  end
  
  assign DataOut=DataReg;
  
endmodule