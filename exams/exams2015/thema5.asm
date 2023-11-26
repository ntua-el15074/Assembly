.def temp=r21
.def counter=r22

    clr temp
    out ddrb, temp
    ser temp
    out ddrc, temp

    ldi counter,0x07
    in temp, pinb

main:
    ror temp
    brcs populate_rest
    subi counter, 0x01
    breq finish_up
    jmp main

populate_rest:
    ror temp
    bset c
    subi counter, 0x01
    breq finish_up
    jmp populate_rest

finish_up:
    ror temp
    ror temp
    out PORTC, temp 




