`timescale 1ns / 1ps
module tb ();

   logic    [3:0]    a;
   logic 	[3:0]    b;
   logic 	c;
   logic 	[3:0] sum;
   logic    cout;
   logic    [3:0] Sum_correct;
   logic        clk;   
   
  // instantiate device under test
   silly dut (a[3:0], b[3:0], c, sum[3:0], cout);
 ////////////////////////////////////////////////////////////////////
   // 20 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end


integer handle3;
integer desc3;
integer i;

initial
begin
	handle3 = $fopen("rca.out");
	desc3 = handle3;
	#1250 $finish;
end

initial
begin
	for (i=0; i < 128; i=i+1)
		begin
			// Put vectors before beginning of clk
			@(posedge clk)
				begin
					a = $random;
					b = $random;
					c = $random;

					Sum_correct = a + b + c;
				end
			@(negedge clk)
		begin
		$fdisplay(desc3, "%h %h %h |l %h %h| %h | %b", a, b, c, sum, cout, Sum_correct, (sum == Sum_correct));
	end
end // @(negedge clk)

end
endmodule
/*
   initial
     begin

	#0   a = 4'b0000;	
	#0   b = 4'b0000;
	#0   c = 1'b0;

	#20  a = 4'b0001;
	#0   b = 4'b0000;
	#0   c = 1'b0;

	#20  a = 1'b0;
	#0   b = 1'b1;
	#0   c = 1'b0;

	#20  a = 1'b1;
	#0   b = 1'b1;
	#0   c = 1'b0;

	#0   a = 1'b0;	
	#0   b = 1'b0;
	#0   c = 1'b1;

	#20  a = 1'b1;
	#0   b = 1'b0;
	#0   c = 1'b1;

	#20  a = 1'b0;
	#0   b = 1'b1;
	#0   c = 1'b1;

	#20  a = 1'b1;
	#0   b = 1'b1;
	#0   c = 1'b1;		


	
     end

   
endmodule
*/
