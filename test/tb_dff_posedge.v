// Code your testbench here
// or browse Examples
module tb_dff();
  parameter w = 4;
  reg [w - 1:0] D;
  reg EN, CLOCK, CLEAR;
  wire [w - 1:0] Q, Qbar;
  
  dff #(.DATA_WIDTH(w)) flipflop(
    .i_en(EN),
    .clk(CLOCK),
    .clr(CLEAR),
    .q(Q),
    .qbar(Qbar),
    .d(D)
  );
  
  initial begin
    CLOCK = 1'b0;
  end
  
  always begin
    #1 CLOCK = ~CLOCK;
  end
  
  initial begin
    $dumpfile("simulation/tb_dff_posedge.vcd"); 
    $dumpvars(0, tb_dff);
    
    CLEAR = 1'b1;
    EN = 1'b0;
    
    D = 4'b0011;
    #3;
    
    CLEAR = 1'b0;
    #2;
    EN = 1'b1;
    
    #5;
    D = 4'b1010;
    
    #50;
    $finish;
  end
  
  initial begin
    $monitor($time, "   d = %x, clk = %b, q = %x, clr = %b", D, CLOCK, Q, CLEAR);
  end
endmodule
  
