; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

         ; this is a place holder - replace "1" with the register holding the return value

        push {r4,r5}
        push {r0-r2,lr} ;take the min in stage 1a
        bl stage1a_min
        mov r4,r0 ;move value of min in 1b to r4
        pop {r0-r2,lr}

        push {r4,r5} ;push to stack
        push {r0-r2,lr} ; take the max in stage 1b
        bl stage1b_max
        mov r5,r0 ;move value of max in 1b to r5
        pop {r0-r2,lr}
        pop {r4,r5} ;pop
        sub r0, r5, r4
        bx lr
