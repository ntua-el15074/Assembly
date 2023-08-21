; int sum = 0;
; int i;
; for(i= 1; i< 101; i= i*2) {
; sum = sum + i; }
; Translate the above program into MIPS assembly
; Assume $s0 -> i, $s1 -> sum

    addi $s1,$zero,0
    addi $s0,$zero,1
    addi $t0,$zero,101
loop:
    slt $t1,$s0,$t0
    beq $t1,$zero,done
    add $s1,$s1,$s0
    sll $s0,$s0,1
    j loop

