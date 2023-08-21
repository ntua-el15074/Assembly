; void strcpy (char x[], char y[]) {
;     int i;
;     i=0;
;     while ((x[i]=y[i]) != 0) {
;         i=i+1;
;     }
; }
;
; Translate the above code into MIPS assembly
; Assume $a0 = x[0], $a1 = y[0], $s0 = i

strcpy:
    addi $s0,$zero,0
loop:
    lb $t1,0($a1)
    sb $a0,$t1
    beq $t1,$zero,done
    addi $s0,$s0,1
    addi $a0,$a0,1
    addi $a1,$a1,1
done:
