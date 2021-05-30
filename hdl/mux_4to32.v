module mux_4to32(
    output [31:0] out,
    input [31:0] in1, in2, in3, in4,
    input [1:0] sel,
    input en
);

reg [31:0] mux_buff;

assign out = en ? mux_buff : 32'bz;

always @ (sel, in1, in2, in3, in4)
begin
    case(sel)
    2'b00: mux_buff = in1;
    2'b01: mux_buff = in2;
    2'b10: mux_buff = in3;
    2'b11: mux_buff = in4;

    default: mux_buff = 32'bx;
    endcase
end
endmodule