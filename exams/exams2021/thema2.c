#include <avr/io.h>                                                                             

unsigned char PORTC, DDRA, DDRC, PINA, temp, port_input;

int main(){ 
    DDRA = 0x00;
    DDRC = 0xFF;

    char m, a1, a0, k1, k0;

    while(1){ 
        port_input = PINA;

        a0 = port_input & 0x04;
        a1 = port_input & 0x02;
        m = port_input & 0x01;
        k0 = port_input & 0x10;
        k1 = port_input & 0x08;

        if(a0 == 0x04){ 
            PORTC = 0x00;
            if (m | k1){ 
                PORTC = 0X02;
            }
        }
        else if (a1 == 0x02){ 
            PORTC = 0x00;
            if (m | k0){ 
                PORTC = 0x01;
            }
        }
        else { 
            a0 = 0x04;
        }

    }

}
