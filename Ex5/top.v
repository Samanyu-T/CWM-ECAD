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


module tempmonitor (
    //Todo: add ports 
        input [4:0] temperature,
        input clk,
        input initial_heating,
        input initial_cooling,
	
	output reg heating,
        output reg cooling
    );

  //apply the conditions to determine whether cooling or heating is required
	always @(posedge clk)
    begin 

      heating = initial_heating;
      cooling = initial_cooling;
      //if too cold apply heating
      if (temperature <= 5'd18)
        begin
          heating = 1'b1;
          cooling = 1'b0;
        end
      // if too hot apply cooling
      else if (temperature >= 5'd22)
        begin
          heating = 1'b0;
          cooling = 1'b1;
        end
      // if temperature in the ideal state 
      else
        begin 
		// If heating is already on and the temperature is on the low side keep it on
		if ((heating == 1'b1) && (temperature < 5'd20))
			begin
			  heating = 1'b1;
		          cooling = 1'b0;
			end
		// If cooling is already and the temperature is on the high side keep it on
		else if ( (cooling == 1'b1) && (temperature > 5'd20) )
			begin
		          heating = 1'b0;
			  cooling = 1'b1;
			end
		else
	        // If it is in ideal temp and one of the other states turn off heating and cooling
	           begin
		          heating = 1'b0;
			  cooling = 1'b0;
	           end
	end
	    

    end
endmodule 
