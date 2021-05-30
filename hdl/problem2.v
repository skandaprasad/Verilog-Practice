module problem2(
    input A,
    input B,
    input C,
    input D,
    input S,
    output Hha
);

wire x, y, sbar, p, q;

nand #3 (x, A, B);
nand #4 (y, C, D);

not (sbar, S);

and (p, x, sbar);
and (q, y, S);

or (Hha, p, q);

endmodule