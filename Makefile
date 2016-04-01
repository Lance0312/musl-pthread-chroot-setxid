TARGET = pthread-chroot-setxid
OBJ = $(TARGET).o
SRC = $(TARGET).c
CC = gcc
CFLAGS = -g
LDFLAGS = -nostdlib -nostartfiles -static
LIBCDIR = /tmp/musl/lib/
STARTFILES = $(LIBCDIR)/crt1.o $(LIBCDIR)/crti.o `gcc --print-file-name=crtbegin.o`
ENDFILES = `gcc --print-file-name=crtend.o` $(LIBCDIR)/crtn.o
LIBGROUP = -Wl,--start-group $(LIBCDIR)/libc.a -lgcc -lgcc_eh -Wl,--end-group

$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(STARTFILES) $^ $(LIBGROUP) $(ENDFILES) 

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $^


clean:
	rm -f *.o *.~ $(TARGET)