@  Use of Thumb code on Raspberry Pi 
@  This divide routine is R0/R1      
@  with R2=MOD and R3=DIV            
	
	.global main
	.func main
	.arm
	
main:
	ADR R0, thumbcode+1
	MOV LR, PC
	BX R0

exit:	MOV R0, #0
	MOV R7, #1
	SWI 0

@ All Thumb code to be placed here 
	.thumb

thumbcode:
	MOV R3, #0	

loop:
	ADD R3, #1
	SUB R0, R1
	BGE loop
	SUB R3, #1
	ADD R2, R0, R1
	BX LR	@ Return to ARM

