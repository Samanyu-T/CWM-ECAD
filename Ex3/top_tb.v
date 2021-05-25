//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter clk_time = 10; //set the clock period

//Todo: Registers and wires
reg clk, rst, change, on_off, cycle_count ;

//Todo: Clock generation
initial begin 
 clk=0;
 forever
 #(clk_time/2) clk=~clk;

end

//Todo: User logic
initial begin
 assign change = 1; 
 assign rst = 0;
 assign on_off = 1;

forever
//Increment the counter every clock cycle
 cycle_count <= cycle_count + 1;
// increment up to 127 and then back down to 111
 if (cycle_count == 8'h7F)
	assign on_off = ~on_off;
//Now apply a reset
 else if (cycle_count == 8'h8F)
	assign rst <=1;
//Now count backwards from zero to test the looping
 else if (cycle_count == 8'h9F)
	assign rst <= 0
	assign on_off <= 0;
//Now test if the value can remain constant
 else if (cycle_count == 8'hAF)
	assign change <= 0

end

//Todo: Finish test, check for success
initial begin
//Check the final Value should be a value slightly less than FF
 if (cycle_count == 8'hFF) 
	$display("End Result = %d",counter_out);
	$finish;
//Check the intermediary value 1 should be 112
 else if (cycle_count == 8'h8E)
	$display("Intermediary value 1 = %d",counter_out);
//Check the intermediary value 2 should be 0
 else if (cycle_count == 8'h9E)
	$display("Intermediary value 2 = %d",counter_out);

end

//Todo: Instantiate counter module
monitor top(.clk(clk), .rst(rst), .change(change), .on_off(on_off),.counter_out(counter_out));
endmodule 
