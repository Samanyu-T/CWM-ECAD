//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter clk_time = 10; //set the clock period

//Todo: Registers and wires
reg clk, rst, button, cycle_count ;

//Todo: Clock generation
initial begin 
 clk=1'b0;
 forever
   begin
   #(clk_time/2) clk=~clk;
  //Increment the counter every clock cycle
   cycle_count = cycle_count + 1;
   end
end
  
initial begin
 $display("Test");
//Hold the button down to loop
  button = 1; 
  rst = 0;
  cycle_count = 4'h0;

forever
  begin
    if (cycle_count == 4'hF)
      begin
//display the final colour
      $display("Colour is %d",colour);
      $finish;
      end
//Turn off the button at the mddle 
    else if (cycle_count == 4'hA)
        begin
//display the intermediary colour to check the looping
        $display("Colour is %d",colour);
	button = 0;
        end
//Reset the colour
    else if (cycle_count == 4'hD)
	rst = 1;

  end
end
	 
lightcontrol top(.clk(clk), .rst(rst), .button(button),.colour(colour));
endmodule 
