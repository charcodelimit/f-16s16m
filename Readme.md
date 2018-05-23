# F-16s16m 

A small Forth library for the
[DSP-16s16m](https://www.embeddedadventures.com/16_segment_led_display_DSP-16S16M.html)
16-segment microdisplay that allows you to interface the display with
[AmForth](http://amforth.sourceforge.net/) on e.g. an Arduino UNO.

![Hardware](doc/hardware.jpg?raw=true "DSP-16s16m with Arduino UNO")

## Install

You need a running AmForth on your Arduino. After that you can upload 
`dsp-16s16m.frt` using the `amforth-shell.py` script.

## Usage

The I2C communication needs to be initialized using the word `16s16m.init`.
After that the display is ready to receive commands.

![Screenshot](doc/screenshot.gif?raw=true "Example")

## License

F-16s16m is licensed under the [GPL Version 3](https://www.gnu.org/licenses/gpl-3.0.en.html).
