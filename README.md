# ATF150x Programmers based on FT232H modules

ATF150x programmer in the form of a "hat" PCB for common FT232H USB modules like CJMCU-232H or Adafruit 2264.

Includes a 12V supply for VPP on /OE1 to recover CPLDs that have JTAG disabled.

Adafruit 2264  
* Uses Adafruit 2264 module
* Resistors on the JTAG data lines  
* MAX662A always on, VPP on/off by disconnecting VPP  
* Solder pins to the bottom of Adafruit board.
* Does not require soldering the Adafruit board to the uPRG board, nor sockets.  
  Adafruit board remains bread-board friendly and re-usable.
* Switches instead of jumpers
* LEDs
![](PCB/out/ATF150x_uPRG_s.jpg)
![](PCB/out/ATF150x_uPRG_s.2.jpg)
![](PCB/out/ATF150x_uPRG_s.f.jpg)
![](PCB/out/ATF150x_uPRG_s.b.jpg)
![](PCB/out/ATF150x_uPRG_s.svg)

CJMCU-232H  
* Uses "CJMCU-232H" module  
* No resistors on the JTAG data lines  
* VPP on/off via shutdown pin on the MAX662A  
* Solder pins to the top of the CJMCU board  
![](PCB/out/ATF150x_232H.jpg)
![](PCB/out/ATF150x_232H.2.jpg)
![](PCB/out/ATF150x_232H.3.jpg)
![](PCB/out/ATF150x_232H.f.jpg)
![](PCB/out/ATF150x_232H.b.jpg)
![](PCB/out/ATF150x_232H.svg)

## VPP-over-JTAG
When VPP is ON, 12V is supplied to JTAG pin 6 and PLCC pin 44.  
This forces the JTAG pins to be enabled even if the device is currently programmed with the JTAG pins disabled (used as ordinary I/O pins).

[ATF150x_uDEV](https://github.com/bkw777/ATF150x_uDEV) includes a matching option to receive VPP on JTAG pin 6.
  
JTAG pin 6 should normally be NC for most Altera JTAG-A targets, but 12V is 12V, so **Don't enable VPP with an unknown device connected to JTAG**  

# Credits
Modified from [hackup.net ATF1504-FT232HQ Shield](https://www.hackup.net/2020/01/erasing-and-programming-the-atf1504-cpld/)
