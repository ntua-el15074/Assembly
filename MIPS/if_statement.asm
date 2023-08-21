; int y;
; if (x == 5) {
;     y = 8; 
; }
; else if (x < 7) {
;     y = x + x;
; } else {
;     y = -1; 
; }
; Translate the code above in MIPS assembly
; Assume $t0 -> x, $t1 -> y

    addi $s1,$zero,5
    beq $s1,$t0,equal_to_five
    andi $s1,$s1,$zero
    addi $s1,$zero,7
    slt $s2,$t0,$s1
    bne $s2,$zero,lower_than_7
    j otherwise

equal_to_five:
    addi $t1,$zero,8
    j end

lower_than_7:
    add $t1,$t0,$t0
    j end

otherwise:
    addi $t1,$zero,-1

end:

    
