//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter clk_time = 10; //set the clock period

//Todo: Registers and wires
  reg sel;
  reg clk;
  reg rst;
  reg button;
  reg [3:0] cycle_count;
  reg button;
  wire [23:0] light;

//Todo: Clock generation
initial 
begin 
 clk = 1'b0;
//Add delay to synchronize the system
 #(clk_time/2)
 forever
   begin
   #(clk_time/2) clk=~clk;
   end
end
  
//Intialise the values of the inputs and cycle_counter
initial
 begin 
 cycle_count = 4'h0;
 rst = 1'b1;
 button = 1'b1;
 sel = 1'b1;
 #(clk_time)

forever
  begin
// To test the system accurately I used the simgui to monitor the values with respect to the clock signal
    #(clk_time)
    //Increment the counter every clock cycle
    cycle_count = cycle_count + 4'h1;
    if (cycle_count == 4'hF)
    //End the simulation
      $finish;
//These if statements change the inputs at different points to check if everything works
    else if (cycle_count == 4'h5)
	begin
	sel = 0;
	end
    else if (cycle_count == 4'h9)
	begin
	sel = 1;
	button = 0;
        end
    else if (cycle_count == 4'hB)
	begin 
	rst = 1;
	end
//Display the Output to monitor and the cycle number
    $display("Cycle Number %d , Light: %h", cycle_count, light);
  end
end
 RGB_Controller top(.rst(rst), .clk(clk), .sel(sel), .button(button), .light(light));

endmodule
