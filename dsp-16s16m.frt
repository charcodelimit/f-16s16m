$1C constant i2c.dsp-16s16m

\ cycle through all characters and displays them
: dsp-16s16m.test ( -- )
  i2c.dsp-16s16m i2c.begin
    0 i2c.tx
  i2c.end
;

\ clear display buffer
: dsp-16s16m.clear-buffer ( -- )
  i2c.dsp-16s16m i2c.begin
    1 i2c.tx
  i2c.end
;

\ sets the char to be displayed
: dsp-16s16m.char! ( position char -- )
    i2c.dsp-16s16m i2c.begin
    3 i2c.tx
    i2c.tx
    i2c.tx
    i2c.end
;

\ paint the display buffer
: dsp-16s16m.paint ( -- )
    i2c.dsp-16s16m i2c.begin
    2 i2c.tx
    i2c.end
;

\ set the delay between scroll frame changes (in ms)
: dsp-16s16m.scroll-delay ( delay -- )
    i2c.dsp-16s16m i2c.begin
    6 i2c.tx
    i2c.tx
    i2c.end
;

\ displays the scroll buffer
: dsp-16s16m.scroll ( -- )
    i2c.dsp-16s16m i2c.begin
    7 i2c.tx
    i2c.end
;

\ clears the display
: dsp-16s16m.clear ( -- )
    dsp-16s16m.clear-buffer
    dsp-16s16m.paint
;


\ initialize the display
: dsp-16s16m.init ( -- )
    i2c.init.default
    5 ms \ wait for display to become ready
    dsp-16s16m.clear
;