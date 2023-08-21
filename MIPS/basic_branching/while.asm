; n = 3;
; sum = 0;
; while (n != 0) {
;     sum += n;
;     n--;
; }
; Translate the code above in MIPS assembly
; $t0 = n, $t1 = sum

    addi $t0,$zero,3
    addi $t1,$zero,0
loop:
    beq $t0,$zero,done
    add $t1,$t1,$t0
    addi $t0,$t0,-1
    j loop
done:
