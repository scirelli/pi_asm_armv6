/* How to use Syscall 3 to read from keyboard */

	.global _start
_start:
_read:

	@ read syscall
	MOV R7, #3	@ Syscall number
 	MOV R0, #0	@ Stdout is monitor
	MOV R2, #5	@ read first 5 characters 
	LDR R1,=string	@ string placed at string:
	SWI 0

_write:
        @ write syscall
	MOV R7, #4	@ Syscall number
 	MOV R0, #1	@ Stdout is monitor
	MOV R2, #19	@string is 19 chars long
	LDR R1,=string	@ string located at start:
	SWI 0	
	
_exit:   
     @ exit syscall
	MOV R7, #1
	SWI 0

.data
string:
.ascii "Hello World String\n"

