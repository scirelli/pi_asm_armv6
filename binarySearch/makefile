FILE=main

all: $(FILE)

$(FILE): $(FILE).s
	gcc -g -o $(FILE) $(FILE).s binarySearch.s ../lib/array/arrays.s

c_source:
	gcc -S -std=c99 -o $(FILE).s $(FILE).c

clean:
	rm -f $(FILE) $(FILE).o

run:
	./$(FILE); echo $$?;
