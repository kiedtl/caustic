MUSL_URL	= https://musl.libc.org/releases/musl-1.2.0.tar.gz

all: build/musl/musl-src/MUSL_BUILD.tar

build/musl/musl-src/MUSL_BUILD.tar: build/musl/config.mak
	cd build/musl && \
		wget $(MUSL_URL) -O musl.tar.gz && \
		tar -xf musl.tar.gz && \
		mv musl-1.2.0 musl-src && \
		cd musl-src && \
		cp ../config.mak . && \
		mkdir MUSL_BUILD && \
		./configure && \
		make && \
		make install && \
		tar -cf MUSL_BUILD.tar MUSL_BUILD

clean:
	rm -rf build/musl/musl-src

.PHONY: all clean
