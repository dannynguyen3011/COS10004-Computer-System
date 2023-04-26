; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

        push{r3-r10}
        mov r3,r0 ; r3 = index swap
        mov r4,r0 ; r4 = size array
        mov r5,r1 ; r5 = array
        mov r6,#0 ; r6 = index

        cmp r4,r3 ; compare first two index
        beq loopswap1 ; if its equal => move to loopswap1
        loopswap2:
        mov r4,r0 ; r4 = size array as a tempt
        mov r6,#0 ; reset position of index

        loopswap1:
        ldr r7,[r5,r6] ; load current index
        add r8,r6,#4   ; add 4 to index
        ldr r9,[r5,r8] ; load next index
        cmp r7,r9 ; compare next two indexes
        bgt swap ; current > next => s
        add r6,#4 ; add 4 to last
        sub r4,#1 ; decrease size of array
        cmp r4,#0 ; check if r4 > 0
        bgt loopswap1 ; if > => loopswap2
        sub r3,#1 ; decrease index swap
        cmp r3,#0 ; compare index swap to 0
        bgt loopswap2 ; index swap > 0 => loopswap2
        beq endingswap ; if equal => endingswap


        swap:
        str r7,[r5,r8] ; load current index
        str r9,[r5,r6] ; load next index
        add r6,#4 ; add 4 to postion
        sub r4,#1 ; add 1 to size array
        cmp r4,#0 ; compare array size to 0
        bgt loopswap1 ; array size > 0 => loopswap1

        endingswap:
                ; your function must mov the address of the sorted array to r0
        mov r1,r0 ; return size to flash
        mov r0,r2 ; return BASE to flash
        mov r2,r5 ; return array to flash

        bl stage2_flash_array ; use function in stage 2 to flash the new sorted array
        pop {r3-r10}
                
         bx lr