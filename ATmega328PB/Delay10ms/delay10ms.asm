.include "m328PBdef.inc"

.def LoopR  = r18
.def LoopRl = r24
.def LoopRh = r25
.def temp   = temp

.equ Val    = 65535

.cseg
.org 0x00

    ;Initialize stack pointer 
    ldi temp,low(ramend)
    out spl,temp
    ldi temp,high(ramend)
    out sph,temp

    ;Initialize Input/Output
    ser temp
    out ddrd,temp
    
    clr temp 
    out ddrc,temp

loop:
    com temp
    out portd,temp
    ldi LoopR,50
    rcall delay10ms
    rjmp loop

delay10ms:
    ldi LoopRl,low(Val)
    ldi LoopRh,high(Val)
iLoop:
    sbiw LoopRl,1
    brne iLoop
    dec LoopR
    brne delay10ms

    nop
    ret



