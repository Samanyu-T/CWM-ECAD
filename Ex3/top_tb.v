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
reg clk;
reg rst;
reg change;
reg on_off;
reg [3:0] cycle_count;
wire [7:0] counter_out ;

//Todo: Clock generation
initial begin 
 clk=0;
 #(clk_time/2)
 forever
 begin
 #(clk_time/2) clk=~clk;
 end
end

//Todo: User logic
initial begin
 $display("Test Start"); 
 cycle_count = 4'h0;
 change = 1'b1; 
 rst = 1'b0;
 on_off = 1'b1;


forever
	begin
	#(clk_time)
	//Display the values of the counter to check if they match with expectation
	$display("cycle_count %d and counter %d",cycle_count, counter_out);
//Change the inputs to check if they work as intended
	if (cycle_count == 4'h5)
		 on_off = ~on_off;
	//Now apply a reset
	 else if (cycle_count == 4'h8)
		 rst = 1;
	//Now count backwards from zero to test the looping
	 else if (cycle_count == 4'hB)
		begin
		 rst = 1'b0;
		 on_off = 1'b0;
		end
	//Now test if the value can remain constant
	 else if (cycle_count == 4'hD)
		 change = 1'b0;
	else if (cycle_count == 4'hF)
		$finish;
	
	//Increment the counter every clock cycle
 	cycle_count = cycle_count + 4'h1;
	end
end


//Todo: Instantiate counter module
monitor top(.clk(clk), .rst(rst), .change(change), .on_off(on_off),.counter_out(counter_out));
endmodule 
