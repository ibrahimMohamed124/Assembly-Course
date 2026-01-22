ASM     = nasm
LD      = ld

ASMFLAGS = -f elf32
LDFLAGS  = -m elf_i386

SRC = print.asm
OBJ = print.o
BIN = print

.PHONY: all build run clean

all: build

build: $(BIN)

$(BIN): $(OBJ)
	$(LD) $(LDFLAGS) $(OBJ) -o $(BIN)

$(OBJ): $(SRC)
	$(ASM) $(ASMFLAGS) $(SRC) -o $(OBJ)

run: $(BIN)
	./$(BIN)

clean:
	rm -f $(OBJ) $(BIN)
