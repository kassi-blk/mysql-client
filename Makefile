CC = gcc
CFLAGS = \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-parentheses \
	-g \
	`mysql_config --cflags` \
	`pkg-config --cflags gtk+-3.0`
LDFLAGS = \
	`mysql_config --libs` \
	`pkg-config --libs gtk+-3.0`
OBJS = main.o
BIN = prog

all: $(OBJS)
	$(CC) -o $(BIN) $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

.PHONY: clean
clean:
	rm -f *.o $(BIN)
