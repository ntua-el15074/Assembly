; void main() {
;   int y;
;   y = sum(42, 7); 
; }
;
; int sum(int a, int b) {
;   return(a + b);
; }
;
; Translate the code above into MIPS assembly
; Assume $s0 = y

sum:
    ;Store return value of sum procedure
    add $v0,$a0,$a1

    ;Return to state from where the sum procedure was called
    jr $ra

main: 
    ;Initialize Stack Pointer with one position
    addi $sp,$sp,-4
    sw $ra,0($sp)

    ;Put arguments in $a0-$a3
    addi $a0,$zero,42
    addi $a1,$zero,7

    ;Call procedure
    jal sum

    ;Store return value of called procedure into s0
    add $s0,$zero,$v0

    ;Store it as a return value of main procedure
    add $v0,$s0,$zero

    ;Deconstruct Stack
    lw $ra,0($sp)
    addi $sp,$sp,4

    ;Return to state from where the main procedure was called
    jr $ra

