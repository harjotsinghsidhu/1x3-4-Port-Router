module router_top_tb;

	
	reg clk1, reset, packet_valid_i, packet_in;
	wire packet_out_1, packet_out_2, packet_out_3;
	wire packet_valid_o1, packet_valid_o2, packet_valid_o3;
	integer i;
	
	
	router_top UUT(.clk(clk), .reset(reset), .packet_valid_i(packet_valid_i), .packet_out_1(.packet_out_1), .packet_out_2(.packet_out_2), .packet_out_3(.packet_out_3), .stop_packet_send(stop_packet_send))
	
	
	initial begin
		clk = 1;
		forever
		#5 clk=~clk;
		end
		
		begin 
			reset=0;
			{packet_in, packet_valid_i, read_enable}=0;
			#2 reset=1;
		end
		
		
		
		
	$finish;
	
endmodule
	




