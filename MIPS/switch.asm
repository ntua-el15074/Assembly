; switch (i) {
;     case 0: j = 3; break;
;     case 1: j = 5; break;
;     case 2: ;
;     case 3: j = 11; break;
;     case 4: j = 13; break;
;     default: j = 17;
; }
; Translate the code above in MIPS assembly
; Assume $s1->i, $s2->j

    addi $t0,$zero,0
    beq $s1,$t0,case_0
    addi $t0,$t0,1
    beq $s1,$t0,case_1
    addi $t0,$t0,1
    beq $s1,$t0,case_2
    addi $t0,$t0,1
    beq $s1,$t0,case_3
    addi $t0,$t0,1
    beq $s1,$t0,case_4
    j default

case_0:
    addi $s2,$zero,3
    j done
case_1:
    addi $s2,$zero,5
    j done
case_2:
    j done
case_3:
    addi $s2,$zero,11
    j done
case_4:
    addi $s2,$zero,13
    j done
default:
    addi $s2,$zero,17

done:
