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
    wires initial_cooling, initial_heating
  
  //Intialise the clock signal
 initial begin 
   clk=0;
   cycle_count = 0;
   forever
   begin
     #(clk_time/2) clk=~clk;
   end
  end
  
  //Apply a given set of initial conditions
  initial 
      begin
        assign initial_cooling = 1;
        assign initial_heating = 0;
        assign temperature = 5'd21;
      end 
  initial
      $display("The temperature is %d and the heating is %d and the cooling is %d",temperature,heating,cooling);
   
    monitor top(.clk(clk), .temperature(temperature), .heating(heating),.cooling(cooling),.initiail_heating(initial_heating), .intial_cooling(initial_cooling));
endmodule
                   
      
  
  
  
