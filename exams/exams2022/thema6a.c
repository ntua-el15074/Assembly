#include <mega16.h>                                                                             

unsigned char temp; 
unsigned char counter = 0x00;
unsigned int k;

int main(){ 

    DDRB = 0x00;
    DDRD = 0xFF;
    k = 1;

    while(1){ 
        if (k == 1) { 
            temp = PINB & 0x1;

            if(temp == 0){ 
                continue;
            }

            counter++;
            PORTD = counter;

            if(counter >= 9){ 
                k = 0;
            }
        }
        else { 
            temp = PINB & 0x2;

            if(temp == 0){ 
                continue;
            }

            k = 1;
        }

        PORTD = PORTD & 0x7F;

        display(counter, PORTD);

    }
    
    return 0;


}
