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
  wire heating;
  wire cooling;
  //Intialise the clock signal
 initial 
  begin 

   clk=1;

   forever
   begin
     #(clk_time/2) clk=~clk;
   end
  end
  
  //Apply a given set of initial conditions - change these conditions to check if the system works
  initial 
      begin

         initial_cooling = 1'b0;
         initial_heating = 1'b0;
         temperature = 5'd14m;

    	 
// Check whether the solution is correct with the given initial conditions
	 #(clk_time) $display("Heating %d, Cooling %d, Temperature %d", heating, cooling, temperature);
      end 
      tempmonitor top(.clk(clk), .temperature(temperature), .heating(heating), .cooling(cooling),
			 .initial_heating(initial_heating), .initial_cooling(initial_cooling) );
endmodule
                   
      
  
