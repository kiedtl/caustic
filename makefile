MUSL_URL	= https://musl.libc.org/releases/musl-1.2.0.tar.gz
BUSYBOX_URL	= https://www.busybox.net/downloads/busybox-1.31.1.tar.bz2

all: build

build: build/busybox/busybox-src/BUSYBOX_BUILD.tar \
	build/musl/musl-src/MUSL_BUILD.tar \
	build/sysinfo/sysinfo


build/busybox/busybox-src/BUSYBOX_BUILD.tar: build/busybox/.config
	cd build/busybox && \
		wget $(BUSYBOX_URL) -O busybox.tar.gz && \
		tar -xf busybox.tar.gz && \
		mv busybox-1.31.1 busybox-src && \
		cd busybox-src && \
		cp ../.config . && \
		mkdir BUSYBOX_BUILD && \
		make && \
		make install && \
		tar -cf BUSYBOX_BUILD.tar BUSYBOX_BUILD


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
	# TODO: remote *.tar.gz
	rm -rf build/busybox/busybox-src
	rm -rf build/musl/musl-src

.PHONY: all build clean
