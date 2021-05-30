module tb_vedic_multiplier_2bit();

reg [1:0] a, b;
wire [3:0] out;

vedic_multiplier_2bit uut(.a(a), .b(b), .out(out));

initial begin
    $dumpfile("simulation/tb_vedic_multiplier_2bit.vcd");
    $dumpvars(0, tb_vedic_multiplier_2bit);
end

initial begin
    a = 2'b11;
    #2;

    b = 2'b11;
    #2;

    a = 2'b10;
    #2;

    b = 2'b00;
end

initial begin
    $monitor($time, "a = %b  b = %b  product = %b", a, b, out);
end

endmodule
