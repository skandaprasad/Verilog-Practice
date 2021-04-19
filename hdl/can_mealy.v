module canbus_mealy(
    input clk,
    input clr,
    input can_data_stream,
    output reg alert
);
    localparam A = 2'b00;
    localparam B = 2'b01;
    localparam C = 2'b10;
    localparam D = 2'b11;

    reg [1:0] present_state, next_state;

    always @(posedge clk or clr)
    begin
        if(clr)
            present_state <= A;
        else
            present_state <= next_state;
    end

    always @(present_state or can_data_stream)
    begin
        case(present_state)
            A:
                begin
                    alert = 0;
                    next_state = can_data_stream ? B : A;
                end
            B:
                begin
                    alert = 0;
                    next_state = can_data_stream ? C : A;
                end
            C:
                begin
                    alert = 0;
                    next_state = can_data_stream ? D : A;
                end
            D:
                begin
                    alert = can_data_stream ? 0 : 1;
                    next_state = A;
                end
            default:
                next_state = A;
        endcase
    end
endmodule

module tb();
    reg can_data_stream;
    reg clk, clr;
    wire alert;

    canbus_mealy uut(.clk(clk), .clr(clr), .alert(alert), .can_data_stream(can_data_stream));

    initial
    begin
        $dumpfile("canbus.vcd");
        $dumpvars(0, tb);
        clk = 1'b0;
    end

    always
    begin
        #5 clk = ~clk;
    end

    initial
    begin
    end

    initial
    begin
        #10 clr = 1'b1;
        #10 clr = 1'b0;

        #10 can_data_stream = 1'b0;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b0;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b0;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b1;
        #10 can_data_stream = 1'b0;
        #10 can_data_stream = 1'b0;
        #10 can_data_stream = 1'b0;
        $finish;
    end
endmodule