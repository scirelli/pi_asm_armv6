FILE=pi_fan

CC=gcc
LIBS=-lwireingPi
LDFLAGS=-g -O3

SRC_DIR=.
EXE_DIR=./exe

${FILE}: ${FILE}.s
	${CC} $(LDFLAGS) $(LIBS) -o $@ $<

all: ${FILE}

clean:
	rm -f $(FILE) $(FILE).o

run: $(FILE) 
	/opt/vc/bin/vcgencmd measure_temp | sudo ./pi_fan; echo $$?;

c_source:
	${CC} -S -std=c99 -o float.s float.c
