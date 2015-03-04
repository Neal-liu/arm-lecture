CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O3 -ggdb -Wall
LDFLAGS = -fno-stack-protector

objects	= example3_1.o

default: example3_1

.PHONY: default clean

example3: $(objects)
	$(CC) -o $@ $^

example3_1.o: example3_1.c

%.o: %.c
	$(CC) -c $(CFLAGS) $(LDFLAGS) -o $@ $<

clean:
	rm -f $(objects) example3

qemu: example3_1
	qemu-arm -L /usr/arm-linux-gnueabihf ./example3
