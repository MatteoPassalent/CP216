/*
-------------------------------------------------------
errors3.s
-------------------------------------------------------
Author: Matteo Passalent
ID: 210597410
Email: pass7410@mylaurier.ca
Date: 2024-01-28
-------------------------------------------------------
Copies contents of one vector to another.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Copy contents of first element of Vec1 to Vec2
ldr r0, =Vec1
ldr r1, =Vec2
ldr r2, [r0]
str r2, [r1]
// Copy contents of second element of Vec1 to Vec2
add r0, r0, #4
add r1, r1, #4
ldr r2, [r0]
str r2, [r1]
// Copy contents of third element of Vec1 to Vec2
add r0, r0, #4
add r1, r1, #4
ldr r2, [r0]
str r2, [r1]
// End program
_stop:
b _stop

.data // Initialized data section
Vec1:
.word 1, 2, 3
Vec2:
.word 6
.space 8

.end