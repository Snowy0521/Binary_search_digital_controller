/**
This module is FIR Filter, that can remove high frequency noise in system
**/
module FIR_Filter(
    input wire CLK_Filter,          // Clock for the filter
    input wire [7:0] input_data,    // Input data from ADC (0 to 255)
    input wire rst_n,               // Reset signal (active-low)
    output reg [19:0] output_data   // Filtered output (20-bit)
);

parameter NUM_SHI_REGS = 22;	// Number of shift registers that as buffer
parameter NUM_ADD_REGS = 11;    // Number of add registers 

reg     [7:0]   shift_regs   [NUM_SHI_REGS-1:0];  // 22 shift registers as buffer to store input data	
reg     [8:0]   add_regs     [NUM_ADD_REGS-1:0];  // to store the summed data of first and last shift register
// Each order multiplies with the according coefficient
reg 	[16:0]  order[NUM_ADD_REGS-1:0];  
wire    [7:0]   COEFFICIENTS [NUM_ADD_REGS-1:0];  // to store FIR Filter coefficients value 

// 11 FIR filter coefficients
// Only 11 multipliers needed because of the symmetry of FIR filter coefficients
assign COEFFICIENTS[0]  =    8'd2;
assign COEFFICIENTS[1]  =    8'd10;
assign COEFFICIENTS[2]  =    8'd16;
assign COEFFICIENTS[3]  =    8'd28;
assign COEFFICIENTS[4]  =    8'd43;
assign COEFFICIENTS[5]  =    8'd60;
assign COEFFICIENTS[6]  =    8'd78;
assign COEFFICIENTS[7]  =    8'd95;
assign COEFFICIENTS[8]  =    8'd111;
assign COEFFICIENTS[9]  =    8'd122;
assign COEFFICIENTS[10] =    8'd128;



always @(posedge CLK_Filter or negedge rst_n) begin
    if (!rst_n) begin
        // reset the value in all registers to 0
        shift_regs[0]  <= 8'b0;
        shift_regs[1]  <= 8'b0;
        shift_regs[2]  <= 8'b0;
        shift_regs[3]  <= 8'b0;
        shift_regs[4]  <= 8'b0;
        shift_regs[5]  <= 8'b0;
        shift_regs[6]  <= 8'b0;
        shift_regs[7]  <= 8'b0;
        shift_regs[8]  <= 8'b0;
        shift_regs[9]  <= 8'b0;
        shift_regs[10] <= 8'b0;
        shift_regs[11] <= 8'b0;
        shift_regs[12] <= 8'b0;
        shift_regs[13] <= 8'b0;
        shift_regs[14] <= 8'b0;
        shift_regs[15] <= 8'b0;
        shift_regs[16] <= 8'b0;
        shift_regs[17] <= 8'b0;
        shift_regs[18] <= 8'b0;
        shift_regs[19] <= 8'b0;
        shift_regs[20] <= 8'b0;
        shift_regs[21] <= 8'b0;

        add_regs[0]  <= 9'b0;
        add_regs[1]  <= 9'b0;
        add_regs[2]  <= 9'b0;
        add_regs[3]  <= 9'b0;
        add_regs[4]  <= 9'b0;
        add_regs[5]  <= 9'b0;
        add_regs[6]  <= 9'b0;
        add_regs[7]  <= 9'b0;
        add_regs[8]  <= 9'b0;
        add_regs[9]  <= 9'b0;
        add_regs[10] <= 9'b0;

        order[0]  <= 17'b0;
        order[1]  <= 17'b0;
        order[2]  <= 17'b0;
        order[3]  <= 17'b0;
        order[4]  <= 17'b0;
        order[5]  <= 17'b0;
        order[6]  <= 17'b0;
        order[7]  <= 17'b0;
        order[8]  <= 17'b0;
        order[9]  <= 17'b0;
        order[10] <= 17'b0;

        output_data <= 20'd0;
	
    end else begin
        // all shift registers to store input data
        shift_regs[0]  <= input_data;
        shift_regs[1]  <= shift_regs[0];
        shift_regs[2]  <= shift_regs[1];
        shift_regs[3]  <= shift_regs[2];
        shift_regs[4]  <= shift_regs[3];
        shift_regs[5]  <= shift_regs[4];
        shift_regs[6]  <= shift_regs[5];
        shift_regs[7]  <= shift_regs[6];
        shift_regs[8]  <= shift_regs[7];
        shift_regs[9]  <= shift_regs[8];
        shift_regs[10] <= shift_regs[9];
        shift_regs[11] <= shift_regs[10];
        shift_regs[12] <= shift_regs[11];
        shift_regs[13] <= shift_regs[12];
        shift_regs[14] <= shift_regs[13];
        shift_regs[15] <= shift_regs[14];
        shift_regs[16] <= shift_regs[15];
        shift_regs[17] <= shift_regs[16];
        shift_regs[18] <= shift_regs[17];
        shift_regs[19] <= shift_regs[18];
        shift_regs[20] <= shift_regs[19];
        shift_regs[21] <= shift_regs[20];
    
        // register data are summed first and last
        add_regs[0]     <= shift_regs[0] + shift_regs[21];
        add_regs[1]     <= shift_regs[1] + shift_regs[20];
        add_regs[2]     <= shift_regs[2] + shift_regs[19];
        add_regs[3]     <= shift_regs[3] + shift_regs[18];
        add_regs[4]     <= shift_regs[4] + shift_regs[17];
        add_regs[5]     <= shift_regs[5] + shift_regs[16];
        add_regs[6]     <= shift_regs[6] + shift_regs[15];
        add_regs[7]     <= shift_regs[7] + shift_regs[14];
        add_regs[8]     <= shift_regs[8] + shift_regs[13];
        add_regs[9]     <= shift_regs[9] + shift_regs[12];
        add_regs[10]    <= shift_regs[10] + shift_regs[11];
        
        // Each order multiplies with the according coefficient
        order[0]    <= COEFFICIENTS[0] * add_regs[0];
        order[1]    <= COEFFICIENTS[1] * add_regs[1];
        order[2]    <= COEFFICIENTS[2] * add_regs[2];
        order[3]    <= COEFFICIENTS[3] * add_regs[3];
        order[4]    <= COEFFICIENTS[4] * add_regs[4];
        order[5]    <= COEFFICIENTS[5] * add_regs[5];
        order[6]    <= COEFFICIENTS[6] * add_regs[6];
        order[7]    <= COEFFICIENTS[7] * add_regs[7];
        order[8]    <= COEFFICIENTS[8] * add_regs[8];
        order[9]    <= COEFFICIENTS[9] * add_regs[9];
        order[10]   <= COEFFICIENTS[10] * add_regs[10];
    
        // output 
	    output_data <=   order[0] + order[1] + order[2] + order[3] 
                       + order[4] + order[5] + order[6] + order[7] 
                       + order[8] + order[9] + order[10];
    end
end
endmodule
