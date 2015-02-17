	.global	main
	.func	main
main:
	PUSH {LR}
	MOV R0, #42
	BL	putchar
	POP {PC}
	@ MOV PC, LR

