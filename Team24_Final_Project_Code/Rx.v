module rx_module(clk, rst, rx, tick, rxdata);
	input clk, rst, rx, tick;
	output reg [8-1:0] rxdata;

	parameter IDLE = 1'b0;
	parameter READ = 1'b1;

	reg state, next_state;
	reg [4-1:0] count, next_count; // count for the tick pulse up to 16
	reg [8-1:0] read_data, next_read_data; // reg for data that is still reading
	reg [4-1:0] Bit, next_Bit; // currently read to which bit
	reg start_Bit, next_start_Bit; // used to determine the start bit is over or not
	reg read_done, next_read_done; // used to determine read process is done or not

	always @(posedge clk or negedge rst) begin
		if (rst) begin
			state <= IDLE;
			read_data <= 8'b11111111;
			start_Bit <= 1'd1;
			Bit <= 4'd0;
			read_done <= 1'd0;
			count <= 4'd0;
		end else begin
			state <= next_state;
			read_data <= next_read_data;
			start_Bit <= next_start_Bit;
			Bit <= next_Bit;
			read_done <= next_read_done;
			count <= next_count;
		end
	end

	// state transition
	always @(*) begin
		case (state)
			IDLE: begin
				if (rx == 1'b0) next_state = READ; // when rx become 1'b0, means start signal comes
				else next_state = IDLE;
			end
			READ: begin
				if (read_done) next_state = IDLE; // when read process is done, change state to IDLE
				else next_state = READ;
			end
			default: next_state = IDLE;
		endcase
	end

	// read the rx data
	always @(*) begin
		case (state)
			IDLE: begin
				next_count = 4'd0;
				next_start_Bit = 1'd1;
				next_Bit = 4'd0;
				next_read_done = 1'd0;
				next_read_data = read_data;
			end
			READ: begin
				// default value (when doesn't fit any condition below)
				if (tick) next_count = count + 4'd1;
				else next_count = count;
				
				if ((count == 4'b1000) && start_Bit) begin // count tick to the middle of the start bit
					next_count = 4'd0;
					next_start_Bit = 1'd0;
					next_Bit = Bit;
					next_read_done = read_done;
					next_read_data = read_data;
				end else begin
					if ((count == 4'b1111) && (Bit < 8) && tick) begin // continue reading the data
						next_count = 4'd0;
						next_start_Bit = 1'd0;
						next_Bit = Bit + 4'd1;
						next_read_done = read_done;
						next_read_data = {rx, read_data[7 : 1]};
					end else begin
						if ((count == 4'b1111) && (Bit == 8) && rx) begin // finish reading the data
							next_count = 4'd0;
							next_start_Bit = 1'd1;
							next_Bit = 4'd0;
							next_read_done = 1'd1;
							next_read_data = read_data;
						end else begin
							next_start_Bit = start_Bit;
							next_Bit = Bit;
							next_read_done = read_done;
							next_read_data = read_data;
						end
					end
				end			
			end
			default: begin
				next_count = 4'd0;
				next_Bit = 4'd0;
				next_start_Bit = 1'd1;
				next_read_done = 1'd0;
				next_read_data = 8'd0;
			end
		endcase
	end

	// assign the read_data to the rxdata
	always @(posedge read_done or negedge rst) begin
		if (rst) rxdata <= 8'b11111111;
		else rxdata <= read_data;
	end
endmodule