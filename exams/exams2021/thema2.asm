.include "m16def.inc"                                                                       

.def temp,r21
.def port_input, r22
.def level, r23

reset:
    ;Init Stack
    ldi temp,low(RAMEND)
    out SPL,temp
    ldi temp,high(RAMEND)
    out SPH, temp

    ;Initialize I/O
    clr temp
    out DDRA, temp
    ser temp
    out DDRC, temp

main:
    in port_input, PINA
    mov temp, port_input
    andi temp, 0b00000100
    cpi temp, 0b00000100
    beq we_are_at_level_zero
    mov temp, port_input
    andi temp, 0b00000010
    cpi temp, 0b00000010
    beq we_are_at_level_one
    rjmp we_are_at_level_zero


we_are_at_level_zero:
    ldi temp,0b00000000
    out PORTC,temp
    mov temp, port_input
    andi temp, 0b00000001
    cpi temp, 0b00000001
    beq go_up
    andi temp, 0b00001000
    cpi temp, 0b00001000
    beq go_up
    rjmp we_are_at_level_zero

we_are_at_level_1:
    ldi temp,0b00000000
    out PORTC,temp
    mov temp, port_input
    andi temp, 0b00000001
    cpi temp, 0b00000001
    beq go_down
    andi temp, 0b00010000
    cpi temp, 0b00010000
    beq go_down
    rjmp we_are_at_level_1

go_up:
    ldi temp,0b00000001
    out PORTC, temp
    rjmp main

go_down:
    ldi temp, 0b00000010
    out PORTC, temp
    rjmp main
