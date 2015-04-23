.global	main
.func main
main:
    PUSH {LR}
	mov	r0, #42
	bl	putchar
    POP {PC}     @ pop what the LR we stored onto the stack in to the PC
