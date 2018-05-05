.SUFFIXES: .hs
.PHONY: clean

GHC=ghc
GHCFLAGS=-O -Wall
TARGET=hanoi
OBJS=${TARGET}.o

all: ${TARGET}

${TARGET}: ${OBJS}
	$(GHC) $(GHCFLAGS) -o $@ ${OBJS}

.hs.o:
	$(GHC) -c $<

clean:
	-rm -f ${TARGET} *.o *.hi
