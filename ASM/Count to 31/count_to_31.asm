.include "m16def.inc"

.def temp=r16
.def leds=r17
.def total=0x1F
.def counter=r18
.def icounter=r19
.def port_input=r20
    jmp reset
    jmp ISR1

reset:
    ;Initialize Stack
    ldi temp, high(RAMEND)
    out SPH, temp
    ldi temp, low(RAMEND)
    OUT SPL, temp

    ;Initialize Input Output
    clr temp
    out DDRD, temp
    out DDRA, temp
    ser temp
    out DDRC, temp
    out PORTD, temp
    clr temp
    out PORTB, temp

    ;Interrupt on rising edge of INT1 pin
    ldi r24, 0x0A
    sts EICRA, r24

    ;Enable INT1 Interrupt
    ldi r24, 0x02
    out EIMSK, r24

    ; ldi temp, 0x0A
    ; out MCUCR, temp
    ; ldi temp, 0x40

    clr counter
    clr icounter

    ;Set Global Interrupt Flag
    sei
main:
    ;Check PIND
    in port_input, PIND
    cpi port_input, 0x7F
    
    ;If PIND = 0x80 than we stop accepting interrupts
    beq stop_counting

    ;Else we continue accepting interrupt and check PIND again
    sei
    rjmp main

stop_counting:
    ;Unset Global interrupt flag and check PIND again
    cli
    rjmp main
    
ISR1:
    ;Pushes
    push r25
    push r24
    in r24, SREG
    push r24
    push counter

    ;Check if counter is equal to 31
    cpi counter, total
    beq reset

    ;Increment counter and show the result
    inc counter
    out PORTC, counter
    ldi r24, low(100)
    ldi r25, high(100)
    rcall wait_msec

    ;Pops
    pop counter
    pop r24
    out SREG, r24
    pop r24
    pop r25

    ;Return from routine
    reti

wait_usec:
    sbiw r24 ,1
    nop
    nop
    nop
    nop
    brne wait_usec
    ret

wait_msec:
    push r24
    push r25
    ldi r24 , low(998)
    ldi r25 , high(998)
    rcall wait_usec
    pop r25
    pop r24
    sbiw r24 , 1
    brne wait_msec
    ret

