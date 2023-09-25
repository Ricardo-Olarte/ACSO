        .data
        .balign  4
c:      .word    0

        .balign  4
a:      .word    1

        .balign  4
b:      .word    1

        .balign  4
ares:   .word    0

bres:   .balign  4
        .word    0

        .balign  4
n:      .word    0

        .balign  4
one:    .word    1
         .balign 4
no:     .asciz "NO\n"

        .balign  4
main_r: .word    0

        .balign  4
frmt_s: .asciz   "%d"

        .balign  4
frmt_p: .asciz   "%d\n"



        .text
        .global   main
        .global   scanf
        .global   printf
        .func     main

main:   LDR       R0, =main_r
        STR       LR, [R0]

        LDR       R0, =frmt_s
        LDR       R1, =n
        BL        scanf

        LDR       R10, =n
        LDR       R10, [R10]
loop:

        LDR       R0, =frmt_s
        LDR       R1, =c
        BL        scanf

        LDR       R0, =c
        LDR       R1, [R0]

	LDR       R0, =b
        LDR       R3, [R0]

	LDR       R0, =a
        LDR       R2, [R0]

        LDR       R0, =one
        LDR       R4, [R0]

loop2:	MUL       R5,  R1,  R1

	MUL       R6,  R2,   R2
	MUL       R7,  R3,   R3
        ADD       R8,  R6,   R7
        CMP       R8,  R5
	BEQ       result
	B         adia



adia:   ADD      R2,  R2, R4
        CMP      R2,  R1
        BEQ      bdia
	B        loop2

bdia:   ADD      R3,  R3,  R4
        SUB      R2,  R2,  R2
        ADD      R2,  R2,  R4
        CMP      R3,  R1
        BEQ      resultn
	B        adia


resultn:
        LDR       R0, =no
        BL        printf
        B         end

result: ADD       R11,R2,#0
        LDR       R0, =ares
        STR       R3, [R0]

        LDR       R3, =ares
        LDR       R3, [R3]

        LDR       R0, =frmt_p
        LDR       R1, =ares
        LDR       R1, [R1]
        BL        printf

        LDR       R0, =bres
        STR       R11, [R0]

        LDR       R11, =bres
        LDR       R11, [R11]

        LDR       R0, =frmt_p
        LDR       R1, =bres
        LDR       R1, [R1]
        BL        printf
        B         end

end:    SUB       R10, R10, R4
        MOV       R0, #0

        LDR       LR, =main_r
        LDR       LR, [LR]
        CMP       R10, #0
        BNE       loop
        BX        LR



.endfunc
.end

