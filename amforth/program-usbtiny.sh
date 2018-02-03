avrdude -P usb -c usbtiny -b 19200 -p m328p -e -U flash:w:uno.hex:i -U eeprom:w:uno.eep.hex:i -U efuse:w:0xFD:m -U hfuse:w:0xD9:m -U lfuse:w:0xFF:m
