COREFS_URL	= https://github.com/kiedtl/caustic-corefs/archive/0.1.0.tar.gz
MRSH_URL	= git://github.com/emersion/mrsh
MUSL_URL	= https://musl.libc.org/releases/musl-1.2.0.tar.gz
SBASE_URL	= git://git.suckless.org/sbase
SYSINFO_URL	= https://github.com/kiedtl/caustic-sysinfo/archive/0.1.0.tar.gz
UBASE_URL	= git://git.suckless.org/ubase

all: options

options:
	@echo Run \`make root\` to build the core packages and create the
	@echo root directories, which you can then chroot into.

root: build
	rm -rf root && \
		mkdir root && \
		cd root && \
		tar xvf ../build/corefs/corefs-src/COREFS_BUILD.tar && \
		tar xvf ../build/mrsh/mrsh-src/MRSH_BUILD.tar && \
		tar xvf ../build/musl/musl-src/MUSL_BUILD.tar && \
		tar xvf ../build/sbase/sbase-src/SBASE_BUILD.tar && \
		tar xvf ../build/sysinfo/sysinfo-src/SYSINFO_BUILD.tar && \
		tar xvf ../build/ubase/ubase-src/UBASE_BUILD.tar && \
		cp -r COREFS_BUILD/* . && rm -rf COREFS_BUILD && \
		cp -r MRSH_BUILD/* . && rm -rf MRSH_BUILD && \
		cp -r MUSL_BUILD/* . && rm -rf MUSL_BUILD && \
		cp -r SBASE_BUILD/* . && rm -rf SBASE_BUILD && \
		cp -r SYSINFO_BUILD/* . && rm -rf SYSINFO_BUILD && \
		cp -r UBASE_BUILD/* . && rm -rf UBASE_BUILD

build:  build/corefs/corefs-src/COREFS_BUILD.tar \
	build/mrsh/mrsh-src/MRSH_BUILD.tar \
	build/musl/musl-src/MUSL_BUILD.tar \
	build/sbase/sbase-src/SBASE_BUILD.tar \
	build/sysinfo/sysinfo-src/SYSINFO_BUILD.tar \
	build/ubase/ubase-src/UBASE_BUILD.tar

build/corefs/corefs-src/COREFS_BUILD.tar:
	cd build/corefs && \
		wget $(COREFS_URL) -O corefs.tar.gz && \
		tar -xf corefs.tar.gz && \
		mv caustic-corefs-0.1.0 corefs-src && \
		cd corefs-src && \
		mkdir -p COREFS_BUILD && \
		make DESTDIR=COREFS_BUILD install && \
		tar -cf COREFS_BUILD.tar COREFS_BUILD

build/mrsh/mrsh-src/MRSH_BUILD.tar:
	cd build/mrsh && \
		git clone --depth=1 $(MRSH_URL) mrsh-src && \
		cd mrsh-src && \
		mkdir -p MRSH_BUILD && \
		./configure --prefix=/usr && \
		make CFLAGS="-Os -s" && \
		make DESTDIR=MRSH_BUILD install && \
		strip MRSH_BUILD/usr/bin/mrsh && \
		rm -rf MRSH_BUILD/usr/include MRSH_BUILD/usr/lib && \
		tar -cf MRSH_BUILD.tar MRSH_BUILD


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

build/sbase/sbase-src/SBASE_BUILD.tar: build/sbase/config.mk
	cd build/sbase && \
		git clone --depth=1 $(SBASE_URL) sbase-src && \
		cd sbase-src && \
		cp -f ../config.mk . && \
		mkdir -p SBASE_BUILD && \
		make DESTDIR=SBASE_BUILD sbase-box-install && \
		tar -cf SBASE_BUILD.tar SBASE_BUILD

build/ubase/ubase-src/UBASE_BUILD.tar: build/ubase/config.mk
	cd build/ubase && \
		git clone --depth=1 $(UBASE_URL) ubase-src && \
		cd ubase-src && \
		cp -f ../config.mk . && \
		mkdir -p UBASE_BUILD && \
		../fixhdr && \
		make DESTDIR=UBASE_BUILD ubase-box-install && \
		tar -cf UBASE_BUILD.tar UBASE_BUILD

clean:
	# TODO: remote *.tar.gz
	rm -rf build/corefs/corefs-src
	rm -rf build/musl/musl-src
	rm -rf build/sbase/sbase-src
	rm -rf build/sysinfo/sysinfo-src
	rm -rf build/ubase/ubase-src

.PHONY: all build clean
