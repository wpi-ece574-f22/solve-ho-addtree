module addtree(
	       input wire [63:0]  a,
	       input wire [63:0]  b,
	       input wire [63:0]  c,
	       input wire [63:0]  d,
	       input wire 	  clk,
	       input wire 	  reset,
	       output wire [63:0] q
	       );

   wire [63:0] 			  q1, q2;
   
   add64 m1(.a(a), .b(b), .clk(clk), .reset(reset), .q(q1));
   add64 m2(.a(c), .b(d), .clk(clk), .reset(reset), .q(q2));
   add64 m3(.a(q1), .b(q2), .clk(clk), .reset(reset), .q(q));
   
endmodule
