`timescale 1ms/1us
/**
This Controller Testbench is used to simulate our Controller in ModelSim.
**/
module Controller_TB ();
	wire [0:6]  DC_Comp; //DC_Comp used set DC Level of Offset
	wire [0:6]  DC_Comp1;
	wire [0:3]  PGA_Gain; //Used to set the Gain Level of the programmable gain amplifier (PGA)
	wire [0:3]  PGA_Gain1;
	wire [0:3]  LED_Drive, LED_Drive1; //Sets the LED brightness
	wire [0:7]  Vppg, Vppg1; //Binary output Signal of the ADC
	wire [7:0]  IR_ADC_Value, RED_ADC_Value; //Bit stream of the Controller Output
	reg         Find_Setting, rst_n,CLK; //Asynchronous reset and start signal to find dc and pga settings

	wire LED_RED, LED_IR; //Controlls the LED
	wire LED_RED1, LED_IR1;
	
	//Instantiate Fingerclip_Model which simulates the Analog Frontend and 8-bit Verilog-A-ADC
	Fingerclip_Model fc(.Vppg(Vppg), 
						.DC_Comp(DC_Comp), 
						.PGA_Gain(PGA_Gain), 
						.LED_RED(LED_RED), 
						.LED_IR(LED_IR));
	
	//Instantiate Controller Model 
	Controller ct(.Vppg(Vppg1), 
				  .Find_Setting(Find_Setting), 
				  .CLK(CLK), 
				  .rst_n(rst_n), 
				  .DC_Comp(DC_Comp1), 
				  .PGA_Gain(PGA_Gain1), 
				  .LED_IR(LED_IR1), 
				  .LED_RED(LED_RED1), 
	              .IR_ADC_Value(IR_ADC_Value), 
				  .RED_ADC_Value(RED_ADC_Value), 
				  .LED_Drive(LED_Drive1)); 


	initial begin
        CLK=0;
		Find_Setting =1;
		#10000000 $stop;
	end
	
	//Create Clock
	always #0.5 CLK = !CLK;

    assign Vppg1    = Vppg;
    assign DC_Comp  = DC_Comp1;
    assign PGA_Gain = PGA_Gain1;
    assign LED_RED  = LED_RED1;
    assign LED_IR   = LED_IR1;

endmodule
