# sbase version
VERSION = 0.0

# paths
PREFIX =
MANPREFIX = $(PREFIX)/share/man

CC = cc
AR = ar
RANLIB = ranlib

CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_FILE_OFFSET_BITS=64
CFLAGS   = -std=c99 -Wall -pedantic -Os
LDFLAGS  = -s -static
