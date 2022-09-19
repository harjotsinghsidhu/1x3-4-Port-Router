module router(clk1, clk2, rst, packet_in, packet_valid_i, stop_packet_send, packet_valid_o1, packet_valid_o2, packet_valid_o3, packet_out1, packet_out2, packet_out3);

	input clk1, clk2, rst; //clk1 runs at 250KHz & clk2 runs at 100KHz
	input packet_in, packet_valid_i, stop_packet_send; //packet_in & packet_valid_i operate on clk1
	output packet_valid_o1, packet_valid_o2, packet_valid_o3, packet_out1, packet_out2, packet_out3;  //packet_out1/2/3 & packet_valid_o1/2/3 operate on clk2

	parameter [7:0] TS1, TS2, TS3; // trusted sources - 8-bit values (0-255) (8’d0<dest_id<=8’d255 - to packet_out1or2or3)
	
	always @(posedge clk1)
	begin 
		if(packet_valid_i==1)
		
		else
		
		case(packet_valid_i)
		
	
	