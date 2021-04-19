// Code your design here
module uart_tx(
    input [7:0] data_bus,
    input byte_ready,
    input ld_tx_datareg,
    input t_byte,
    input clk,
    input reset_,
    output serial_out
);

    reg [7:0] tx_datareg;
    reg [8:0] tx_shiftreg;
    reg ld_tx_shiftreg;
    reg [2:0] state, next_state;
    reg [2:0] bit_count;
    reg clr;
    reg shift;
    reg start;

    parameter idle = 3'b001;
    parameter waiting = 3'b010;
    parameter sending = 3'b100;
    parameter all_ones = 9'b111111111;

    assign serial_out = tx_shiftreg[0]; //Output is LSB of shift register

    always @ (state or bit_count or t_byte or byte_ready) //Next states and outputs
    begin
        ld_tx_shiftreg = 0;
        clr = 0;
        shift = 0;
        start = 0;
        next_state = state;

        case(state)
            idle:
                if(byte_ready == 1)
                begin
                    ld_tx_shiftreg = 1;
                    next_state = waiting;
                end

            waiting:
                if(t_byte == 1)
                begin
                    start = 1;
                    next_state = sending;
                end

            sending:
                if(bit_count != 9)
                    shift = 1;
                else
                begin
                    clr = 1;
                    next_state = idle;
                end

            default: next_state = idle;
        endcase
    end

    always @ (posedge clk or negedge reset_) //Synchronize state transition of controller
    begin
        if(reset_ == 0)
            state <= idle;
        else
            state <= next_state;
    end

    always @ (posedge clk or negedge reset_) //Synchronize register transfers of datapath registers
    begin
        if(reset_ == 0)
        begin
            tx_shiftreg <= all_ones;
            bit_count <= 0; end
        else
        begin
            if(ld_tx_datareg == 1)
                tx_datareg <= data_bus;

            if(ld_tx_shiftreg == 1)
                tx_shiftreg <= {tx_datareg, 1'b1};

            if(start == 1)
                tx_shiftreg[0] <= 0;

            if(clr == 1)
                bit_count <= 0;

            else if(shift == 1)
                bit_count <= bit_count+1;

            if(shift == 1)
                tx_shiftreg <= {1'b1, tx_shiftreg[8:1]};
        end
    end
endmodule

module tb_uart_tx();
    reg [7:0] data_bus;
    reg t_byte;
    reg ld_tx_datareg;
    reg clk;
    reg reset_;
    reg byte_ready;
    wire serial_out;

    uart_tx transmitter(
        .data_bus(data_bus),
        .byte_ready(byte_ready),
        .ld_tx_datareg(ld_tx_datareg),
        .clk(clk), .reset_(reset_),
        .serial_out(serial_out),
        .t_byte(t_byte)
    );

    initial begin
        clk = 1'b0;
    end

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_uart_tx);
    end

    initial begin
        #2 reset_ = 1'b0;
        #10 reset_ = 1'b1;

        data_bus = 8'haa;

        ld_tx_datareg = 1'b1;

        #10 byte_ready = 1'b1;

        #10 t_byte = 1'b1;
        #200
        $finish;
    end
endmodule
