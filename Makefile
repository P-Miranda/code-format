EXE_C=c-prog
DIR_C=src/c
SRC_C=$(wildcard $(DIR_C)/*.c)

VENV=.venv
PYTHON_VENV=$(VENV)/bin/python3
DIR_PYTHON=src/python

all: test

test: c-test python-test

c-test: c-build c-run

c-build: $(EXE_C)

$(EXE_C): $(SRC_C)
	gcc -o $@ $^

c-run: $(EXE_C)
	./$(EXE_C)

clean: c-clean

c-clean:
	@rm -rf $(EXE_C)

setup: $(PYTHON_VENV)
	$(PYTHON_VENV) -m pip install black

$(PYTHON_VENV):
	python3 -m venv $(VENV)
	$(PYTHON_VENV) -m pip install --upgrade pip

python-test: $(PYTHON_VENV) python-run

python-run:
	$(PYTHON_VENV) $(DIR_PYTHON)/main.py
