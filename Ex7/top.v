//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

module RGB_Controller (
    //Todo: add ports 

        input clk,
        input sel,
        input rst,
	input button,
        output  [23:0] light
	);
	
	wire [2:0] colour;
	wire [23:0] rgb;
	wire [23:0] white;
	assign white = 24'hFFFFF;

	//The light control module will output a colour 
         
        //Name of Module  Then Name of File
	lightcontrol topEx4(.clk(clk), .rst(rst), .button(button), .colour(colour) );
	//The Colour_Converter will output a rgb colour
 	Colour_Converter topEx6(.colour(colour), .clk(clk), .enable(1'b1), .rgb(rgb));
	//The multiplexer will choose the rgb colour or white depending on sel
	multiplexer topEx2(.a(white),.b(rgb), .sel(sel));

  endmodule
