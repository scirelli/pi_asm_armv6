FILE=myarrays

all: $(FILE)

$(FILE): $(FILE).s
	gcc -g -o $(FILE) $(FILE).s

c_source:
	gcc -S -std=c99 -o $(FILE).s $(FILE).c

clean:
	rm -f $(FILE) $(FILE).o

run:
	./$(FILE); echo $$?;
