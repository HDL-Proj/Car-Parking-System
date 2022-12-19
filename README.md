# Car-Parking-System 🐛

## To run this stuff, just follow this steps below on your terminal 👽️

First, generate vvp file:

```bash
iverilog -o _tb_car_parking_system.vvp car_parking_system.v
```

Then, generate dump vcd file:

```bash
vvp  _tb_car_parking_system.vvp
```

Lastly, simulate

```bash
gtkwave
```
