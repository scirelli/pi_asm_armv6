FILE=demo

CC=gcc
#LIBS=-lpanel -lncurses 
LIBS=-lncurses 
LDFLAGS=-g -O3

all: $(FILE)

$(FILE): $(FILE).s
	${CC} $(LDFLAGS) $(LIBS) -o $(FILE) $(FILE).s

c_source:
	${CC} -S -std=c99 -o $(FILE).s $(FILE).c

clean:
	rm -f $(FILE) $(FILE).o

run: $(FILE)
	./$(FILE); echo $$?;
