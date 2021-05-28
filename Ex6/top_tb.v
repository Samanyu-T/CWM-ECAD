//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps
//I am not sure why but the RGB signal is delayed by 1 clock cycle relative to the colour signal
module top_tb(
    );
    
//Todo: Parameters
parameter clk_time = 10; //set the clock period

//Todo: Registers and wires
  reg [2:0] colour;
  reg clk;
  reg enable;
  reg [3:0] cycle_count;
  wire [23:0] rgb;
  
//Todo: Clock generation
initial 
begin 
 clk = 1'b0;
 cycle_count = 4'h0;
 #5
 forever
   begin
   #(clk_time/2) clk=~clk;

   end
end
  
//Intialise the value of colour and check the output rgb value
initial
 begin 
 colour = 3'b000;
 enable = 1'b1;
 #(clk_time)

 forever
	begin
	#(clk_time)
//Finish the program if the cycle count exceed the limit
	if (cycle_count == 4'hF)
		$finish;
//Switch enable off at a given point to check if it works
	else if (cycle_count == 4'hD)
		enable = 1'b0;
	//Increase the colour by 1 each time to test each case
	if (colour < 3'b111)
		 colour = colour + 3'b001;
	else
		colour = 3'b000;
	$display("cycle %d, colour %b, rgb %h",cycle_count, colour,rgb);
        //Increment the counter every clock cycle
   	cycle_count = cycle_count + 4'h1;
	end

   end
 Colour_Converter top(.colour(colour), .clk(clk), .enable(enable), .rgb(rgb));
endmodule
