module silly(input logic [3:0] a, b, logic c, output logic [3:0] sum, logic cout);
  logic c1, c2, c3;
  
   fa rc1( a[0], b[0], c, sum[0], c1);
   fa rc2( a[1], b[1], c1, sum[1], c2);
   fa rc3( a[2], b[2], c2, sum[2], c3);
   fa rc4( a[3], b[3], c3, sum[3], cout);

endmodule

module fa(input  logic a, b, c, output logic sum, cout);
   
  assign sum = ~a & ~b & c | ~a & b & ~c | a & ~b & ~c | a & b & c;
  assign cout = ~a & b & c | a & ~b & c | a & b & ~c | a & b & c;
   
endmodule
