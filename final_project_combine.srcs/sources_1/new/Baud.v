module tick_generator(clk, rst, baudrate, tick); 
	// according to the baudrate and generate the tick
	input clk, rst;
	input [16 - 1 : 0] baudrate;
	output tick;

	reg [16 - 1 : 0] count;
	reg [16 - 1 : 0] next_count;

	reg tick;

	always @(posedge clk) begin
		if (rst)
			count <= 1;
		else
			count <= next_count;
	end

	always @(*)begin
		if (count == baudrate)begin
			next_count = 1;
			tick=1;
		end
		else begin
			next_count = count +1;
			tick = 0;
		end
	end

endmodule