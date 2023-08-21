; int sum(int a, int b){
;     int temp = a + b;
;     return temp; 
; }
;
; int main(int x, int y) {
;     int a = addTwo(x, y);
;     int b = addTwo(y, x);
;     return a + b; 
; }
; Translate the code above with MIPS Assembly

sum:
    add $v0,$a0,$a1
    ja $ra

main: 
    addi $sp,$sp,-16
    sw $s0,0($sp)
    sw $s1,4($sp)
    sw $s2,8($sp)
    sw $ra,12($sp)
    add $a0,$s0,$zero
    add $a1,$s1,$zero
    jal sum
    add $s2,$zero,$v0
    add $a0,$s1,$zero
    add $a1,$s0,$zero
    jal sum
    add $v0,$v0,$s2
    lw $ra,12($sp)
    lw $s2,8($sp)
    lw $s1,4($sp)
    lw $s0,0($sp)
    addi $sp,$sp,16
    jr $ra
