//
// Generated by Bluespec Compiler, version 2017.07.A (build 1da80f1, 2017-07-21)
//
// On Fri Dec 21 12:41:39 EST 2018
//
//
// Ports:
// Name                         I/O  size props
// RDY_mem_server_request_put     O     1 reg
// mem_server_response_get        O   256 reg
// RDY_mem_server_response_get    O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// mem_server_request_put         I   353
// EN_mem_server_request_put      I     1
// EN_mem_server_response_get     I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkMem_Model(CLK,
		   RST_N,

		   mem_server_request_put,
		   EN_mem_server_request_put,
		   RDY_mem_server_request_put,

		   EN_mem_server_response_get,
		   mem_server_response_get,
		   RDY_mem_server_response_get);
  input  CLK;
  input  RST_N;

  // action method mem_server_request_put
  input  [352 : 0] mem_server_request_put;
  input  EN_mem_server_request_put;
  output RDY_mem_server_request_put;

  // actionvalue method mem_server_response_get
  input  EN_mem_server_response_get;
  output [255 : 0] mem_server_response_get;
  output RDY_mem_server_response_get;

  // signals for module outputs
  wire [255 : 0] mem_server_response_get;
  wire RDY_mem_server_request_put, RDY_mem_server_response_get;

  // ports of submodule f_raw_mem_rsps
  wire [255 : 0] f_raw_mem_rsps$D_IN, f_raw_mem_rsps$D_OUT;
  wire f_raw_mem_rsps$CLR,
       f_raw_mem_rsps$DEQ,
       f_raw_mem_rsps$EMPTY_N,
       f_raw_mem_rsps$ENQ,
       f_raw_mem_rsps$FULL_N;

  // ports of submodule rf
  wire [255 : 0] rf$D_IN, rf$D_OUT_1;
  wire [63 : 0] rf$ADDR_1,
		rf$ADDR_2,
		rf$ADDR_3,
		rf$ADDR_4,
		rf$ADDR_5,
		rf$ADDR_IN;
  wire rf$WE;

  // rule scheduling signals
  wire CAN_FIRE_mem_server_request_put,
       CAN_FIRE_mem_server_response_get,
       WILL_FIRE_mem_server_request_put,
       WILL_FIRE_mem_server_response_get;

  // remaining internal signals
  reg [31 : 0] v__h365, v__h371;
  wire mem_server_request_put_BITS_319_TO_256_ULT_0x8_ETC___d2;

  // action method mem_server_request_put
  assign RDY_mem_server_request_put = f_raw_mem_rsps$FULL_N ;
  assign CAN_FIRE_mem_server_request_put = f_raw_mem_rsps$FULL_N ;
  assign WILL_FIRE_mem_server_request_put = EN_mem_server_request_put ;

  // actionvalue method mem_server_response_get
  assign mem_server_response_get = f_raw_mem_rsps$D_OUT ;
  assign RDY_mem_server_response_get = f_raw_mem_rsps$EMPTY_N ;
  assign CAN_FIRE_mem_server_response_get = f_raw_mem_rsps$EMPTY_N ;
  assign WILL_FIRE_mem_server_response_get = EN_mem_server_response_get ;

  // submodule f_raw_mem_rsps
  FIFO2 #(.width(32'd256), .guarded(32'd1)) f_raw_mem_rsps(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(f_raw_mem_rsps$D_IN),
							   .ENQ(f_raw_mem_rsps$ENQ),
							   .DEQ(f_raw_mem_rsps$DEQ),
							   .CLR(f_raw_mem_rsps$CLR),
							   .D_OUT(f_raw_mem_rsps$D_OUT),
							   .FULL_N(f_raw_mem_rsps$FULL_N),
							   .EMPTY_N(f_raw_mem_rsps$EMPTY_N));

  // submodule rf
  RegFileLoad #(.file("Mem.hex"),
		.addr_width(32'd64),
		.data_width(32'd256),
		.lo(64'd0),
		.hi(64'd8388607),
		.binary(1'd0)) rf(.CLK(CLK),
				  .ADDR_1(rf$ADDR_1),
				  .ADDR_2(rf$ADDR_2),
				  .ADDR_3(rf$ADDR_3),
				  .ADDR_4(rf$ADDR_4),
				  .ADDR_5(rf$ADDR_5),
				  .ADDR_IN(rf$ADDR_IN),
				  .D_IN(rf$D_IN),
				  .WE(rf$WE),
				  .D_OUT_1(rf$D_OUT_1),
				  .D_OUT_2(),
				  .D_OUT_3(),
				  .D_OUT_4(),
				  .D_OUT_5());

  // submodule f_raw_mem_rsps
  assign f_raw_mem_rsps$D_IN = rf$D_OUT_1 ;
  assign f_raw_mem_rsps$ENQ =
	     EN_mem_server_request_put &&
	     mem_server_request_put_BITS_319_TO_256_ULT_0x8_ETC___d2 &&
	     !mem_server_request_put[352] ;
  assign f_raw_mem_rsps$DEQ = EN_mem_server_response_get ;
  assign f_raw_mem_rsps$CLR = 1'b0 ;

  // submodule rf
  assign rf$ADDR_1 = mem_server_request_put[319:256] ;
  assign rf$ADDR_2 = 64'h0 ;
  assign rf$ADDR_3 = 64'h0 ;
  assign rf$ADDR_4 = 64'h0 ;
  assign rf$ADDR_5 = 64'h0 ;
  assign rf$ADDR_IN = mem_server_request_put[319:256] ;
  assign rf$D_IN = mem_server_request_put[255:0] ;
  assign rf$WE =
	     EN_mem_server_request_put &&
	     mem_server_request_put_BITS_319_TO_256_ULT_0x8_ETC___d2 &&
	     mem_server_request_put[352] ;

  // remaining internal signals
  assign mem_server_request_put_BITS_319_TO_256_ULT_0x8_ETC___d2 =
	     mem_server_request_put[319:256] < 64'h0000000000800000 ;

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mem_server_request_put &&
	  !mem_server_request_put_BITS_319_TO_256_ULT_0x8_ETC___d2)
	begin
	  v__h371 = $stime;
	  #0;
	end
    v__h365 = v__h371 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mem_server_request_put &&
	  !mem_server_request_put_BITS_319_TO_256_ULT_0x8_ETC___d2)
	$display("%0d: ERROR: Mem_Model.request.put: addr 0x%0h >= size 0x%0h (num raw-mem words)",
		 v__h365,
		 mem_server_request_put[319:256],
		 64'h0000000000800000);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mem_server_request_put &&
	  !mem_server_request_put_BITS_319_TO_256_ULT_0x8_ETC___d2)
	$finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkMem_Model

