module Controller(Vppg, Find_Setting, CLK, rst_n, DC_Comp, PGA_Gain, CLK_Filter, LED_IR, LED_RED, IR_ADC_Value, RED_ADC_Value, LED_Drive);

input 		CLK;							//The clock signal
input 		rst_n;							//An asychronous positive edge reset signal
input 		Find_Setting;					//Reset to start find Settings 
input[7:0] 	Vppg;							//Binary output Signal of the ADC

output reg 			LED_IR;					//Controlls Infrared LED
output reg 			LED_RED;				//Controlls RED LED
output reg			CLK_Filter;				//Sets the sampling frequency of 500 Hz for the Filters
output reg  [3:0] 	LED_Drive;				//Sets the LED brightness
output reg  [3:0] 	PGA_Gain;				//Used to increase the Gain
output reg  [6:0] 	DC_Comp;				//Used to change the DC_Offset
output reg  [7:0]   IR_ADC_Value;			//Bit stream of the Infrared LED is sent to the Filter
output reg  [7:0]   RED_ADC_Value;			//Bit stream of the RED LED is sent to the Filter

//Parameter needed to determine Maximum and Minimum Index for each cycle
parameter 		 MAX_RAND_VOLTAGE = 250;
parameter 		 MIN_RAND_VOLTAGE = 5;
parameter		 MITTEL_VOLTAGE   = 127;

// State encodings in regular encoding
localparam[2:0]  INITIAL 			    = 3'b001; //1
localparam[2:0]  IDLE         		    = 3'b010; //2
localparam[2:0]  FIND_SETTING			= 3'b000;
localparam[2:0]  SWEEP_DC_COMP  		= 3'b011; //3
localparam[2:0]  INCREASE_PGA_GAIN      = 3'b100; //4
localparam[2:0]  OSCILLATE   	     	= 3'b101; //5
localparam[2:0]  FIRST_DC_COMP   		= 3'b110; //6



reg [9:0]  	counter;						//counter runs every cycle and after waiting for 1 second reset it.
reg [3:0] 	gaintemp;						
reg [3:0] 	PGA_Gain_IR;					//Sets the Gain when Infrared LED is used
reg [3:0] 	PGA_Gain_RED;					//Sets the Gain when Red LED is used
reg [2:0]   currentState, nextState;		//To control State Machine
reg [7:0]   DC_left, DC_right, DC_Comp_temp; //Used in Binary Search to determine DC_Comp
reg [6:0]   DC_Comp_IR;						//DC_Comp Settings saved in Register for Infrared LED
reg [6:0]   DC_Comp_RED; 				    //DC_Comp Settings saved in Register for Red LED
reg [1:0]	red_on_flag; 					// scan min max index //if else case to save this register
reg [9:0]   min_index;						// the point that reaches the min value
reg [9:0]   max_index;						// the point that reaches the max value
reg [7:0]  	temp_min;						// temp to find min_value
reg [7:0]  	temp_max;						// temp to find max_value
reg [3:0]   gaintemp_max;
reg [3:0]   gaintemp_min;
reg 		start;


//Create synchronous clock with asynchronous reset.
always@(posedge CLK or negedge rst_n) begin
	if(~rst_n)begin
		currentState  <= INITIAL;	
	end
    else begin 
		currentState  <= nextState;
	end
end

//State Machine with initial State INITIAL
always@(posedge CLK) begin
	if(counter == 999) begin
			counter <= 0;
		end
		else if(counter >= 0) begin
		counter <= counter + 1;
	//	$display("counter %d", counter);
		end
	 case(currentState)
		INITIAL: begin //Here we set our initial settings once the asynchronous reset is logically low.
			nextState          <= FIND_SETTING;
			counter		       <= 4'd0;
			PGA_Gain_RED 	   <= 0;
			PGA_Gain_IR		   <= 0;
			DC_Comp_temp	   <= 0;
			DC_Comp_IR 	       <= 0;
			DC_Comp_RED        <= 0; 
			red_on_flag        <= 1; // scan min max index 
			temp_min		   <= 255;
			temp_max           <= 0;
			min_index		   <= 0;
			max_index 		   <= 0;
			LED_IR			   <= 0;
			LED_RED			   <= 1;
			PGA_Gain		   <= 4'd0;
			gaintemp  		   <= 15;
			LED_Drive 	       <= 8;
			CLK_Filter         <= 0;
			gaintemp_max       <= 0;
			gaintemp_min       <= 0;
			start <= 0;
		end

		FIND_SETTING: begin //Once Find_Setting signal arrives we start to find setttings for RED LED and IR LED.
		if(Find_Setting) begin
			nextState <= IDLE;
			end
		end
		IDLE: begin //Here we start to initialize Settings for our first DC_Sweep using binary search.
			// reset 
			DC_left	  <= 0;
			DC_right  <= MITTEL_VOLTAGE; 
            case(red_on_flag)  //Here we check whether we have do DC_Sweep with RED LED or IR LED.
                0: begin  //Here we do 1 LED_IR DC_Sweep in order to get a waveform so we can determine min and max index of a wave.
					nextState <= FIRST_DC_COMP;
		   		    LED_IR    <= 1;
		            LED_RED   <= 0;
                    DC_Comp   <= 0;
					temp_min  <= 255;
					temp_max  <= 0;
				end
				1: begin  //Here we do 1  DC_Sweep for LED_RED in order to get a waveform so we can determine min and max index of a wave.
					nextState <= FIRST_DC_COMP;
		   			LED_IR    <= 0;
		   		    LED_RED   <= 1;
                    DC_Comp   <= 0; 	
					temp_min  <= 255;
					temp_max  <= 0;
				end 
				2: begin  //In previous states we have calculated min and max index and here we do multiple DC_Comp changes around the median value until it matches 0.9 Voltage.
	
					if (Vppg < temp_min && LED_RED == 1) begin
		 				temp_min  <= Vppg;
		 				min_index <= counter; //index_counter
		 				nextState <= IDLE;
					end
					if (Vppg > temp_max && LED_RED == 1) begin
		 				temp_max  <= Vppg;
		 				max_index <= counter; //index_counter
						nextState <= IDLE;
					end

				//	counter <= counter + 1; //index_counter
					if (counter == 999 && LED_RED == 1)begin //index_counter
				//		counter <= 0; //index_counter
						nextState <= SWEEP_DC_COMP; // set led red on 
					end	
					if(LED_IR == 1) begin
						nextState <= SWEEP_DC_COMP;
					end				    
				end
			   
                default:;
            endcase
		end 


		FIRST_DC_COMP:begin	//Here we do 1  DC_Sweep for LED_RED in order to get a waveform so we can determine min and max index of a wave. In this case we use binary search.
			if ((DC_right - DC_left) > 1)begin 
				if(Vppg < MITTEL_VOLTAGE)begin
					DC_right 	    <= 	DC_Comp;
					DC_Comp_temp	<=  DC_Comp + DC_left;
					DC_Comp  		<=  DC_Comp_temp >>1;
				end else if(Vppg > MITTEL_VOLTAGE)begin
					DC_left 	    <=	DC_Comp;
					DC_Comp_temp 	<=  DC_Comp + DC_right;
					DC_Comp 	    <=  DC_Comp_temp >> 1;
				end else begin
					DC_left			<=	DC_Comp;
					DC_right		<=	DC_Comp;
				end	
			end else begin
				red_on_flag     	<=	 2;
				nextState			<= 	IDLE;					
			end
	    end

		SWEEP_DC_COMP: begin  //In previous states we have calculated min and max index and here we do multiple DC_Comp changes around the median value until it matches 0.9 Voltage. Here we use binary_search.
			//	counter <= counter + 1;
				if (counter < (((min_index +max_index) >> 1) + 7) && counter >= (((min_index + max_index) >> 1) - 7))begin 
					if(Vppg < MITTEL_VOLTAGE)begin
						DC_right 	    <= 	DC_Comp;
						DC_Comp_temp	<=  DC_Comp + DC_left;
						DC_Comp  		<=  DC_Comp_temp >>1;
 						
					end else if(Vppg > MITTEL_VOLTAGE)begin
						DC_left 	    <=	DC_Comp;
						DC_Comp_temp    <=  DC_Comp + DC_right;
						DC_Comp 	    <=  DC_Comp_temp >> 1;
						
					end else begin
						DC_left			<=	DC_Comp;
						DC_right		<=	DC_Comp;
						nextState 		<= INCREASE_PGA_GAIN;
					end	
				end else if (counter >= (((min_index +max_index) >> 1) + 7)) begin 
				//	counter  		<= 0;
					nextState	    <= INCREASE_PGA_GAIN;
				end         
		end
	

		INCREASE_PGA_GAIN: begin //In this state we increase the PGA_Gain before it starts to clip.
			if((counter >= max_index) && counter <= (max_index + 4'd15)) begin //Here we start increasing the PGA_Gain at the maximum index and it will increase until it starts to clip.
				if(Vppg < MAX_RAND_VOLTAGE) begin

					PGA_Gain <= PGA_Gain + 4'd1;
				end
				else begin
					gaintemp_max <= PGA_Gain;  //Once it would start to clip the PGA_Gain will be saved in a register.
				end
				if(counter == (max_index + 4'd15)) begin  //Here we make sure to store the biggest PGA_Gain value and reset the PGA_Gain value once we go through all 15 PGA_Gains
					PGA_Gain <= 4'd0;
					start <= 1;
				end
			end
			if(start) begin
				start <= 0;
				if(2000 < gaintemp_max) begin
					red_on_flag    <= 0 ;
					counter    	   <= 0; //reset

					if(LED_IR) begin					// store actual DC_Comp setting of LED IR in register DC_Comp_IR
						DC_Comp_IR    <= DC_Comp;		//store the PGA_Gain setting of LED IR in register PGA_Gain_IR
						PGA_Gain_IR   <= gaintemp_min; 	//start switching between LED RED UND LED IR with a frequency of 100 Hz
						nextState     <= OSCILLATE;
						PGA_Gain      <= 4'd0; //reset
						gaintemp      <= 15;
						gaintemp_max  <= 0;
						gaintemp_min  <= 0;
					end

					if(LED_RED) begin
						DC_Comp_RED   <= DC_Comp;		// store actual DC_Comp setting of LED RED in register DC_Comp_RED
						PGA_Gain_RED  <= gaintemp_min;  //store the PGA_Gain setting of LED RED in register PGA_Gain_RED
						nextState  	  <= IDLE; 			//We have to start with LED_RED and switch to LED IR
						PGA_Gain   	  <= 4'd0; 			//reset of PGA_Gain
						gaintemp      <= 15;
						gaintemp_max  <= 0;
						gaintemp_min  <= 0;
						LED_RED	      <= 0;
						LED_IR	      <= 1;
					end
				
				end
				else begin	
					red_on_flag 	  <= 0 ;
					counter    	      <= 0; //reset

					if(LED_IR) begin
						DC_Comp_IR    <= DC_Comp;		    // store actual DC_Comp setting of LED IR in register DC_Comp_IR
						PGA_Gain_IR   <= gaintemp_max; 		//store the PGA_Gain setting of LED IR in register PGA_Gain_IR 
						nextState     <= OSCILLATE;			//start switching between LED RED UND LED IR with a frequency of 100 Hz
						PGA_Gain      <= 4'd0; //reset
						gaintemp      <= 15;
						gaintemp_max  <= 0;
						gaintemp_min  <= 0;
						LED_RED	      <= 1;
						LED_IR	      <= 0;
					end

					if(LED_RED) begin
						DC_Comp_RED   <= DC_Comp;			// store actual DC_Comp setting of LED RED in register DC_Comp_RED
						PGA_Gain_RED  <= gaintemp_max;		//store the PGA_Gain setting of LED RED in register PGA_Gain_RED
						nextState     <= IDLE; 				//We have to start with LED_RED and switch to LED IR
						PGA_Gain      <= 4'd0; 				//reset of PGA_Gain
						gaintemp      <= 15;
						gaintemp_max  <= 0;
						gaintemp_min  <= 0;
						LED_RED	  	  <= 0;
						LED_IR	      <= 1;
					end
				end
			end
		end 
		OSCILLATE: begin //Here we switch between LED RED AND LED IR  with a frequency of 100 Hz once we found the settings
			CLK_Filter <=~CLK_Filter; //Create Clock for FIR_Fitler
			if(counter == 9) begin	 //We count up to 10 to create periods of 10 ms
				LED_RED <= ~LED_RED; 
				LED_IR  <= ~LED_IR;
				counter <= 0; //reset
				// set dc and pga parameter for next LED RED
				if(LED_IR) begin
					DC_Comp  	  <= DC_Comp_RED;
					PGA_Gain 	  <= PGA_Gain_RED;
					IR_ADC_Value  <= Vppg; //output
				end

				// set dc and pga parameter for next LED IR
				if(LED_RED) begin
					DC_Comp 	  <= DC_Comp_IR;
					PGA_Gain 	  <= PGA_Gain_IR;
					RED_ADC_Value <= Vppg; //output
				end

			end	
		end
		default: nextState <= IDLE;
	endcase
end

endmodule