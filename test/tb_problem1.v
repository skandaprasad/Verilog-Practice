module t_Combo_str();

wire y;
reg a, b, c, d;

Combo_str UUT(a, b, c, d, y);

initial begin
    $dumpfile("simulation/tb_problem1.vcd");
    $dumpvars(0, t_Combo_str);
end

initial begin
    a = 1; b = 1; c = 1; d = 1;
    #10;

    b = 0; c = 0;
    #10;

    a = 0; b = 1; d = 0;
    #10;
end

initial begin
    $monitor($time, " units   a = %b, b = %b, c = %b, d = %b, y = %b ", a, b, c, d, y);
end