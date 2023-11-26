#include <mega16.h>

void display(unsigned int n, unsigned char output){ 
    const char table[10] = {0x40,0x79,0x25,0x30,0x19,0x12,0x02,0x78,0x00,0x10};
    output = table[n];
    PORTD = output;
}


