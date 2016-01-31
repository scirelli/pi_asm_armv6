FILE=noeraseball

CC=gcc
#LIBS=-lpanel -lncurses 
LIBS=-lncurses 
LDFLAGS=-g -O3

SRC_DIR=.
EXE_DIR=./exe

${FILE}: ${FILE}.s
	${CC} $(LDFLAGS) $(LIBS) -o $@ $<

all: ${FILE}

clean:
	rm -f $(FILE) $(FILE).o

run: $(FILE)
	./$(FILE); echo $$?;
