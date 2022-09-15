module add64(
	     input wire [63:0] 	a,
	     input wire [63:0] 	b,
	     input wire 	clk,
	     input wire 	reset,
	     output wire [63:0] q);

   // COMBINATIONAL
   assign q = a + b;

   //   // USING A PIPELINE STAGE
   //   reg [63:0] 			qreg;
   //   always @(posedge clk, posedge reset)
   //     begin
   //	if (reset)
   //	  qreg <= 64'b0;
   //	else
   //	  qreg <= a+b;	
   //     end
   //   assign q = qreg;
   
endmodule
