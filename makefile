PROJDIR		= $(shell pwd)
CHROOTDIR	= root

all: options

options:
	@echo Run \`make chroot\` to build the core packages and create the
	@echo root directories, which you can then chroot into.

chroot: $(CHROOTDIR)
$(CHROOTDIR): build
	mkdir -p $(CHROOTDIR) && \
		cd $(CHROOTDIR) && \
		rm -rf ./* && \
		tar xvf $(PROJDIR)/build/corefs/corefs-src/COREFS_BUILD.tar && \
		tar xvf $(PROJDIR)/build/mrsh/mrsh-src/MRSH_BUILD.tar && \
		tar xvf $(PROJDIR)/build/musl/musl-src/MUSL_BUILD.tar && \
		tar xvf $(PROJDIR)/build/sbase/sbase-src/SBASE_BUILD.tar && \
		tar xvf $(PROJDIR)/build/sysinfo/sysinfo-src/SYSINFO_BUILD.tar && \
		tar xvf $(PROJDIR)/build/ubase/ubase-src/UBASE_BUILD.tar && \
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

build/corefs/corefs-src/COREFS_BUILD.tar: build/corefs/makefile
	cd build/corefs && make all

build/mrsh/mrsh-src/MRSH_BUILD.tar: build/mrsh/makefile
	cd build/mrsh && make all


build/musl/musl-src/MUSL_BUILD.tar: build/musl/makefile
	cd build/musl && make all

build/sbase/sbase-src/SBASE_BUILD.tar: build/sbase/config.mk \
		build/sbase/makefile
	cd build/sbase && make all

build/sysinfo/sysinfo-src/SYSINFO_BUILD.tar: build/sysinfo/makefile
	cd build/sysinfo && make all

build/ubase/ubase-src/UBASE_BUILD.tar: build/ubase/config.mk \
		build/ubase/makefile \
		build/ubase/fixhdr
	cd build/ubase/ && make all

clean:
	cd build/corefs && make clean
	cd build/mrsh && make clean all
	cd build/musl && make clean all
	cd build/sysinfo && make clean all
	cd build/sbase && make clean all
	cd build/ubase && make clean all

.PHONY: all chroot $(CHROOTDIR) build clean
