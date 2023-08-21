; int sum= 0;
; int i;
; for(i = 0; i != 10; i = i+1) {
; sum = sum + i; }
;Translate the above program in MIPS assembly 
; Assume $s0 -> i, $s1 -> sum

    addi $s1,$zero,0
    addi $s0,$zero,0
    addi $t0,$zero,10
loop:
    beq $s0,$t1,done
    add $s1,$s1,$s0
    addi $s0,$s0,1
    j loop
done:

