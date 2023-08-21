; //int x[100], y[100], z[100];
; void sumarray(int a[], int b[], int c[]) {
; int i;
; for(i= 0; i< 100; i++)
;   c[i] = a[i] + b[i];
; }
; 
; Translate the code above into MIPS assembly
; Assume $a0=a[0], $a1=b[0], $a2=c[0]
;
; Since inside the arrays, there are integer values
; being stored, we should take into consideration that
; when we increment into the next value in the array
; we should increment by 4, not 1, since an integer value
; is 4 bytes.

sumarray:
    addi $t0,$zero,0 ; this is our enumerator i
    addi $t1,$zero,100 ; this is our upper bound for the loop
loop:
    beq $t0,$t1,done ; check whether we should continue looping 
    lw $t2,0($a0) ; load byte of a[i] into t2
    lw $t3,0($a1) ; load byte of b[i] into t3
    add $t3,$t3,$t2 ; a[i] + b[i]
    sw $t3,0($a2) ; Store the sum into c[i]
    addi $a0,$a0,4 ; a[i+1]
    addi $a1,$a1,4 ; b[i+1]
    addi $a2,$a2,4 ; c[i+1]
    addi $t0,$t0,1 ; i++
    j loop
