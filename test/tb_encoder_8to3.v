module tb_encoder_8to3();

    reg [7:0] data;
    wire [2:0] code;
    
    encoder_8to3 uut(
        .data(data),
        .code(code)
    );

    initial begin
        $dumpfile("simulation/tb_encoder_8to3.vcd");
        $dumpvars(0, tb_encoder_8to3);

        data = 8'h01;
        #2 data = 8'h02;
        #4 data = 8'h04;
        #6 data = 8'h08;
        #8 data = 8'h10;
        #10 data = 8'h20;
        #12 data = 8'h40;
        #14 data = 8'h80;

        #20;
        $finish;
    end

    initial begin
        $monitor($time, "  data = %b  code = %b   |  data = %x  code = %x", data, code, data, code);
    end
    endmodule