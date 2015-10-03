FILE=demo

LDFLAGS=-lncurses -g

all: $(FILE)

$(FILE): $(FILE).s
	gcc $(LDFLAGS) -o $(FILE) $(FILE).s

c_source:
	gcc -S -std=c99 -o $(FILE).s $(FILE).c

clean:
	rm -f $(FILE) $(FILE).o

run:
	./$(FILE); echo $$?;
