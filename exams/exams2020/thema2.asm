.include "m16def.inc"

.def temp=r21
.def first_and = r22
.def second_and = r23
.def first_or = r24
.def second_or = r25
.def output = r26
.def port_input = r20
.def counter = r19
.org 0
    rjmp reset
    rjmp interrupt1
    reti

reset:
    ;Init Stack
    ldi temp, high(RAMEND)
    out SPH, temp
    ldi temp, low(RAMEND)
    out SPL, temp

    ;Initialize Input
    clr temp
    out DDRB,temp 
    ser temp
    out DDRA,temp
    ldi counter,0x00

    ;Interrupt 
    ldi temp, 1<<INT1
    out GIMSK, temp
    ldi temp, 0b00000011
    out MCUCR, temp
    sei

main:
    in port_input, PINA
    mov temp, port_input
    ror temp 
    and temp, port_input
    mov first_and, temp
    mov second_and, temp
    andi first_and, 0b00000001
    andi second_and, 0b00000100
    ror second_and
    ror second_and

    mov temp, port_input
    ror temp
    or temp, port_input
    mov first_or, temp
    mov second_or, temp 
    ror first_or
    ror first_or
    ror first_or
    ror first_or
    ror second_or
    ror second_or
    ror second_or
    ror second_or
    ror second_or
    ror second_or

    or second_or, first_or
    or second_or, first_and
    or second_or, second_and
    mov output, second_and
    rol output
    rol output
    rol output
    rol output
    andi output, 0b00010000
    out PORTA, output
loop:
    ldi counter, 0x00
    rjmp loop

interrupt1:
    ldi output, 0b00000000
    inc counter
    cpi counter,0x01
    beq loop
    out PORTA, output
    reti
