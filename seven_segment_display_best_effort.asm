; MDE-8086 Experiment Program
; Chapter 7-4 (Example 3)
; Program by MIDAS Engineering
; Source: transcribed from lab-report code screenshots.
; NOTE: Verify all addresses and bit patterns against the original hardware setup before running.

CODE    SEGMENT
        ASSUME  CS:CODE, DS:CODE, ES:CODE, SS:CODE

PPIC_C  EQU     1FH
PPIA    EQU     19H

        ORG     1000H
        MOV     AL,10000000B
        OUT     PPIC_C,AL

L2:     MOV     SI,OFFSET DATA
L1:     MOV     AL,BYTE PTR DS:[SI]
        CMP     AL,00H
        JE      L2
        OUT     PPIA,AL
        CALL    TIMER
        INC     SI
        JMP     L1

        INT     3

TIMER:  MOV     CX,0FFFFH
TIMER1: NOP
        NOP
        NOP
        LOOP    TIMER1
        RET

DATA:   DB      11111001B
        DB      10000000B
        DB      11000000B
        DB      11111001B
        DB      11111001B
        DB      10100100B
        DB      10110000B
        DB      00H

CODE    ENDS
        END
