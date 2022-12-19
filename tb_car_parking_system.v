`include "car_parking_system.v"
`timescale 1ns / 1ps

module testbench;

reg clock = 1'b0;
reg reset = 1'b0;
reg car_arrival = 1'b0;
reg car_departure = 1'b0;
wire full_signal;
wire empty_signal;

car_parking_system dut (
  .clock(clock),
  .reset(reset),
  .car_arrival(car_arrival),
  .car_departure(car_departure),
  .full_signal(full_signal),
  .empty_signal(empty_signal)
);

initial begin
  reset = 1'b1;
  #10 reset = 1'b0;
  #10 car_arrival = 1'b1;
  #10 car_arrival = 1'b0;
  #10 car_departure = 1'b1;
  #10 car_departure = 1'b0;
end

always #5 clock = ~clock;

initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end

endmodule