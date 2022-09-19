module router_top(input clk1, clk2, reset, packet_valid_i, read_enable_0, read_enable_1, read_enable_2, 
					input [7:0] packet_in, 
					output packet_valid_o1, packet_valid_o2, packet_valid_o3, busy, 
					output [7:0] packet_out0, packet_out1, packet_out2, 
					output stop_packet_send, err);	

wire [2:0] wr_en;
wire [2:0] rd_en;
wire [2:0] empty;
wire [2:0] full;
wire [7:0] packet_out0;
wire [7:0] packet_out1;
wire [7:0] packet_out2;
wire data_out;
wire destination;
wire dsize;
wire get_source;
wire get_dest;
wire store_header;
wire get_size;
wire load_data;
wire get_crc;
wire stop_packet_send;
wire trusted_source;
wire crc_checked;
wire err;


	genvar i;
	
generate
for(i=0; i<3; i=i+1)


begin:fifo
	asy_fifo fifo(.reset(reset), .wr_en(wr_en[i]), .rd_en(rd_en[i]), .rd_clk(clk2), .wr_clk(clk1), .data_in(data_in[7:0]), .data_out(data_out[7:0]), .rd_empty(empty[i]), .wr_full(wr_full[i]),);
	
end
endgenerate


router_reg_new r1(.clk1(clk1), .reset(reset), .packet_valid_i(packet_valid_i), .packet_in(packet_in[7:0]), .get_source(get_source), .get_dest(get_dest), .store_header(store_header), .get_size(get_size), .load_data(load_data), .get_crc(get_crc), .fifo_full(fifo_full), .full_state(full_state), .dsize(dsize[2:0]), .data_out(data_out[7:0]), .destination(destination[7:0]),.crc_checked(crc_checked), .trusted_source(trusted_source));

router_fsm fsm(.clk1(clk1), .reset(reset), .packet_valid_i(packet_valid_i), .dsize(dsize[2:0]), .fifo_full(fifo_full), .trusted_source(trusted_source), .fifo_empty_1(fifo_empty_1), .fifo_empty_2(fifo_empty_2), .fifo_empty_3(fifo_empty_3), .write_enb(write_enb), .get_source(get_source), .get_dest(get_dest), .store_header(store_header), .get_size(get_size), .load_data(load_data), .get_crc(get_crc), .full_state(full_state), .stop_packet_send(stop_packet_send)); 

//asy_fifo fifo(.reset(reset), .wr_en(wr_en), .rd_en(rd_en), .rd_clk(rd_clk), .wr_clk(wr_clk), .data_in(data_in[7:0]), .data_out(data_out[7:0]), .rd_empty(rd_empty), .wr_full(wr_full),);

router_sync s(.clk1(clk1), .reset(reset), .get_dest(get_dest), .write_enb_reg(write_enb_reg), .empty_0(empty_0), .empty_1(empty_1), .empty_2(empty_2), .full_0(full_0), .full_1(full_1), .full_2(full_2), .destination(destination[7:0]), .vld_out_0(vld_out_0), .vld_out_1(vld_out_1), .vld_out_2(vld_out_2), .write_enb(write_enb[2:0]), .fifo_full(fifo_full));


assign rd_en[0]=rd_en_0;
assign rd_en[1]=rd_en_1;
assign rd_en[2]=rd_en_2;
assign packet_out0=packet_out[0];
assign packet_out1=packet_out[1];
assign packet_out2=packet_out[2];


endmodule
