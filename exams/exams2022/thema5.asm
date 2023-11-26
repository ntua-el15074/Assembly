.include "m16def.inc"                                                       

.def temp=r21
.def first_or=r26
.def second_or=r27
.def first_and=r28
.def output=r29
.def port_input=r25
.org 0
    rjmp reset
    rjmp interrupt1
    reti

reset:
    ;Init Stack
    ldi temp, high(RAMEND)
    out SPH, temp
    ldi temp, low(RAMEND)
    OUT SPL, temp 

    ;Initialize Input Output
    clr temp
    out DDRB, temp
    ldi temp, 0b00000010
    out DDRD, temp

    ;Interrupt on negative 
    ldi temp, 1 << INT1
    out GIMSK, temp
    ldi temp, 0b00000010
    out MCUCR, temp
    sei 
    
main:
    in port_input, PINB
    mov first_or, port_input 
    ror first_or
    or first_or, port_input
    andi first_or, 0b00000001

    mov second_or, port_input
    ror second_or
    or second_or, port_input
    andi second_or, 0b0000100
    ror second_or
    ror second_or

    mov first_and, port_input
    ror first_and
    and first_and, port_input
    andi first_and, 0b0010000
    ror first_and
    ror first_and
    ror first_and
    ror first_and

    and first_and, first_or
    and first_and, second_or
    mov output, first_and
    rol output
    andi output, 0b00000010
    out PORTD, output
    rjmp main

interrupt1:
    com output
    reti 

    



    

