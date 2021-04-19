module tb_fa_using_ha();
    reg A, B, Cin;
    wire S, Cout;

    fa_using_ha UUT(.a(A), .b(B), .cin(Cin), .sum(S), .cout(Cout));

    initial begin
        $dumpfile("simulation/tb_fa_using_ha.vcd");
        $dumpvars(0, tb_fa_using_ha);
    end  

    initial begin
        A = 1'b0; B = 1'b0; Cin = 1'b0;
        #10;

        B = 1'b1;
        #10;

        Cin = 1'b1;
        #10;
    end

    initial begin
        $monitor($time, " units  Sum = %b, Cout = %b", S, Cout);
    end
endmodule
