module fa_using_ha(
    input a, b, cin,
    output sum, cout
);

wire w1, w2, w3;

half_adder ha1(a, b, w1, w2);
half_adder ha2(w1, cin, sum, w3);
or(cout, w2, w3);

endmodule


module half_adder(
    input a, b,
    output sum, cout
);

xor(sum, a, b);
and(cout, a, b);

endmodule