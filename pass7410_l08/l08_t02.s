/*
-------------------------------------------------------
l08_t02.s
-------------------------------------------------------
Author: Matteo Passalent
ID: 210597410
Email: pass7410@mylaurier.ca
Date: 2024-03-29
-------------------------------------------------------
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
*/
// Constants
.equ SIZE, 20 // Size of string buffer storage (bytes)

.org 0x1000   // Start at memory location 1000
.text         // Code section
.global _start
_start:

//=======================================================

// your code here
ldr r5, =SIZE

//=======================================================

ldr    r4, =First
bl    ReadString
ldr    r4, =Second
bl    ReadString
ldr    r4, =Third
bl     ReadString
ldr    r4, =Last
bl     ReadString

_stop:
b _stop

// Subroutine constants
.equ UART_BASE, 0xff201000  // UART base address
.equ ENTER, 0x0A            // The enter key code
.equ VALID, 0x8000          // Valid data in UART mask

ReadString:
/*
-------------------------------------------------------
Reads an ENTER terminated string from the UART.
-------------------------------------------------------
Parameters:
  r4 - address of string buffer
  r5 - size of string buffer
Uses:
  r0 - holds character to print
  r1 - address of UART
-------------------------------------------------------
*/

//=======================================================

// your code here
stmfd sp!, {r0, r1, r4, r5}     // preserve temporary registers
ldr   r1, =UART_BASE        // get address of UART

rsLOOP:
cmp r5, #0
beq _ReadString
ldr  r0, [r1]      // read the UART data register
tst  r0, #VALID    // check if there is new data
beq  _ReadString   // if no data, exit subroutine
strb r0, [r4]      // store the character in memory
sub r5, r5, #1
add  r4, r4, #1    // move to next byte in storage buffer
b    rsLOOP
_ReadString:
ldmfd sp!, {r0, r1, r4, r5}     // recover temporary registers

//=======================================================

bx    lr                    // return from subroutine

.data
.align
// The list of strings
First:
.space  SIZE
Second:
.space SIZE
Third:
.space SIZE
Last:
.space SIZE
_Last:    // End of list address

.end