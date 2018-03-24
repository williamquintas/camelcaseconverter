# Macros para compilacao
CC = gcc
CFLAGS = -Wextra -L/usr/local/opt/flex/lib -I/usr/local/opt/flex/include
DIR = src
FILENAME = $(DIR)/main.c
OBJNAME = $(DIR)/main.o
LIBNAME = $(DIR)/ccc_lib.c
LIBOBJ = $(DIR)/ccc_lib.o
TARGET = ./main
SRCS := $(shell find $(DIR) -name '*.c')
OBJS = $(SRCS:.c=.o)
LEX = lex
LEXSRCS := $(shell find $(DIR) -name '*.l')
LEXFLAGS = -lfl

# Macros para teste
BASH = sh
TEST_SCRIPT = test.sh
VERBOSE ?= 1

# Macros para construcao do zip
ZIP = zip
USERNAME ?= $(USER)
ZIPFILE = $(USERNAME).zip
EXTENSIONS = *.l *.c *.h *.in *.out *.sh

.PHONY: depend clean

all:lex $(TARGET)

$(TARGET):$(OBJNAME) $(LIBOBJ)
	$(CC) -o$(TARGET) $(OBJNAME) $(LIBOBJ) $(CFLAGS) $(LEXFLAGS)

$(OBJNAME):$(FILENAME)
	$(CC) $(CFLAGS) -c $< -o $@

$(LIBOBJ):$(LIBNAME)
	$(CC) $(CFLAGS) -c $< -o $@

lex:$(LEXSRCS)
	$(LEX) -o$(FILENAME) $(LEXSRCS)

test:all
	$(BASH) $(TEST_SCRIPT) $(TARGET) $(VERBOSE)

zip:clean
	$(ZIP) -R $(ZIPFILE)  Makefile $(EXTENSIONS)

clean:
	$(RM) $(FILENAME)
	$(RM) ./$(TARGET)
	$(RM) $(DIR)/*.o
	$(RM) ./$(ZIPFILE)
