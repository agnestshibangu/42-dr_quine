ASM = nasm
ASMFLAGS = -f elf64
CC = gcc
CFLAGS = -no-pie

COLLEEN_SRC = Colleen.s
COLLEEN_OUT = Colleen

GRACE_SRC = Grace.s
GRACE_OUT = Grace

SULLY_SRC = Sully.s
SULLY_OUT = Sully

.PHONY: all colleen grace sully clean fclean re

all: colleen grace sully

colleen: $(COLLEEN_OUT)

$(COLLEEN_OUT): $(COLLEEN_SRC)
	@echo "Assembling $@"
	@$(ASM) $(ASMFLAGS) -o Colleen.o $<
	@$(CC) $(CFLAGS) -o $@ Colleen.o

grace: $(GRACE_OUT)

$(GRACE_OUT): $(GRACE_SRC)
	@echo "Assembling $@"
	@$(ASM) $(ASMFLAGS) -o Grace.o $<
	@$(CC) $(CFLAGS) -o $@ Grace.o

sully: $(SULLY_OUT)

$(SULLY_OUT): $(SULLY_SRC)
	@echo "Assembling $@"
	@$(ASM) $(ASMFLAGS) -o Sully.o $<
	@$(CC) $(CFLAGS) -o $@ Sully.o

clean:
	@rm -f *.o
	@rm -f *.out
	@rm -f Sully_*


fclean: clean
	@rm -f $(COLLEEN_OUT) $(GRACE_OUT) $(SULLY_OUT)
	@rm -f Grace_kid.s
	@rm -f Sully_*.s

re: fclean all