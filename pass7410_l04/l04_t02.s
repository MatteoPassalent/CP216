/*
-------------------------------------------------------
l04_t02.s
-------------------------------------------------------
Author:  Matteo Passalent
ID:      210597410
Email:   pass7410@mylaurier.ca
Date:    2024-02-20
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

mov r1, #0
ldr r2, =Data    // Store address of start of list
ldr r3, =_Data   // Store address of end of list
mov r4, #0
sub r5, r3, r2

Loop:
ldr r0, [r2], #4 // Read address with post-increment (r0 = *r2, r2 += 4)
add r1, r1, r0
add r4, r4, #1
cmp r3, r2       // Compare current address with end of list
bne Loop         // If not at end, continue

_stop:
b _stop

.data
.align
Data:
.word 4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end