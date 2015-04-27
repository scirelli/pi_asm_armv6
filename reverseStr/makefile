FILE=reversestr_asm

all: $(FILE)

$(FILE): $(FILE).s
	gcc -g -o $(FILE) $(FILE).s

clean:
	rm -f $(FILE) $(FILE).o
asm:
	as -o $(FILE).o $(FILE).s
	ld -o $(FILE) $(FILE).o
run:
	./$(FILE); echo $$?;
