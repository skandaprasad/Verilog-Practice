module Combo_str(
    input A, B, C, D,
    output Y);

wire w1, w2, w3;

nor(w1, A, C);
not(w2, D);
and(w3, B, C, w2);
and(Y, w3, w1);

endmodule 