FILE=chars

LDFLAGS=-lncurses -std=c11 -g

all: $(FILE)

$(FILE): ${FILE}.c
	gcc ${LDFLAGS} -o $(FILE) $(FILE).c

c_source:
	gcc -S -std=c99 -o $(FILE).s $(FILE).c

clean:
	rm -f $(FILE) $(FILE).o

run:
	./$(FILE); echo $$?;
