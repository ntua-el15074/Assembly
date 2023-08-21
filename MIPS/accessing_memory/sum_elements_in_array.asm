; A is a byte array
;
; int sum = 0;
; for(int i = 0; i < n; i++)
;   sum += A[i];
;
; Translate the code above in MIPS assembly 
; Assume $a0=A[0],$a1=n,$t0 = sum, $t1 = i

    addi $t1,$zero,0 ; i is t1 = 0
    addi $t0,$zero,0 ; sum is t0 = 0
    addi $t3,$zero,1 ; offset for array access
loop:
    beq $t1,$a1,done ; if i = n, stop
    lb $t4,0($a0)   ; load byte of a0 with offset 0 into t4
    add $t0,$t0,$t4 ; add A[i] into sum
    add $a0,$a0,$t3  ; add the offset into the array to go to A[i+1]
    j loop  ; loop
done:
    


    
