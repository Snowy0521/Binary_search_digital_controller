/**
This module is the top module of controller and FIR filter 
**/
module Controller_FIR (
	input	[7:0] 	VPPG,            //Binary output Signal of the ADC
	input 		  	Find_Setting,    //Reset to start find Settings 
	input 		  	CLK,             //The clock signal
	input 		  	rst_n,           //An asychronous positive edge reset signal

	output 	[6:0] 	DC_Comp,         //Used to change the DC_Offset
	output 	[3:0] 	pga_Gain,        //Used to increase the Gain
	output 		  	LED_IR,          //Controlls Infrared LED
	output 		  	LED_RED,         //Controlls RED LED
	output  [19:0] 	Out_RED_Filtered,//The filtered Bit stream output of RED LED
	output  [19:0] 	Out_IR_Filtered, //The filtered Bit stream output of RED IR
	output  [3:0] 	LED_Drive        //Sets the LED brightness
);

    // the wires to connect Contoller module and 2 FIR Filters moudule
	wire [7:0] IR_ADC_Value, RED_ADC_Value;
	wire 	   CLK_Filter;

    //Instantiate Controller_Model 
    Controller ct(  .Vppg(VPPG), 
                    .Find_Setting(Find_Setting), 
                    .CLK(CLK), 
                    .rst_n(rst_n), 
                    .DC_Comp(DC_Comp), 
                    .PGA_Gain(pga_Gain), 
                    .CLK_Filter(CLK_Filter), 
                    .LED_IR(LED_IR), 
                    .LED_RED(LED_RED),
                    .IR_ADC_Value(IR_ADC_Value), 
                    .RED_ADC_Value(RED_ADC_Value), 
                    .LED_Drive(LED_Drive)); 

    //Instantiate the FIR_Filter Module for RED_ADC_Value 
	FIR_Filter red( .CLK_Filter(CLK_Filter), 
                    .input_data(RED_ADC_Value),
                    .rst_n(rst_n),  
                    .output_data(Out_RED_Filtered));

    //Instantiate the FIR_Filter Module for IR_ADC_Value 
	FIR_Filter ir(  .CLK_Filter(CLK_Filter), 
                    .input_data(IR_ADC_Value),
                    .rst_n(rst_n),  
                    .output_data(Out_IR_Filtered));

endmodule
