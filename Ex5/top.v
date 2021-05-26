//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module tempmonitor (
    //Todo: add ports 
  input clk,temperature[4:0],
	output heating, cooling
    );
  wire heating;
  wire cooling;
  //apply the conditions to determine whether cooling or heating is required
  always @(posedge clk) 
    begin 
      //if too cold apply heating
      if (temperature <= 5'd18)
        begin
          assign heating = 1;
          assign cooling = 0;
        end
      // if too hot apply cooling
      else if (temperature >= 5'd22)
        begin
          assign heating = 0;
          assign cooling = 1;
        end
      // if neither do nothing
      else
        begin 
          assign heating = 0;
          assign cooling = 0;
        end 
    end
endmodule 
