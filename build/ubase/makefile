UBASE_URL = git://git.suckless.org/sbase

all: ubase-src/UBASE_BUILD.tar

ubase-src/UBASE_BUILD.tar:
	git clone --depth=1 $(UBASE_URL) ubase-src && \
		cd ubase-src && \
		cp -f ../config.mk . && \
		mkdir -p UBASE_BUILD && \
		../fixhdr && \
		make DESTDIR=UBASE_BUILD ubase-box-install && \
		tar -cf UBASE_BUILD.tar UBASE_BUILD

clean:
	rm -rf ubase-src/

.PHONY: all clean
