//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Jai Ganesha
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
  reg clk, temperature[4:0], cycle_count;
  
  //Intialise the clock signal
 initial begin 
   clk=0;
   cycle_count = 0;
   forever
   begin
     #(clk_time/2) clk=~clk;
    //Increment the counter every clock cycle
     cycle_count = cycle_count + 1;
   end
  end
  
  //Apply a forever to evaluate all the different possibilities
  forever 
    //If there clock count is 4 exit the program
    begin 
      if (cycle_count == 3'd4)
        $finish;
      //The case where the temperature is too cold expect a heating
      else if (cycle_count == 3'd1)
        begin
          temperature = 5'd16;
          $display("Heating %d and Cooling %d,heating,cooling)
        end
       //The case where the temperature is within accepted range so expect zeros
      else if (cycle_count == 3'd2)
        begin
          temperature = 5'd21;
          $display("Heating %d and Cooling %d,heating,cooling)
        end
      //The case where the temperature is too hot so expect cooling
      else if (cycle_count == 3'd3)
        begin
          temperature == 5'd24;
          $display("Heating %d and Cooling %d,heating,cooling)
        end
     end 
                   

  monitor top(.clk(clk), .temperature(temperature), .heating(heating),.cooling(cooling));
endmodule
                   
      
  
  
  
