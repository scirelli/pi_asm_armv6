all: hello

hello: hello.o
	ld -s -o hello hello.o

hello.o: hello.S
	as -o hello.o hello.S

.PHONY: clean

clean:
	rm -f *o hello
