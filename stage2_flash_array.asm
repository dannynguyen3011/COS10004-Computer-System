; function stage2_flash_array
; flashes the contents of array givenBASE
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        ; your function should make use of the existing functions PLASH and PAUSE
        push {r8}

        loop:            ; create a loop
        ldr r8,[r2,#4] ; load address to r8
          
        push {r1,r2,lr}
        mov r1,r8

        mov r2,$20000
        bl FLASH 
        mov r1,$200000
        bl PAUSE
        pop {r1,r2,lr}

        sub r1,#1   ;subtract array size
        cmp r1,#0
        bgt loop ; loop if r1 > 0
        pop {r8}
        bx lr