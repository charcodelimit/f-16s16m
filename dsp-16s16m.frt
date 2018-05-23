$1C constant i2c.dsp-16s16m

\ cycle through all characters and displays them
: 16s16m.test ( -- )
  i2c.dsp-16s16m i2c.begin
    0 i2c.tx
  i2c.end
;

\ clear display buffer
: 16s16m.clear-buffer ( -- )
  i2c.dsp-16s16m i2c.begin
    1 i2c.tx
  i2c.end
;

\ sets the char to be displayed
: 16s16m.char! ( position char -- )
    i2c.dsp-16s16m i2c.begin
    3 i2c.tx
    i2c.tx
    i2c.tx
    i2c.end
;

\ sets the string to be displayed - maximum 11 chars
: 16s16m.s! ( addr n -- )
    i2c.dsp-16s16m i2c.begin
    4 i2c.tx
    11 min
    0 ?do
        dup
        c@ i2c.tx
        1+
    loop
    drop
    i2c.end
;

\ sets the string to be displayed - maximum 16 chars
: 16s16m.str! ( addr n -- )
    10 ms
    16 min
    0 ?do
        dup
        c@ 15 i - swap 16s16m.char!
        10 ms
        1+
    loop
    drop
;

\ sets the string to be displayed - maximum 16 chars
: 16s16m.string! ( addr n -- )
    over over ( addr n -- addr n addr n )
    \ first 5 chars
    5 min
    16s16m.str!
    \ last 11 characters
    5 - 0 max
    swap 5 + swap
    16s16m.s!
;

\ paint the display buffer
: 16s16m.paint ( -- )
    i2c.dsp-16s16m i2c.begin
    2 i2c.tx
    i2c.end
;

\ sets the string to be scrolled
: 16s16m.scroll-string! ( addr n -- )
    i2c.dsp-16s16m i2c.begin
    5 i2c.tx
    40 min
    0 ?do
        dup
        c@ i2c.tx
        1+
    loop
    drop
    i2c.end
;

\ set the delay between scroll frame changes (in ms)
: 16s16m.scroll-delay ( delay -- )
    i2c.dsp-16s16m i2c.begin
    6 i2c.tx
    i2c.tx
    i2c.end
;

\ displays the scroll buffer
: 16s16m.scroll ( -- )
    i2c.dsp-16s16m i2c.begin
    7 i2c.tx
    i2c.end
;

\ clears the display
: 16s16m.clear ( -- )
    16s16m.clear-buffer
    16s16m.paint
;


\ initialize the display
: 16s16m.init ( -- )
    i2c.init.default
    5 ms \ wait for display to become ready
    16s16m.clear
;

\ clear display and show string
: 16s16m.p-str! ( addr n -- )
    16s16m.clear-buffer
    10 ms
    16s16m.string!
    10 ms
    16s16m.paint
;

\ 16s16m.init

\ s" A very long string that I want to be scrolled" swap over pad swap cmove> pad swap
\ 16s16m.scroll-string!
\ 16s16m.scroll

\ s" 1" 16s16m.p-str! 250 ms s" /" 16s16m.p-str! 250 ms 
\ s" -" 16s16m.p-str! 250 ms s" \" 16s16m.p-str! 250 ms
