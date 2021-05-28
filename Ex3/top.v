//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name:Anirvinya Tirumala
// Date: 24/05/2021
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
	input clk,
	input rst,
	input change,
	input on_off,
	output reg [7:0]counter_out
    );


    //Todo: add user logic

 initial counter_out = 8'h00;

	 
	always @(posedge clk)
	begin
//This if statement will reset to 0 when rst == 1 or when there will be overflow
//It will also allow the counter to travel from 00 to FF.
	    if  ( ((counter_out == 8'hFF) && on_off == 1) || (rst==1) )
 		counter_out = 8'h00;
	    else if ( (counter_out == 8'h00) && (on_off == 0) ) 
		counter_out = 8'hFF;
//add one if the change is on and on_off is on or subtract one if on_off is 0
	    else if ((on_off==1) && (change==1))
		 counter_out = counter_out + 8'h01;
            else if ( (on_off==0) & (change==1))
		 counter_out = counter_out - 8'h01;
// if change is 0 then the counter remains constant
	 	    
	end

      
endmodule
