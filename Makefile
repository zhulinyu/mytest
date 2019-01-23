CC = gcc
C++ = g++
LINK = g++

#LIBS = -lz -lm -lpcre
#must add -fPIC option
CCFLAGS = $(COMPILER_FLAGS) -c -g -fPIC
C++FLAGS = $(COMPILER_FLAGS) -c -g -fPIC

TARGET=libtestmain

INCLUDES = -I. -I../../

C++FILES = testmain.cpp 
CFILES = test.c test1.c test2.c

OBJFILE = $(CFILES:.c=.o) $(C++FILES:.cpp=.o)

all:$(TARGET)

$(TARGET): $(OBJFILE)
	$(LINK) $^ $(LIBS) -Wall -fPIC -o $@

%.o:%.c
	$(CC) -o $@ $(CCFLAGS) $< $(INCLUDES)

%.o:%.cpp
	$(C++) -o $@ $(C++FLAGS) $< $(INCLUDES)

install:
	tsxs -i -o $(TARGET)

clean:
	rm -rf $(TARGET)
	rm -rf $(OBJFILE)