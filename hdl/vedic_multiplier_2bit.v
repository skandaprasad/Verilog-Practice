module vedic_multiplier_2bit(
    input [1:0] a,
    input [1:0] b,
    output [3:0] out
);
wire w1 = a[0] & b[1];
wire w2 = a[1] & b[0];
wire w3 = w1 & w2;
wire w4 = a[1] & b[1];

assign out[0] = a[0] & b[0];
assign out[1] = w1 ^ w2;
assign out[2] = w3 ^ w4;
assign out[3] = w3 & w4;

endmodule
