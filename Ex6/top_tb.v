//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter clk_time = 10; //set the clock period

//Todo: Registers and wires
  reg [2:0] colour;
  reg clk;
  reg enable;
  reg [3:0] cycle_count;
  
//Todo: Clock generation
initial 
begin 
 clk = 1'b0;
 cycle_count = 4'h0;

 forever
   begin
   #(clk_time/2) clk=~clk;
  //Increment the counter every clock cycle
   cycle_count = cycle_count + 2'b1;
   end
end
  
//Intialise the value of colour and check the output rgb value
initial
 begin
 colour = 3'b000;
 enable = 1'b1;
 $display("Test colour %d",colour); 

 forever
	begin
#clk_time
//Finish the program if the cycle count exceed the limit
	if (cycle_count == 4'hF)
		$finish;
//Switch enable off at a given point to check if it works
	else if (cycle_count == 4'hD)
		enable = 1'b0;
	if (enable == 1'b1)
		begin
		if ((rgb == 8'h000000) && (colour == 3'b000))
			
			$display("Test Passed");

		else if ((rgb == 8'h0000FF) && (colour == 3'b100))
			$display("Test Passed");
		else if ((rgb == 8'h00FF00) && (colour == 3'b010))
			$display("Test Passed");
		else if ((rgb == 8'h00FFFF) && (colour == 3'b011))
			$display("Test Passed");
		else if ((colour == 3'b100)&&(rgb == 8'hFF0000))
			$display("Test Passed");
		else if ( (colour == 3'b101) && (rgb == 8'hFF00FF))
			$display("Test Passed");
		else if ( (colour == 3'b110) && (rgb == 8'hFFFF00))
			$display("Test Passed");
		else if ( (colour == 3'b111) && (rgb == 8'hFFFFFF))
			$display("Test Passed");
	//Increase the colour by 1 each time to test each case
		colour = colour + 1'b1;
		$display("RGB is %h",rgb);

		end	
	end

   end
 Colour_Converter top(.colour(colour), .clk(clk), .enable(enable), .rgb(rgb));
endmodule
