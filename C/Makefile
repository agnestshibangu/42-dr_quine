CC = gcc
CFLAGS = -Wall -Wextra -Werror

COLLEEN_SRC = Colleen.c
COLLEEN_OUT = Colleen

GRACE_SRC = Grace.c
GRACE_OUT = Grace

SULLY_SRC = Sully.c
SULLY_OUT = Sully

.PHONY: all colleen grace sully clean fclean re

all: colleen grace sully

colleen: $(COLLEEN_OUT)

$(COLLEEN_OUT): $(COLLEEN_SRC)
	@echo "Compiling $@"
	@$(CC) $(CFLAGS) -o $@ $<

grace: $(GRACE_OUT)

$(GRACE_OUT): $(GRACE_SRC)
	@echo "Compiling $@"
	@$(CC) $(CFLAGS) -o $@ $<

sully: $(SULLY_OUT)

$(SULLY_OUT): $(SULLY_SRC)
	@echo "Compiling $@"
	@$(CC) $(CFLAGS) -o $@ $<

clean:
	@rm -f *.o
	@rm -f Sully_*

fclean: clean
	@rm -f $(COLLEEN_OUT) $(GRACE_OUT) $(SULLY_OUT)
	@rm -f Grace_kid.c
	@rm -f Sully_*.c

re: fclean all