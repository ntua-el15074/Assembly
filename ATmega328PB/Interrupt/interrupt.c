#define F_CPU 16000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

ISR (INT1_vect){ 
    PORTB=0xFF
    delay_ms(500);
    PORTB=0x01
    delay_ms(4000);
    PORTB=0x00;
}


int main(){ 
    //Interrupt on rising edge of INT1 pin
    EICRA = (1 << ISC11) | (1 << ISC10);

    //Enable the INT1 Interrupt
    EIMSK = (1 << INT1);

    sei();

    DDRB = 0xFF;
    DDRC = 0xFF;
    PORTB = 0x00;

    while(1){ 
        print("running\n");
    }

}
