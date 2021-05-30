module tb_barrel_shifter();

wire [7:0] data_out;
reg [7:0] data_in;
reg clk, clr, load;

barrel_shifter uut(.data_out(data_out), .data_in(data_in), .clk(clk), .clr(clr), .load(load));

initial begin
    clk = 1'b0;
end

initial begin
    #5 clk = ~clk;
end

initial begin
    $dumpfile("../simulation/tb_barrel_shifter.v");
    $dumpvars(0, tb_barrel_shifter);
end

initial begin
    clr = 1'b1;
    #10 clr = 1'b0;

    #5 data_in = 8'hfe;
    #5 load = 1'b1;
end

initial begin
    $monitor($time, " Barrel Shifter output: %x", data_out);
end

endmodule