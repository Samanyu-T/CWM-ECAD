//////////////////////////////////////////////////////////////////////////////////
// Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an air conditioning systems
//
//  inputs:
//           rst_n, clk_n, clk_p, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk_p,
    input clk_n,
    input rst_n,
    input temperature_0,
    input temperature_1,
    input temperature_2,
    input temperature_3,
    input temperature_4,
    output heating,
    output cooling
     //Todo: add all other ports besides clk_n and clk_p 
   );
    

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );


//Add logic here
	wire [4:0]temperature;
	assign temperature[0] = temperature_0;
	assign temperature[1] = temperature_1;
	assign temperature[2] = temperature_2;
	assign temperature[3] = temperature_3;
	assign temperature[4] = temperature_4;

  //apply the conditions to determine whether cooling or heating is required
	tempmonitor topEx5(.temperature(temperature), .clk(clk), .heating(heating), .cooling(cooling));
		   
	    
endmodule
