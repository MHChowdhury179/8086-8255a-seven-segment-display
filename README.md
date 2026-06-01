## **8086-8255A Seven Segment Display Interfacing**

## **Project Overview**

This project demonstrates the interfacing of an 8086 microprocessor with a 7-segment display using the 8255A Programmable Peripheral Interface. The main goal is to understand how the 8086 communicates with peripheral devices and how control words are generated to perform output operations through the 8255A.

The experiment displays numerical digits from 0 to 9 on a 7-segment display using assembly-level programming and delay routines.

## **Objectives**
1. To understand the interfacing of the 8086 microprocessor with peripherals using the 8255A PPI.
2. To learn the process of generating control words for the 8255A.
3. To display numbers from 0 to 9 on a 7-segment display.
4. To observe the output behavior of a 7-segment display in a microprocessor-based system.

## **Required Apparatus and Software**

1. MDA8086 Microprocessor Kit
2. 8255A Programmable Peripheral Interface
3. 7-Segment Display
4. Notepad or any text editor
5. Assembly language tools or compatible 8086 development environment

## **Codes**


```asm
CODE    SEGMENT
        ASSUME  CS:CODE,DS:CODE,ES:CODE,SS:CODE
;
PPIC_C  EQU     1FH
PPIA    EQU     19H
;
        ORG     1000H
        MOV     AL,10000000B
        OUT     PPIC_C,AL
;
L2:     MOV     SI,OFFSET DATA
L1:     MOV     AL,BYTE PTR DS:[SI]
        CMP     AL,00H
        JE      L2
        OUT     PPIA,AL
        CALL    TIMER
        INC     SI
        JMP     L1
;
        INT     3
;
TIMER:  MOV     CX,0FFFFH
TIMER1: NOP
        NOP
        NOP
        LOOP    TIMER1
        RET
;
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
```
