.data
@Retornos
        .balign 4
ret:     .word   0
        .balign 4
min3Return:     .word   0
        .balign 4
triTypeReturn:     .word   0
        .balign 4
magnitudeReturn:     .word   0
        .balign 4
angleReturn:     .word   0
@Variables locales
    @ magnitude variables
        .balign 4
x1_2:   .float   0
        .balign 4
y1_2:   .float   0
        .balign 4
x1_22:  .float   0
        .balign 4
y1_22:  .float   0
        .balign 4
dis2:   .float   0
    @ angle variables
        .balign 4
magA:  .float  0f0.0
        .balign 4
magB:  .float  0f0.0
        .balign 4
angA1:  .float  0f0.0
        .balign 4
angA2:  .float  0f0.0
        .balign 4
angB1:  .float  0f0.0
        .balign 4
angB2:  .float  0f0.0
        .balign 4
angAB1:  .float  0f0.0
        .balign 4
angAB2:  .float  0f0.0
        .balign 4
dot:  .float  0f0.0
        .balign 4
magMul:  .float  0f0.0
    @ min3 variables
        .balign 4
minA:  .float  0f0.0
        .balign 4
minB:  .float  0f0.0
        .balign 4
minC:  .float  0f0.0
    @ triType variables
        .balign 4
minAng: .word   0
@Constantes / formatos
        .balign 4
obtuseTriangle:  .asciz   "obtusangulo"
        .balign 4
rightTriangle:  .asciz   "rectangulo"
        .balign 4
acutangleTriangle:  .asciz   "acutangulo"
        .balign 4
frm_pf:  .asciz   "%f\n"
        .balign 4
frm_p:  .asciz   "%s\n"
        .balign 4
frm_s:  .asciz   "%f"
        .balign 4
frm_si:  .asciz   "%d"
        .balign 4
zero:   .float   0f0.0
@ Global variables
        .balign 4
cases:  .word   0
        .balign 4
i:      .word   0
        .balign 4
x1:     .float   0
        .balign 4
y1:     .float   0
        .balign 4
x2:     .float   0
        .balign 4
y2:     .float   0
        .balign 4
x3:     .float   0
        .balign 4
y3:     .float   0
        .balign 4
ang1:     .float   0
        .balign 4
ang2:     .float   0
        .balign 4
ang3:     .float   0
.text
    .global scanf
    .global printf
    .global main
main:
    LDR R0, =ret
    STR LR, [R0]

    LDR R0, =frm_si
    LDR R1, =cases
    BL scanf

forCond:
    LDR R0, =i
    LDR R0, [R0]
    LDR R1, =cases
    LDr R1, [R1]

    CMP R0, R1
    BLT forBody
    BAL end

forBody:
    
    LDR R0, =frm_s
    LDR R1, =x1
    BL scanf
    
    LDR R0, =frm_s
    LDR R1, =y1
    BL scanf
    
    LDR R0, =frm_s
    LDR R1, =x2
    BL scanf
    
    LDR R0, =frm_s
    LDR R1, =y2
    BL scanf
    
    LDR R0, =frm_s
    LDR R1, =x3
    BL scanf
    
    LDR R0, =frm_s
    LDR R1, =y3
    BL scanf

    LDR R0, =x1
    VLDR.F32 S0, [R0]
    LDR R0, =y1
    VLDR.F32 S1, [R0]
    LDR R0, =x2
    VLDR.F32 S2, [R0]
    LDR R0, =y2
    VLDR.F32 S3, [R0]
    LDR R0, =x3
    VLDR.F32 S4, [R0]
    LDR R0, =y3
    VLDR.F32 S5, [R0]

    BL angle

    LDR R0, =ang1
    VSTR.F32 S0, [R0]   @ Calculo del primer angulo

        LDR R0, =frm_pf
        LDR R1, =ang1
        VLDR.F32 S0, [R1]
        VCVT.F64.F32 D0, S0
        VMOV R2, R3, D0

        

    LDR R0, =x2
    VLDR.F32 S0, [R0]
    LDR R0, =y2
    VLDR.F32 S1, [R0]
    LDR R0, =x1
    VLDR.F32 S2, [R0]
    LDR R0, =y1
    VLDR.F32 S3, [R0]
    LDR R0, =x3
    VLDR.F32 S4, [R0]
    LDR R0, =y3
    VLDR.F32 S5, [R0]

    BL angle

    LDR R0, =ang2
    VSTR.F32 S0, [R0]

    LDR R0, =frm_pf
        LDR R1, =ang2
        VLDR.F32 S0, [R1]
        VCVT.F64.F32 D0, S0
        VMOV R2, R3, D0

        

    LDR R0, =x2
    VLDR.F32 S0, [R0]
    LDR R0, =y2
    VLDR.F32 S1, [R0]
    LDR R0, =x3
    VLDR.F32 S2, [R0]
    LDR R0, =y3
    VLDR.F32 S3, [R0]
    LDR R0, =x1
    VLDR.F32 S4, [R0]
    LDR R0, =y1
    VLDR.F32 S5, [R0]

    BL angle

    LDR R0, =ang3
    VSTR.F32 S0, [R0]

    LDR R0, =frm_pf
        LDR R1, =ang3
        VLDR.F32 S0, [R1]
        VCVT.F64.F32 D0, S0
        VMOV R2, R3, D0

       

    LDR R0, =ang1
    VLDR.F32 S0, [R0]
    LDR R0, =ang2
    VLDR.F32 S1, [R0]
    LDR R0, =ang3
    VLDR.F32 S2, [R0]
    BL triType

    LDR R0, =i
    LDR R0, [R0]
    ADD R0, R0, #1
    LDR R1, =i
    STR R0, [R1]

    BAL forCond

end:
    LDR R0, =ret
    LDR LR, [R0]
    MOV R0, #0
    BX LR


@Funtion to calculate the magnitude of the vector defined by a point // Needs parameters
magnitude:
    LDR R2, =magnitudeReturn
    STR LR, [R2]
    
    VMUL.F32 S2, S0, S0
    
    LDR R2, =x1_22  @ x1_22 = x1_2 ^ 2
    VSTR.F32 S2, [R2]
    
    VMUL.F32 S2, S1, S1
    LDR R2, =y1_22  @ y1_22 = y1_2 ^ 2
    VSTR.F32 S2, [R2]
    
    LDR R0, =x1_22
    VLDR.F32 S0, [R0]
    LDR R1, =y1_22
    VLDR.F32 S1, [R1]
    
    VADD.F32 S2, S0, S1
    
    LDR R0, =dis2
    VSTR.F32 S2, [R0]    @ dis2 = x1_22 + y1_22
    
    LDR R0, =dis2
    VLDR.F32 S1, [R0]
    
    VSQRT.F32 S0, S1        @ Answer is dis ^ 1/2

    LDR LR,  =magnitudeReturn
    LDR LR,  [LR]
    BX  LR 


@Function to find the cosine of the angle described by 3 points // Needs parameters
angle:
    LDR R6, =angleReturn
    STR LR, [R6]

    VSUB.F32 S6, S0, S2
    LDR R0, =angA1
    VSTR.F32 S6, [R0]

    VSUB.F32 S6, S1, S3
    LDR R0, =angA2
    VSTR.F32 S6, [R0]

    VSUB.F32 S6, S4, S2
    LDR R0, =angB1
    VSTR.F32 S6, [R0]

    VSUB.F32 S6, S5, S3
    LDR R0, =angB2
    VSTR.F32 S6, [R0]

    LDR R0, =angA1
    VLDR.F32 S0, [R0]
    LDR R0, =angA2
    VLDR.F32 S1, [R0]
    LDR R0, =angB1
    VLDR.F32 S2, [R0]
    LDR R0, =angB2
    VLDR.F32 S3, [R0]

    VMUL.F32 S4, S0, S2
    LDR R0, =angAB1
    VSTR.F32 S4, [R0]

    VMUL.F32 S4, S1, S3
    LDR R0, =angAB2
    VSTR.F32 S4, [R0]

    LDR R0, =angAB1
    VLDR.F32 S0, [R0]
    LDR R0, =angAB2
    VLDR.F32 S1, [R0]

    VADD.F32 S2, S0, S1

    LDR R0, =dot
    VSTR.F32 S2, [R0]    @ End of dot product

    LDR R0, =angA1
    VLDR.F32 S0, [R0]
    LDR R0, =angA2
    VLDR.F32 S1, [R0]
    BL magnitude

    LDR R0, =magA
    VSTR.F32 S0, [R0]   @ Magnitud of A

    LDR R0, =angB1
    VLDR.F32 S0, [R0]
    LDR R0, =angB2
    VLDR.F32 S1, [R0]
    BL magnitude

    LDR R0, =magB
    VSTR.F32 S0, [R0]   @ Magnitud of B

    LDR R0, =magA
    VLDR.F32 S0, [R0]
    LDR R0, =magB
    VLDR.F32 S1, [R0]
    
    VMUL.F32 S2, S0, S1

    LDR R0, =magMul
    VSTR.F32 S2, [R0]   @ Multiplication of the magnitudes

    LDR R0, =dot
    VLDR.F32 S0, [R0]
    LDR R0, =magMul
    VLDR.F32 S1, [R0]

    VDIV.F32 S0, S0, S1

    LDR LR, =angleReturn
    LDR LR, [LR]
    BX  LR

@Function to find the type of triangle we have // Need parameters
triType:
    LDR R4, =triTypeReturn
    STR LR, [R4]

    BL min3

    LDR R0, =minAng
    VSTR.F32 S0, [R0]

    LDR R0, =minAng
    VLDR.F32 S0, [R0]
    LDR R0, =zero
    VLDR.F32 S1, [R0]

    VCMP.F32 S0, S1
    VMRS APSR_nzcv, FPSCR
    BLT obtuse
    BAL elif

elif:
    VCMP.F32 S0, S1
    VMRS APSR_nzcv, FPSCR
    BEQ right
    BAL acutangle

obtuse:
    LDR R0, =frm_p
    LDR R1, =obtuseTriangle
    BL printf
    
    BAL triTypeEnd

right:
    LDR R0, =frm_p
    LDR R1, =rightTriangle
    BL printf
    
    BAL triTypeEnd

acutangle:
    LDR R0, =frm_p
    LDR R1, =acutangleTriangle
    BL printf
    
    BAL triTypeEnd

triTypeEnd:
    LDR LR, =triTypeReturn
    LDR LR, [LR]
    BX  LR
@ Function to find the minimum between 3 numbers // Uses parameters
min3: 
    LDR R4, =min3Return
    STR LR, [R4]

    LDR R0, =minA
    VSTR.F32 S0, [R0]
    LDR R0, =minB
    VSTR.F32 S1, [R0]
    LDR R0, =minC
    VSTR.F32 S2, [R0]

    VCMP.F32 S0, S1
    VMRS APSR_nzcv, FPSCR
    BLE smallerMinA
    BAL smallerMinB

smallerMinA:
    VCMP.F32 S0, S2
    VMRS APSR_nzcv, FPSCR
    BLE minReturnA
    BAL minReturnB

smallerMinB:
    VCMP.F32 S1, S2
    VMRS APSR_nzcv, FPSCR
    BLE minReturnC
    BAL minReturnB

minReturnA:
    BAL minEnd
    
minReturnB:
    VMOV S0, S2
    BAL minEnd

minReturnC:
    VMOV S0, S1
    BAL minEnd

minEnd:
    LDR LR, =min3Return
    LDR LR, [LR]
    BX  LR
.end
