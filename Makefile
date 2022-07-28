EXE_C=c-prog
DIR_C=src/c
SRC_C=$(wildcard $(DIR_C)/*.c)

all: test

test: c-test

c-test: c-build c-run

c-build: $(EXE_C)

$(EXE_C): $(SRC_C)
	gcc -o $@ $^

c-run: $(EXE_C)
	./$(EXE_C)

clean: c-clean

c-clean:
	@rm -rf $(EXE_C)
