module Top(
    input clk,
    input rst,
    /////////////////////bluetooth///////////////////
    input rx,
    output [8-1:0] rxdata,
    /////////////////////sonic///////////////////////
	input echo_front,
    output trig_front,
    input echo_back,
    output trig_back,
    /////////////////////motor////////////////////////
    output left_motor,
    output reg [1:0] left,
    output right_motor,
    output reg [1:0] right,
    /////////////////////turn signal///////////////////
    output left_light,
    output right_light,
    /////////////////////debug signal///////////////////
    output [3:0] led,
    output reg mode,
    output stop_front,
    output stop_back
);

    /////////////////bluetooth/////////////////////
    wire clk_22; // 22 times slower than the original clk
	wire rst_db, rst_op; // rst debounce & rst one pulse

	wire [16-1:0] baudrate; // 16 times faster than the frequency of the UART signal
	wire tick; 				    // 9600 * 16 = 153600, clock = 1Mhz
	assign baudrate = 16'd651;	// 100000000 / 153600 = 651 baudrate

	clock_divider #(22) cd1(clk, clk_22);
	debounce d1(rst_db, rst, clk_22);
	onepulse o1(rst_db, clk, rst_op);
	tick_generator tk(clk, rst_op, baudrate, tick);
	rx_module r1(clk, rst_op, rx, tick, rxdata);

    /////////////////sonic/////////////////////////
    sonic_top B(
        .clk(clk), 
        .rst(rst_op), 
        .Echo(echo_front), 
        .Trig(trig_front),
        .stop(stop_front)
    );
    /*sonic_top C(
        .clk(clk), 
        .rst(rst_op), 
        .Echo(echo_back), 
        .Trig(trig_back),
        .stop(stop_back)
    );*/
	///////////////////motor//////////////////////////////
    reg [2:0] next_mode;
    parameter FAST = 3'd0;
    parameter SLOW = 3'd1;
    motor A(
        .clk(clk),
        .rst(rst_op),
        .mode(mode),
        .pwm({left_motor, right_motor})
    );

    always @(posedge clk) begin
       if(rst_op)
            mode <= SLOW;
        else
            mode <= next_mode;
    end

    always @(*) begin
        if (stop_front) begin
            case (rxdata)
            8'd2: {left, right} = {2'b01, 2'b01}; // backward
            default: {left, right} = {2'b00, 2'b00}; // stop
            endcase
        end else  begin
           /* if (stop_back) begin
                case (rxdata)
                8'd1: {left, right} = {2'b10, 2'b10}; // forward
                8'd3: {left, right} = {2'b10, 2'b00}; // right
                8'd4: {left, right} = {2'b00, 2'b10}; // left
                default: {left, right} = {2'b00, 2'b00}; // stop
                endcase
            end else begin*/
                case (rxdata)
                8'd1: {left, right} = {2'b10, 2'b10}; // forward
                8'd2: {left, right} = {2'b01, 2'b01}; // backward
                8'd3: {left, right} = {2'b10, 2'b00}; // right
                8'd4: {left, right} = {2'b00, 2'b10}; // left
                default: {left, right} = {2'b00, 2'b00}; // stop
                endcase
            //end
        end

        case (rxdata)
            8'd5: next_mode = FAST;
            8'd6: next_mode = SLOW;
            default: next_mode = mode;
        endcase
    end

    assign left_light = (rxdata == 8'd4);
    assign right_light = (rxdata == 8'd3);
    assign led[0] = left[0];
    assign led[1] = left[1];
    assign led[2] = right[0];
    assign led[3] = right[1];

endmodule

module debounce (pb_debounced, pb, clk);
    output pb_debounced; 
    input pb;
    input clk;
    reg [4:0] DFF;
    
    always @(posedge clk) begin
        DFF[4:1] <= DFF[3:0];
        DFF[0] <= pb; 
    end
    assign pb_debounced = (&(DFF)); 
endmodule

module onepulse (PB_debounced, clk, PB_one_pulse);
    input PB_debounced;
    input clk;
    output reg PB_one_pulse;
    reg PB_debounced_delay;

    always @(posedge clk) begin
        PB_one_pulse <= PB_debounced & (!PB_debounced_delay);
        PB_debounced_delay <= PB_debounced;
    end 
endmodule
