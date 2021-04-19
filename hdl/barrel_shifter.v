module barrel_shifter(
    output reg [7:0] data_out,
    input [7:0] data_in,
    input load, clk, clr
);

always @ (posedge clr or posedge clk)
begin
    if(clr == 1'b1)
        data_out = 8'b0;
    else if (load == 1'b1)
        data_out <= data_in;
    else 
        data_out <= {data_out[6:0], data_out[7]};
end
endmodule