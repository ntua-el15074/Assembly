    .include "m328PBdef.inc"
    
reset:
    LDI r24, low(RAMEND)
    OUT SPL, r24
    LDI R24, high(RAMEND)
    OUT SPH, r24
    
    ;init PORTC as output
    SER R24
    OUT DDRC, r24
    
    ;set portb as input
    CLR R25
    OUT DDRB, R25
    
    CLR r24
    out ddrc,r24
    
start:
    
    IN R25, low(PINB)
    MOV r24, r25
    ANDI r24, 0x01
    MOV r1, r24     ;r1 = D
    
    CPI r24, 0x01
    BREQ LIGHT_ON
    RJMP start
    
LIGHT_ON:
    LDI r24,0X01
    OUT DDRC, r24

   MOV r24, r25
   ANDI r24, 0x02
   MOV r2, r24
   ROR r2          ;r2 = C

   MOV r24, r25
   ANDI r24, 0x04
   MOV r3, r24
   ROR r3
   ROR r3          ;r3 = B

   MOV r24, r25
   ANDI r24, 0x08
   MOV r4, r24
   ROR r4
   ROR r4
   ROR r4          ;r4 = A
   
   OR r4,r3
   NEG r3
   OR r3, r1
   AND r4, r3
   MOV r6, r4
   
   LPM 
   MOV r6, r0
   
   ;F1
   
   MOV r24, r25
   ANDI r24, 0x01
   MOV r1, r24     ;r1 = D

   MOV r24, r25
   ANDI r24, 0x02
   MOV r2, r24
   ROR r2          ;r2 = C

   MOV r24, r25
   ANDI r24, 0x04
   MOV r3, r24
   ROR r3
   ROR r3          ;r3 = B

   MOV r24, r25
   ANDI r24, 0x08
   MOV r4, r24
   ROR r4
   ROR r4
   ROR r4          ;r4 = A

   NEG r4 
   NEG r2
   AND r4, r2

   NEG r1
   AND r1, r3

   OR r1, r4
   ROL r6
   AND r6, r1
   
   LPM 
   MOV r22, r0
   
   OUT PORTC, r22
   
   RJMP start
