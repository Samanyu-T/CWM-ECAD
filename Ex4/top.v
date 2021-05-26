//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Anirvinya Tirumala
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

module lightcontroller (
//add input and output ports
  input clk,rst,button,
  output reg [2,0]colour
    );
 //add registers and wires
  reg [2,0]colour;
 
 //at a positive button edge and a positive clock signal 
  always @(posedge clk)
    begin 
      if (button == 1)
        begin
  //If colour is in 0 or 7 then change it to 1      
        if ((colour == 3'b000) or (colour == 3'b111))
          colour = 2'b001 ;
  //If colour is 
        else
          colour = colour + 1 ;
        end
      else
        colour = colour;
     end
      
    end
