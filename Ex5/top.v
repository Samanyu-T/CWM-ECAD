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
 initial
    begin 
      assign heating = initial_heating;
      assign cooling = initial_cooling;
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
      // if temperature in the ideal state 
      else if ((temperature <= 5'd22) && (temperature >= 5'd18))
        begin 
		// If heating is already on and the temperature is on the low side keep it on
		if ((heating) && (temperature < 5'd20))
			begin
			  heating = 1;
		          cooling = 0
			end
		// If cooling is already and the temperature is on the high side keep it on
		else if ( (cooling) && (temperature > 5'd20) )
			begin
		          heating = 0;
			  cooling = 1;
			end
		else
	        // If it is in ideal temp and one of the other states turn off heating and cooling
	           begin
		          heating = 0;
			  cooling = 0;
	           end
	end
	    

    end
endmodule 
