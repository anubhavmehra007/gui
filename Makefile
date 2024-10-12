SHELL := /bin/bash
CC := gcc
FLAGS := -lglfw3 -lGL -lX11 -lpthread -lXrandr -lXi -ldl
ENTRYPOINT := main.c
BIN := ./bin
OUTPUT := $(BIN)/gui
SRC := ./src/
SRCFILES := $(wildcard $(SRC)*.c)

all: $(ENTRYPOINT) createbin $(BIN) $(SRCFILES)
	@echo "Compiling..."
	@$(CC) $(ENTRYPOINT) $(SRCFILES) $(FLAGS) -o $(OUTPUT)

createbin:
	@echo "Creating Bin Directory"
	@-rm -rf $(BIN)
	@mkdir $(BIN)

run: all
	@echo "Running.."
	@$(OUTPUT)


clean: $(BIN)
	@-rm -rf $(BIN)
