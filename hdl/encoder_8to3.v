module encoder_8to3(
    input [7:0] data,
    output reg [2:0] code
);

always @ (data)
begin
    case(data)

    8'h01 : code = 3'b000;
    8'h02 : code = 3'b001;
    8'h04 : code = 3'b010;
    8'h08 : code = 3'b011;
    8'h10 : code = 3'b100;
    8'h20 : code = 3'b101;
    8'h40 : code = 3'b110;
    8'h80 : code = 3'b111;
    default: code = 3'bx;

    endcase
end

endmodule