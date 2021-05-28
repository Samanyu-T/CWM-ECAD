//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 - Doorbell Chime
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer that chooses between two sounds, where the  
//  output is delayed by 5 ticks (not clocks!) and acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module multiplexer(
    //Todo: define inputs here
    input [23:0] a,
    input [23:0] b,
    input sel,
    input clk,
    output [23:0] out
	);

    //Todo: define registers and wires here
    wire out; 
    
    //At  apply the multiplexing logic
	if (sel == 0)
    		assign #5 out = a;
	else (sel == 1)
		assign #5 out = b;

	

endmodule
