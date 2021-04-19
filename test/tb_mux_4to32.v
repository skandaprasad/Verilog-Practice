module tb_mux_4to32();

    wire [31:0] out;
    reg [31:0] in1, in2, in3, in4;
    reg [1:0] sel;
    reg en;
    
    mux_4to32 uut(.out(out), 
    .in1(in1), 
    .in2(in2), 
    .in3(in3), 
    .in4(in4), 
    .sel(sel), 
    .en(en)
    );

    initial begin
        $dumpfile("simulation/tb_mux_4to32.vcd");
        $dumpvars(0, tb_mux_4to32);

        in1 = 32'hffffffff;
        in2 = 32'h00000000;
        in3 = 32'haaaaaaaa;
        in4 = 32'hffff0000;

        en = 0;
        #5 sel = 2'b00;
        #2 en = 1;

        #3 sel = 2'b01;
        #5 sel = 2'b10;
        #5 sel = 2'b11;

        #20;
        $finish;
    end

    initial begin
        $monitor($time, "sel = %b   out = %x", sel, out);
    end
    endmodule