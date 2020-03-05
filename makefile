PROJDIR		= $(shell pwd)
CHROOTDIR	= root

all: options

options:
	@echo
	@echo Run \`make chroot\` to build the core packages and create the
	@echo root directories, which you can then chroot into.
	@echo
	@echo You can then run \`make minify\` to minify the chroot.
	@echo

chroot: $(CHROOTDIR)
$(CHROOTDIR): build
	mkdir -p $(CHROOTDIR) && \
		cd $(CHROOTDIR) && \
		rm -rf ./* && \
		tar xvf $(PROJDIR)/build/corefs/corefs-src/COREFS_BUILD.tar && \
		tar xvf $(PROJDIR)/build/loksh/loksh-src/LOKSH_BUILD.tar && \
		tar xvf $(PROJDIR)/build/sbase/sbase-src/SBASE_BUILD.tar && \
		tar xvf $(PROJDIR)/build/sysinfo/sysinfo-src/SYSINFO_BUILD.tar && \
		tar xvf $(PROJDIR)/build/ubase/ubase-src/UBASE_BUILD.tar && \
		tar xvf $(PROJDIR)/build/vi/vi-src/VI_BUILD.tar && \
		cp -r COREFS_BUILD/* . && rm -rf COREFS_BUILD && \
		cp -r LOKSH_BUILD/* . && rm -rf LOKSH_BUILD && \
		cp -r SBASE_BUILD/* . && rm -rf SBASE_BUILD && \
		cp -r SYSINFO_BUILD/* . && rm -rf SYSINFO_BUILD && \
		cp -r UBASE_BUILD/* . && rm -rf UBASE_BUILD && \
		cp -r VI_BUILD/* . && rm -rf VI_BUILD

build:  build/corefs/corefs-src/COREFS_BUILD.tar \
	build/loksh/loksh-src/LOKSH_BUILD.tar \
	build/sbase/sbase-src/SBASE_BUILD.tar \
	build/sysinfo/sysinfo-src/SYSINFO_BUILD.tar \
	build/ubase/ubase-src/UBASE_BUILD.tar \
	build/vi/vi-src/VI_BUILD.tar

build/corefs/corefs-src/COREFS_BUILD.tar: build/corefs/makefile
	cd build/corefs && make all

build/loksh/loksh-src/LOKSH_BUILD.tar: build/loksh/makefile
	cd build/loksh && make all


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

build/vi/vi-src/VI_BUILD.tar: build/vi/makefile
	cd build/vi/ && make all

minify:
	@echo removing man pages and docs
	scripts/kill-man $(CHROOTDIR)

clean:
	cd build/corefs && make clean
	cd build/loksh && make clean
	cd build/sysinfo && make clean
	cd build/sbase && make clean
	cd build/ubase && make clean
	cd build/vi && make clean

.PHONY: all chroot $(CHROOTDIR) build minify clean
