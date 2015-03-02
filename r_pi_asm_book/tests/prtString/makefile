FILE=str

all: $(FILE)

$(FILE): $(FILE).o
	ld -o $(FILE) $(FILE).o

$(FILE).o: $(FILE).s
	as -o $(FILE).o $(FILE).s

clean:
	rm -f $(FILE) $(FILE).o

run:
	./$(FILE); echo $$?;
