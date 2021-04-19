module tb_full_adder();
    reg A, B, Cin;
    wire S, Cout;

    full_adder UUT(.a(A), .b(B), .cin(Cin), .s(S), .cout(Cout));

    initial begin
        $dumpfile("simulation/tb_full_adder.vcd");
        $dumpvars(0,tb_full_adder);
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
        $monitor($time, " units  S = %b, Cout = %b", S, Cout);
    end
endmodule