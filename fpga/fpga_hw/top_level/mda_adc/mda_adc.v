// Motion in perpendicular plane will cause variations on the specific axis, note that this represent motion AROUND a specific axis
// z-axis = side to side (short)
// y-axis = side to side (long)
// x-axis = vertical

/*

 ---------------------------------|----------------------------------
 ---------------------------------|- Y - Axis -----------------------
 ---------------------------------|----------------------------------
 ---------------------------------|----------------------------------
 ---------------------=========================----------------------
 ---------------------||                     ||----------------------
 ---------------------||                     ||______________________
 ---------------------||        DE0-Nano     ||--- X - Axis ---------
 ---------------------||                     ||----------------------
 ---------------------||                     ||----------------------
 ---------------------=========================----------------------
 ---------------------------------|----------------------------------
 ---------------------------------|----------------------------------
 ---------------------------------|----------------------------------
 ---------------------------------|----------------------------------
 YEAH... BUT NO, this is actually just the depth sensor... jinks. So
 just disregard the above.
 ahsueh1996
 */

// used to be called imu. now called just the adc module because it does
// not have anything to do with the imu.
module mda_adc (
    input 	      reset_n,
    input 	      spi_clk,
    output [8*32-1:0] adc_channels,

    //////////// ADC //////////
    input 	      ADC_SDO,
    output 	      ADC_CONVST,
    output 	      ADC_SDI,
    output 	      ADC_SCK
    );

   ///=======================================================
   //  REG/WIRE declarations
   //=======================================================
   wire [11:0] 	      ADC_12_bit_channel_0;
   wire [11:0] 	      ADC_12_bit_channel_1;
   wire [11:0] 	      ADC_12_bit_channel_2;
   wire [11:0] 	      ADC_12_bit_channel_3;
   wire [11:0] 	      ADC_12_bit_channel_4;
   wire [11:0] 	      ADC_12_bit_channel_5;
   wire [11:0] 	      ADC_12_bit_channel_6;
   wire [11:0] 	      ADC_12_bit_channel_7;

   // ADC connections, on chip

   mda_adc_controller adc_controller_8_channels (      
		 .iRST(!reset_n),
		 .iCLK(spi_clk),
		 .iCLK_n(!spi_clk),
		 .iGO(1'b1),
		
		 .oDIN(ADC_SDI),
		 .oCS(ADC_CONVST),
		 .oSCLK(ADC_SCK),
		 .iDOUT(ADC_SDO),
		
		 .oADC_12_bit_channel_0(ADC_12_bit_channel_0),
		 .oADC_12_bit_channel_1(ADC_12_bit_channel_1),
		 .oADC_12_bit_channel_2(ADC_12_bit_channel_2),
		 .oADC_12_bit_channel_3(ADC_12_bit_channel_3),
		 .oADC_12_bit_channel_4(ADC_12_bit_channel_4),
		 .oADC_12_bit_channel_5(ADC_12_bit_channel_5),
		 .oADC_12_bit_channel_6(ADC_12_bit_channel_6),
		 .oADC_12_bit_channel_7(ADC_12_bit_channel_7)
		 );

   assign adc_channels[1*32-1:0*32] = {20'd0, ADC_12_bit_channel_0};
   assign adc_channels[2*32-1:1*32] = {20'd0, ADC_12_bit_channel_1};
   assign adc_channels[3*32-1:2*32] = {20'd0, ADC_12_bit_channel_2};
   assign adc_channels[4*32-1:3*32] = {20'd0, ADC_12_bit_channel_3};
   assign adc_channels[5*32-1:4*32] = {20'd0, ADC_12_bit_channel_4};
   assign adc_channels[6*32-1:5*32] = {20'd0, ADC_12_bit_channel_5};
   assign adc_channels[7*32-1:6*32] = {20'd0, ADC_12_bit_channel_6};
   assign adc_channels[8*32-1:7*32] = {20'd0, ADC_12_bit_channel_7};
   
endmodule