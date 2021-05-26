//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module lightcontrol (
    //Todo: add ports 
	input clk,rst,button,initial_colour,
  	output reg [2:0]colour
    );
                    
 
  initial 
  colour <= initial_colour;
    //Todo: add user logic
  always @(posedge clk)
    begin
   // if the colour is out of bounds or rst is on then set to 1
    if ((colour == 3'b000) || (colour == 3'b111) || (rst == 1))
      colour = 3'b001;
    else
      begin
   // if button is on then increase the colour
       if (button == 1)
         colour = colour + 1;
       else
    // if the button is off then keep the colour constant
         colour = colour;
      end
    end
endmodule
 
