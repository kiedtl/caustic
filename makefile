BUSYBOX_URL	= https://www.busybox.net/downloads/busybox-1.31.1.tar.bz2
COREFS_URL	= https://github.com/kiedtl/caustic-corefs/archive/0.1.0.tar.gz
MUSL_URL	= https://musl.libc.org/releases/musl-1.2.0.tar.gz
SYSINFO_URL	= https://github.com/kiedtl/caustic-sysinfo/archive/0.1.0.tar.gz

all: build

build:  build/corefs/corefs-src/COREFS_BUILD.tar \
	build/busybox/busybox-src/BUSYBOX_BUILD.tar \
	build/musl/musl-src/MUSL_BUILD.tar \
	build/sysinfo/sysinfo-src/SYSINFO_BUILD.tar

build/corefs/corefs-src/COREFS_BUILD.tar:
	cd build/corefs && \
		wget $(COREFS_URL) -O corefs.tar.gz && \
		tar -xf corefs.tar.gz && \
		mv caustic-corefs-0.1.0 corefs-src && \
		cd corefs-src && \
		mkdir -p COREFS_BUILD && \
		make DESTDIR=COREFS_BUILD install && \
		tar -cf COREFS_BUILD.tar COREFS_BUILD


build/busybox/busybox-src/BUSYBOX_BUILD.tar: build/busybox/.config
	cd build/busybox && \
		wget $(BUSYBOX_URL) -O busybox.tar.gz && \
		tar -xf busybox.tar.gz && \
		mv busybox-1.31.1 busybox-src && \
		cd busybox-src && \
		cp ../.config . && \
		mkdir -p BUSYBOX_BUILD && \
		make && \
		make install && \
		tar -cf BUSYBOX_BUILD.tar BUSYBOX_BUILD


build/musl/musl-src/MUSL_BUILD.tar:
	cd build/musl && \
		wget $(MUSL_URL) -O musl.tar.gz && \
		tar -xf musl.tar.gz && \
		mv musl-1.2.0 musl-src && \
		cd musl-src && \
		mkdir -p MUSL_BUILD && \
		./configure --prefix /usr --syslibdir /usr/lib && \
		make && \
		make DESTDIR=MUSL_BUILD install && \
		mkdir -p MUSL_BUILD/usr/bin \
		tar -cf MUSL_BUILD.tar MUSL_BUILD

build/sysinfo/sysinfo-src/SYSINFO_BUILD.tar:
	cd build/sysinfo && \
		wget $(SYSINFO_URL) -O sysinfo.tar.gz && \
		tar -xf sysinfo.tar.gz && \
		mv caustic-sysinfo-0.1.0 sysinfo-src && \
		cd sysinfo-src && \
		mkdir -p SYSINFO_BUILD && \
		make DESTDIR=SYSINFO_BUILD install && \
		tar -cf SYSINFO_BUILD.tar SYSINFO_BUILD

clean:
	# TODO: remote *.tar.gz
	rm -rf build/busybox/busybox-src
	rm -rf build/corefs/corefs-src
	rm -rf build/musl/musl-src

.PHONY: all build clean
