module tb_problem2();

reg a, b, c, d, sel;
wire x, y, p, q, out;

problem2 uut(.a(A), .b(B), .c(C), .d(D), .sel(S), .out(Hha));

initial begin
    
end

initial begin
    a = 1'b1;
    b = 1'b1;
    c = 1'b0;
    c = 1'b0;

    #10

    a = 1'b0;
    
end