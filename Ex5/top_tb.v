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
  reg clk, temperature[4:0];
  reg initial_cooling, initial_heating;
  
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
         initial_cooling = 1;
         initial_heating = 0;
         temperature = 5'd21;
	#50;
      end 
  initial
	  begin
	  if ((heating == 0) && (cooling == 1))
		  $display("Test Passed");
	  end
   
    tempmonitor top(.clk(clk), .temperature(temperature), .heating(heating), .cooling(cooling),
		.initial_heating(initial_heating), .initial_cooling(initial_cooling) );
endmodule
                   
      
  
