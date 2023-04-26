; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

         ; this is a place holder - replace "1" with the register holding the return value
       
        cmp r0,r1   ; to check first condition
        blt checkmin
        mov r0,r1   ; means that r0 greater than r1 then move r1 back to r0
        b checkmin

        checkmin:
        cmp r0,r2 ;to check r0 is min
        blt exit
        mov r0,r2 ; if r2 smaller than r0
        b exit

        exit:

        bx lr
