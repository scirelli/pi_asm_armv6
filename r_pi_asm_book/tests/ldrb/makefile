FILE=ldrb

all: $(FILE)

$(FILE): $(FILE).o
	ld -o $(FILE) $(FILE).o

$(FILE).o: $(FILE).s
	as -g -o $(FILE).o $(FILE).s

clean:
	rm -f $(FILE) $(FILE).o

run:
	./$(FILE); echo $$?;
