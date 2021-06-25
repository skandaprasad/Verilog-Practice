module tb_and_gate();

reg a, b;
wire y;

and_gate uut(.a(a), .b(b), .y(y));

initial begin
    $dumpfile("simulation/tb_and_gate.vcd");
    $dumpvars(0, tb_and_gate);
end

initial begin
    a = 1;
    b = 0;

    #2;

    a = 0;
    b = 0;

    #2;

    a = 1;
    b = 1;
end

initial begin
    $monitor($time, "a = %b     b = %b     y = %b", a, b, y);
end

