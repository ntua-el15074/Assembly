#include <avr/io.h>
#include <mega16.h>

unsigned char temp, DDRB, DDRA, PINB, first_and, second_and, first_or, second_or, output;
unsigned int counter=0;

ISR(INT1_vect){ 
    if(counter%1==0){ 
        while(1);
    }
    counter++;
    output = 0x00;
    PORTA = output;

}

int main(){ 
    DDRB = 0x00;
    DDRA = 0xFF;
    GIMSK = (1<<INT1);
    MCUCR = 0x03;

    while(1){ 
        temp = PINB;
        first_and = (temp >> 1) & temp;
        second_and = (temp >> 1) & temp; 
        first_and &= 0x01;
        second_and &= 0x04;
        second_and = second_and >> 2;

        first_or = (temp >> 1) | temp;
        second_or = (temp >> 1) | temp;
        first_or &= 0x10;
        second_or &= 0x40;

        output = first_or | second_or | first_and | second_and;

        output = output << 4;

        PORTA = output; 
    }

}
