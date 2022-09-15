module addtreetb();
   
   reg reset, clk;   
   reg [63:0] a, b, c, d;
   wire [63:0] q;
 
   addtree dut(.a(a), .b(b), .c(c), .d(d), .clk(clk), .reset(reset), .q(q));

   always
     begin
	clk = 1'b0;
	#10;

	clk = 1'b1;
	#10;
     end

   initial
     begin
	reset = 1'b1;
	#25;	
	reset = 1'b0;
     end

   initial
     begin
	$dumpfile("trace.vcd");
	$dumpvars(0, addtreetb);
	repeat(100)
	  begin
	     a = {$random, $random};
	     b = 64'b1;
	     c = a;
	     d = 64'b1;
	     
	     // add adder latency
	     repeat(0) @(posedge clk);

	     @(posedge clk);

	     $display("%t %x %x %x %x -> %x (OK? %d)", $time, a, b, c, d, q, (q == (a + b + c + d)));
	  end
	$finish;
     end
  
endmodule
