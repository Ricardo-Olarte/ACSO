.data
            .balign 4
gcdReturn:  .word   0
            .balign 4
divReturn:  .word   0
            .balign 4
simpReturn:  .word   0
            .balign 4
restFracReturn:  .word   0
            .balign 4
divModSimpReturn:  .word   0
            .balign 4
a:          .word   0
            .balign 4
b:          .word   0
            .balign 4
cases:          .word   0
            .balign 4
i:          .word   0
            .balign 4
gcdValue:          .word   0
            .balign 4
divValue:          .word   0
            .balign 4
modValue:          .word   0
        .balign 4
ret:    .word   0
        .balign 4
frm_s:    .asciz   "%d"
        .balign 4
frm_p:    .asciz   "%d\n"
@Local variables
            .balign 4
divD:          .word   0
            .balign 4
divI:          .word   0
            .balign 4
simpA:          .word   0
            .balign 4
simpB:          .word   0
            .balign 4
num:          .word   0
            .balign 4
den:          .word   0
.text
        .global scanf
        .global printf
        .global main
main:
        LDR     R0, =ret
        STR     LR, [R0]

        LDR     R0, =frm_s
        LDR     R1, =cases
        BL      scanf

forCond:        
        LDR     R0, =i
        LDR     R0, [R0]
        LDR     R1, = cases
        LDR     R1, [R1]
        CMP     R0, R1
        BEQ     end
for:    
        LDR     R0, =frm_s
        LDR     R1, =a
        BL      scanf

        LDR     R0, =frm_s
        LDR     R1, =b
        BL      scanf
        BL      divModSimp
whileCond:
        LDR     R0, =modValue
        LDR     R0, [R0]
        CMP     R0, #0
        BEQ     endFor
while:
        LDR     R0, =divValue
        LDR     R0, [R0]
        ADD     R0, R0, #1
        LDR     R1, =divValue
        STR     R0, [R1]

        LDR     R0, =frm_p
        LDR     R1, =divValue
        LDR     R1, [R1]
        BL      printf

        LDR     R0, =a
        LDR     R0, [R0]
        LDR     R1, =b
        LDR     R1, [R1]
        LDR     R2, =divValue
        LDR     R2, [R2]
        BL      restFrac
        LDR     R2, =a
        STR     R0, [R2]
        LDR     R2, =b
        STR     R1, [R2]
	BL	divModSimp
        BAL     whileCond

endFor:
        LDR     R0, =frm_p
        LDR     R1, =b
        LDR     R1, [R1]
        BL      printf
        LDR     R0, =frm_p
        MOV     R1, #0
        BL      printf

        LDR     R0, =i
        LDR     R0, [R0]
        ADD     R0, R0, #1
        LDR     R1, =i
        STR     R0, [R1]
        BAL     forCond

end:    LDR     R0, =ret
        LDR     LR, [R0]
        MOV     R0, #0
        BX      LR

@Funcion de apoyo para calcular la division modulo y simplificar la fraccion
divModSimp:
        LDR R2, =divModSimpReturn
        STR LR, [R2]

        LDR     R0, =b
        LDR     R0, [R0]
        LDR     R1, =a
        LDR     R1, [R1]
        BL      div
        LDR     R2, =divValue
        STR     R0, [R2]
        LDR     R2, =modValue
        STR     R1, [R2]

        LDR     R0, =a
        LDR     R0, [R0]
        LDR     R1, =b
        LDR     R1, [R1]
        BL      simp
        LDR     R2, =a
        STR     R0, [R2]
        LDR     R2, =b
        STR     R1, [R2]

        LDR LR,  =divModSimpReturn
        LDR LR,  [LR]
        BX  LR

@ Funcion que resta la fraccion a / b - 1 / d
restFrac:
        LDR R3, =restFracReturn
        STR LR, [R3]

        MUL R3, R0, R2  @ a * d
        SUB R3, R3, R1  @ ad - b / Numerador
        LDR R5, =num
        STR R3, [R5]

        MUL R4, R1, R2  @ b * d / Denominador
        LDR R5, =den
        STR R4, [R5]

        MOV R0, R3
        MOV R1, R4
        BL simp

        LDR LR,  =restFracReturn
        LDR LR,  [LR]
        BX  LR

@Funcion para simplificar la fracion a / b
simp:   LDR R2, =simpReturn
        STR LR, [R2]

        LDR R2, =simpA
        STR R0, [R2]
        LDR R2, =simpB
        STR R1, [R2]

        BL  gcd
        LDR     R2, =gcdValue
        STR     R0, [R2]

        LDR     R0, =simpA
        LDR     R0, [R0]
        LDR     R1, =gcdValue
        LDR     R1, [R1]
        BL      div
        LDR     R2, =simpA
        STR     R0, [R2]

        LDR     R0, =simpB
        LDR     R0, [R0]
        LDR     R1, =gcdValue
        LDR     R1, [R1]
        BL      div
        LDR     R2, =simpB
        STR     R0, [R2]

        LDR     R0, =simpA
        LDR     R0, [R0]
        LDR     R1, =simpB
        LDR     R1, [R1]

        LDR LR,  =simpReturn
        LDR LR,  [LR]
        BX  LR


@ Funcion de dividir R0 entre R1 y encontrar su modulo
div:    LDR R2, =divReturn
        STR LR, [R2]

        LDR R2, =divD
        STR R0, [R2]    @ d = a
        LDR R2, =divI
        MOV R3, #0
        STR R3, [R2]    @ i = 0
divCond:
        LDR R2, =divD
        LDR R2, [R2]
        CMP R2, R1
        BLT divEndWhile
        BAL divWhile
divWhile: 
        LDR R2, =divD
        LDR R2, [R2]
        SUB R2, R2, R1  
        MOV R3, R2
        LDR R2, =divD
        STR R3, [R2]    @d -= b

        LDR R2, =divI
        LDR R2, [R2]
        ADD R2, R2, #1
        MOV R3, R2
        LDR R2, =divI
        STR R3, [R2]    @ i++
        BAL divCond
divEndWhile:
        LDR R0, =divI
        LDR R0, [R0]
        LDR R1, =divD
        LDR R1, [R1]
        LDR LR,  =divReturn
        LDR LR,  [LR]
        BX  LR

@ Funcion para hallar el GCD entre R0 y R1
gcd:    LDR R2, =gcdReturn
        STR LR, [R2]
gcdcondwhile:  CMP R0, R1
            BEQ gcdEndWhile     @ a == b
            CMP R0, R1
            BLE gcdIfElse
            SUB R0, R0, R1
            BAL gcdcondwhile
gcdIfElse:  SUB R1, R1, R0
            BAL gcdcondwhile
gcdEndWhile: 
        LDR LR,  =gcdReturn
        LDR LR,  [LR]
        BX  LR

.end

