//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter clk_time = 10; //set the clock period

//Todo: Registers and wires
  reg [4:0]temperature;
  reg clk;
  reg initial_cooling; 
  reg initial_heating;
  
  //Intialise the clock signal
 initial 
  begin 
   clk=0;
   forever
   begin
     #(clk_time/2) clk=~clk;
   end
  end
  
  //Apply a given set of initial conditions
  initial 
      begin
         initial_cooling = 1'b0;
         initial_heating = 1'b0;
         temperature = 5'd21;
	#50;
      end 
// Check whether the solution is correct with the given initial conditions
   initial
	  begin
		$display("Heating %d, Cooling %d", heating, cooling);
	  end
    tempmonitor top(.clk(clk), .temperature(temperature), .heating(heating), .cooling(cooling),
		.initial_heating(initial_heating), .initial_cooling(initial_cooling) );
endmodule
                   
      
  
