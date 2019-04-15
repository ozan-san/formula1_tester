`timescale 1ns / 1ps
/* Author: Ozan San
	Date: 15.4.2019
*/
module testbench_formula1;

	// Inputs
	reg [3:0] number;
	reg CLK;
	reg selection;
	reg mode;
	reg clear;
	wire [7:0] digit1;
	wire [7:0] digit0;
	wire [7:0] count1;
	wire [7:0] count0;
	wire warning;

	// TestCount variables
	integer ozanTests;

	// Instantiate the Unit Under Test (UUT)
	lab3_2 uut (
		.number(number), 
		.CLK(CLK), 
		.selection(selection), 
		.mode(mode), 
		.clear(clear), 
		.digit1(digit1), 
		.digit0(digit0), 
		.count1(count1),
		.count0(count0),
		.warning(warning)
	);
    // At 3, 9, 15, Clock RISES 
    // At 6, 12, 18, .. Clock FALLS
   initial CLK = 0;
	always #3 CLK = ~CLK;
    
	initial begin
		$monitor("TIME=%t | N=%d CLR=%b MODE=%b SEL=%b | D1=%d D0=%d C1=%d C0=%d WARNING=%b",
					 $time,   number,clear,mode,selection, digit1, digit0, count1, count0, warning);
		// Initialize Inputs
		number = 4'b1011;
		clear = 1'b0;
		mode = 1'b0;
		selection = 1'b0;
		// Initialize testCount variables:
		ozanTests = 0;
		
		// Wait 4 ns for first rising clk
		#4; //t = 4
        
		
		//Test1: Initial
		if ((count1 == 8'd0) && 
			 (count0 == 8'd1) &&
			 (digit1 == 8'd7) &&
			 (digit0 == 8'hB) &&
			 (warning == 1'b0)) begin $display("Test1: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test1 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b0111; clear=1'b0; mode=1'b1; selection=1'b0; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd1) && 
			 (count0 == 8'd1) &&
			 (digit1 == 8'hB) &&
			 (digit0 == 8'h7) &&
			 (warning == 1'b0)) begin $display("Test2: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test2 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b0111; clear=1'b0; mode=1'b1; selection=1'b1; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd1) && 
			 (count0 == 8'd1) &&
			 (digit1 == 8'hB) &&
			 (digit0 == 8'h7) &&
			 (warning == 1'b1)) begin $display("Test3: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test3 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b0110; clear=1'b0; mode=1'b1; selection=1'b1; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd1) && 
			 (count0 == 8'd0) &&
			 (digit1 == 8'hC) &&
			 (digit0 == 8'h6) &&
			 (warning == 1'b0)) begin $display("Test4: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test4 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b0101; clear=1'b0; mode=1'b0; selection=1'b0; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd1) && 
			 (count0 == 8'd2) &&
			 (digit1 == 8'h3) &&
			 (digit0 == 8'h5) &&
			 (warning == 1'b0)) begin $display("Test5: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test5 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b1111; clear=1'b1; mode=1'b1; selection=1'b1; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd0) && 
			 (count0 == 8'd0) &&
			 (digit1 == 8'h0) &&
			 (digit0 == 8'h0) &&
			 (warning == 1'b0)) begin $display("Test6: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test6 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b1011; clear=1'b0; mode=1'b0; selection=1'b0; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd0) && 
			 (count0 == 8'd1) &&
			 (digit1 == 8'd7) &&
			 (digit0 == 8'hB) &&
			 (warning == 1'b0)) begin $display("Test7: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test7 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b0111; clear=1'b0; mode=1'b1; selection=1'b0; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd1) && 
			 (count0 == 8'd1) &&
			 (digit1 == 8'hB) &&
			 (digit0 == 8'h7) &&
			 (warning == 1'b0)) begin $display("Test8: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test8 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b1111; clear=1'b1; mode=1'b1; selection=1'b1; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd0) && 
			 (count0 == 8'd0) &&
			 (digit1 == 8'h0) &&
			 (digit0 == 8'h0) &&
			 (warning == 1'b0)) begin $display("Test9: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test9 failed.");
		#3;
		number = 4'b1011;
		clear = 1'b0;
		mode = 1'b0;
		selection = 1'b0;
		#3;
		
		if ((count1 == 8'd0) && 
			 (count0 == 8'd1) &&
			 (digit1 == 8'd7) &&
			 (digit0 == 8'hB) &&
			 (warning == 1'b0)) begin $display("Test10: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test10 failed.");
		#3; // Wait for low clock to change inputs.
		number = 4'b0110; clear=1'b0; mode=1'b1; selection=1'b1; // Change 1 -> Test 2
		#3; // Wait for clk rise to check inputs.
		
		if ((count1 == 8'd1) && 
			 (count0 == 8'd0) &&
			 (digit1 == 8'hC) &&
			 (digit0 == 8'h6) &&
			 (warning == 1'b0)) begin $display("Test11: Passed"); ozanTests = ozanTests + 1; end
		else $display("Test11 failed.");
		#3;
		
		$display("Ozan's test results: %d / 11", ozanTests);
		
		/* ADD ADDITIONAL TEST CASES HERE */
		
        
		/* ADDITIONAL TEST CASES END */
		$finish;
	end
      
endmodule
