// Code your design here
module dff(
  q,
  qbar,
  d,
  i_en,
  clk,
  clr
);
  
  parameter DATA_WIDTH = 1;
  input [DATA_WIDTH - 1:0] d;
  input i_en, clk, clr;
  output reg [DATA_WIDTH - 1:0] q;
  output [DATA_WIDTH - 1:0] qbar;
  
  always @ (posedge clk or clr or i_en)
  begin
    if(clr)
      q <= 0;
    else if(i_en)
      q <= d;
  end
  assign qbar = ~q;
  
endmodule