; // writes an integer value num words times
; // starting from address dst
; void memset(int *dst, int value, int num_words) {
;     for (int i = 0; i < num_words; ++i) {
;         *dst = value;
;         dst++; 
;     }
; }
; Translate the code above into MIPS assembly
; Assume $a0= dst, $a1=value, $a2=num_words

memset:
    addi $t0,$zero,0
loop:
    beq $t0,$a2,done
    sw $a1,0($a0)
    addi $a0,$a0,1
    addi $t0,$t0,1
    j loop
