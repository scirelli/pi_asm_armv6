FILE=printf3

all: $(FILE)

$(FILE): $(FILE).s
	gcc -g -o $(FILE) $(FILE).s

clean:
	rm -f $(FILE) $(FILE).o

run:
	./$(FILE); echo $$?;
