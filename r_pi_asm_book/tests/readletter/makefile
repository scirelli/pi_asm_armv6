PROGRAMS=readkb
ifneq ($(MAKECMDGOALS),)
	PROGRAMS=$(MAKECMDGOALS)
endif

#The default rule if none specified on the command line
all: $(PROGRAMS)

#Make knows how to compile .s files, so all we need to do is link them
# $@ is the name of the file being generated.
# $< the first prerequisite (usually the source file).
# They are automatioc variables.
# This is equivalent to $@. The input file is hello.c and hello.h. This is equivalent to $<. The -c flag is to generate the .o file. The '-o' means the output. For further details, you can check here.
$(PROGRAMS): %: %.o
	ld -o $@ $<

clean:
	rm -f *.o $(PROGRAMS)
