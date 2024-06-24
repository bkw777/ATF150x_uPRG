# FT232H-ATF150x Programmer

Adapter PCB that plugs onto a common "CJMCU-232H" FT232H USB module to make a programmer for ATF150x CPLDs.

Includes a 12v supply for VPP on /OE1 to recover CPLDs that have JTAG disabled.

![](PCB/out/FT232H-ATF150x.jpg)
![](PCB/out/FT232H-ATF150x.2.jpg)
![](PCB/out/FT232H-ATF150x.f.jpg)
![](PCB/out/FT232H-ATF150x.b.jpg)
![](PCB/out/FT232H-ATF150x.svg)

The JTAG port is Altera JTAG-A pinout, except with the addition that the normally nc pin 6 has /OE1 on it.

If the 12V-/OE1 jumper is shorted, then 12V is supplied to /OE1 on both PLCC-44 socket pin 44 and JTAG pin 6.

JTAG pin 6 is un-used in Altera JTAG-A pinout in JTAG mode, so most dev boards should be safely ignoring this pin, but to be safe, just don't enable the on-board 12V VPP supply when using the JTAG port to most dev boards.

Future versions of [bkw777/ATF150x_uDEV](https://github.com/bkw777/ATF150x_uDEV) may route JTAG pin 6 to /OE1 to use this option.

To use the on-board VPP supply with any other device (not using pin 6 from the JTAG), just connect a single "dupont" wire to the center 12V pin on the 12V-/OE1 jumper pin header and to /OE1 on your device, and use the JTAG as normal.

# Credits
Modified from [hackup.net ATF1504-FT232HQ Shield](https://www.hackup.net/2020/01/erasing-and-programming-the-atf1504-cpld/)

