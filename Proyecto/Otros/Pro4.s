.data
        .balign 4
error:     .float   0f0.000001
        .balign 4
d1:     .float   0f0.0
        .balign 4
d2:     .float   0f0.0
        .balign 4
d3:     .float   0f0.0
        .balign 4
frm_s:  .asciz   "%f"
        .balign 4
frm_si:  .asciz   "%d"
        .balign 4
frm_p:  .asciz   "%f "
        .balign 4
frm_pEnd:  .asciz   "%s\n"
        .balign 4
eq:  .asciz   "equilatero"
        .balign 4
es:  .asciz   "escaleno"
        .balign 4
is:  .asciz   "isoceles"
        .balign 4
ret:    .word   0
        .balign 4
sideLenReturn:    .word   0
        .balign 4
perimeterReturn:    .word   0
        .balign 4
areaReturn:    .word   0
        .balign 4
triTypeReturn:    .word   0
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
        .balign 4
sideLenVal:   .float   0f0.0
        .balign 4
l1:     .float   0f0.0
        .balign 4
l2:     .float   0f0.0
        .balign 4
l3:     .float   0f0.0
        .balign 4
a2:     .float   0f0.0
        .balign 4
p:      .float   0f0.0
        .balign 4
sp:     .float   0f0.0
        .balign 4
triArea:     .float   0f0.0
        .balign 4
two:     .float   0f2.0
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
cases:     .word   0
        .balign 4
i:     .word   0
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
        LDR R0, =cases
        LDR R0, [R0]
        LDR R1, =i
        LDR R1, [R1]

        CMP R0, R1
        BEQ endFor
        BAL forBod
forBod:
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

        BL perimeter

        LDR R0, =p
	VSTR.F32 S0, [R0]

        BL area

        LDR R0, =triArea
	VSTR.F32 S0, [R0]

        LDR R0, =frm_p
        LDR R1, =p
        VLDR.F32 S0, [R1]
	VCVT.F64.F32 D0, S0
	VMOV R2, R3, D0

	BL printf

        LDR R0, =frm_p
        LDR R1, =triArea
        VLDR.F32 S0, [R1]
	VCVT.F64.F32 D0, S0
	VMOV R2, R3, D0

	BL printf

        BL triType
	
        LDR R0, =i
        LDR R0, [R0]
        ADD R0, R0, #1
        LDR R1, =i
        STR R0, [R1]

        BAL forCond
endFor:
        LDR R0, =ret
        LDR LR, [R0]
        MOV R0, #0
        BX LR

@ Function to find distance between 2 points
sideLen:
        LDR R4, =sideLenReturn
        STR LR, [R4]

        VSUB.F32 S4, S0, S2
        LDR R5, =x1_2   @ x1_2 = x1 - x2
        VSTR.F32 S4, [R5]

        VSUB.F32 S4, S1, S3
        LDR R5, =y1_2   @ y1_2 = y1 - y2
        VSTR.F32 S4, [R5]

        LDR R0, =x1_2
        VLDR.F32 S0, [R0]

        VMUL.F32 S1, S0, S0

        LDR R2, =x1_22  @ x1_22 = x1_2 ^ 2
        VSTR.F32 S1, [R2]

        LDR R0, =y1_2
        VLDR.F32 S0, [R0]

        VMUL.F32 S1, S0, S0
        LDR R2, =y1_22  @ y1_22 = y1_2 ^ 2
        VSTR.F32 S1, [R2]

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

        LDR LR,  =sideLenReturn
        LDR LR,  [LR]
        BX  LR 


@ Function to calculate the perimeter of the triangle
perimeter:
        LDR R6, =perimeterReturn
        STR LR, [R6]

        LDR R0, =x1
        VLDR.F32 S0, [R0]
        LDR R1, =y1
        VLDR.F32 S1, [R1]
        LDR R2, =x2
        VLDR.F32 S2, [R2]
        LDR R3, =y2
        VLDR.F32 S3, [R3]

        BL sideLen

        LDR R0, =l1
        VSTR.F32 S0, [R0]       @ Length of side 1

        LDR R0, =x2
        VLDR.F32 S0, [R0]
        LDR R1, =y2
        VLDR.F32 S1, [R1]
        LDR R2, =x3
        VLDR.F32 S2, [R2]
        LDR R3, =y3
        VLDR.F32 S3, [R3]

        BL sideLen

        LDR R0, =l2
        VSTR.F32 S0, [R0]       @ Length of side 2

        LDR R0, =x3
        VLDR.F32 S0, [R0]
        LDR R1, =y3
        VLDR.F32 S1, [R1]
        LDR R2, =x1
        VLDR.F32 S2, [R2]
        LDR R3, =y1
        VLDR.F32 S3, [R3]

        BL sideLen

        LDR R0, =l3
        VSTR.F32 S0, [R0]       @ Length of side 3

        LDR R0, =l1
        VLDR.F32 S0, [R0]
        LDR R0, =l2
        VLDR.F32 S1, [R0]
        LDR R0, =l3
        VLDR.F32 S2, [R0]

        VADD.F32 S3, S0, S1
        VADD.F32 S4, S3, S2

        VMOV S0, S4

        LDR LR,  =perimeterReturn
        LDR LR,  [LR]
        BX  LR 


@ Funtion to calculate the area of the triangle
area:
        LDR R0, =areaReturn
        STR LR, [R0]

        LDR R0, =p
        VLDR.F32 S0, [R0]
        LDR R0, =two
        VLDR.F32 S2, [R0]

        VDIV.F32 S1, S0, S2
        LDR R0, =sp
        VSTR.F32 S1, [R0]       @ Calculating the semi perimeter

        LDR R0, =sp
        VLDR.F32 S0, [R0]

        LDR R0, =l1
        VLDR.F32 S1, [R0]

        LDR R0, =l2
        VLDR.F32 S2, [R0]

        LDR R0, =l3
        VLDR.F32 S3, [R0]

        VSUB.F32 S4, S0, S1     @ Calculating sa = sp - l1
        VSUB.F32 S5, S0, S2     @ Calculating sb = sp - l2
        VSUB.F32 S6, S0, S3     @ Calculating sc = sp - l3

        VMUL.F32 S7, S0, S4     @ Calculating sp * sa
        VMUL.F32 S8, S7, S5     @ Calculating sp * sa * sb
        VMUL.F32 S9, S8, S6     @ Calculating sp * sa * sb * sc

        VSQRT.F32 S0, S9        @ Square root of the multiplication is the area

        LDR LR,  =areaReturn
        LDR LR,  [LR]
        BX  LR 

@ Function to decide which type of triangle we have
triType:
        LDR R0, =triTypeReturn
        STR LR, [R0]

        LDR R0, =l1
        VLDR.F32 S0, [R0]
        LDR R0, =l2
        VLDR.F32 S1, [R0]
        LDR R0, =l3
        VLDR.F32 S2, [R0]

        VSUB.F32 S3, S0, S1
        VABS.F32 S4, S3
        LDR R0, =d1
        VSTR.F32 S4, [R0]

        VSUB.F32 S3, S1, S2
        VABS.F32 S4, S3
        LDR R0, =d2
        VSTR.F32 S4, [R0]

        VSUB.F32 S3, S0, S2
        VABS.F32 S4, S3
        LDR R0, =d3
        VSTR.F32 S4, [R0]

        LDR R0, =d1
        VLDR.F32 S0, [R0]       @ S0 = d1
        LDR R0, =d2
        VLDR.F32 S1, [R0]       @ S1 = d2
        LDR R0, =d3
        VLDR.F32 S2, [R0]       @ S2 = d3

        LDR R0, =error
        VLDR.F32 S3, [R0]       @ S3 = error

if:
        VCMP.F32 S0, S3
        VMRS APSR_nzcv, FPSCR
        BLE ifif
        BAL elif
ifif:
        VCMP.F32 S1, S3
        VMRS APSR_nzcv, FPSCR
        BLE ififBody
        BAL elif
ififBody:
        LDR R0, =frm_pEnd
        LDR R1, =eq

	BL printf

        BAL end
elif:
        VCMP.F32 S0, S3
        VMRS APSR_nzcv, FPSCR
        BGT elifif
        BAL else
elifif:
        VCMP.F32 S1, S3
        VMRS APSR_nzcv, FPSCR
        BGT elififif
        BAL else
elififif:
        VCMP.F32 S2, S3
        VMRS APSR_nzcv, FPSCR
        BGT elifififBody
        BAL else
elifififBody:
        LDR R0, =frm_pEnd
        LDR R1, =es

	BL printf

        BAL end
else:      
        LDR R0, =frm_pEnd
        LDR R1, =is

	BL printf

        BAL end
end: 
        LDR LR,  =triTypeReturn
        LDR LR,  [LR]
        BX  LR 
.end

