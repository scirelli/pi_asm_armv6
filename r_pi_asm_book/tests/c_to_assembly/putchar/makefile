FILE=prog21a

all: $(FILE)

$(FILE): $(FILE).s
	gcc -o $(FILE) $(FILE).s

clean:
	rm -f $(FILE) $(FILE).o

run:
	./$(FILE); echo $$?;
