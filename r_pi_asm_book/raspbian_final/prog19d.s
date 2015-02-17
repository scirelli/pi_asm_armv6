/******  Reading a number using scanf    *****/
/******  and printing it with prinf      *****/
 
		.global main
		.func main
main:
	PUSH {LR}		@ use pseudo directive
	SUB SP, SP, #4		@ make a word on stack

	LDR R0, addr_messin	@ get addr of messagein
	BL printf		@ and print it

	LDR R0, addr_format	@ get addr of format
	MOV R1, SP		@ place SP in R1
	BL scanf		@ and store entry on stack
		
	LDR R1, [SP]		@ get addr of scanf input
	LDR R0, addr_messout	@ get addr of messageout
	BL printf		@ print it all
	
	ADD SP, SP, #4		@ adjust stack
	POP {PC}		@ restore PC

_exit:
	MOV PC, LR       	@ simple exit

addr_messin:  .word messagein
addr_format:  .word scanformat
addr_messout: .word messageout

.data
messagein:    .asciz "Enter your number: "
scanformat:   .asciz "%d"
messageout:   .asciz "Your number was 0x%X\n"

