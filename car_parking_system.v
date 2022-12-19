`timescale 1ns / 1ps

module car_parking_system (
  input wire clock,
  input wire reset,
  input wire car_arrival,
  input wire car_departure,
  output reg full_signal,
  output reg empty_signal
);

reg [3:0] count;

initial begin
  count = 4'b0;
  full_signal = 1'b0;
  empty_signal = 1'b1;
end

always @(posedge clock or posedge reset) begin
  if (reset) begin
    count <= 4'b0;
  end else begin
    if (car_arrival) begin
      if (count == 4'b1111) begin
        count <= count;
      end else begin
        count <= count + 1;
      end
    end else if (car_departure) begin
      if (count == 4'b0000) begin
        count <= count;
      end else begin
        count <= count - 1;
      end
    end
  end
end

always @(*) begin
  full_signal = (count == 4'b1111);
  empty_signal = (count == 4'b0000);
end

endmodule