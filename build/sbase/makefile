SBASE_URL = git://git.suckless.org/sbase

all: sbase-src/SBASE_BUILD.tar

sbase-src/SBASE_BUILD.tar:
	git clone --depth=1 $(SBASE_URL) sbase-src && \
		cd sbase-src && \
		cp -f ../config.mk . && \
		mkdir -p SBASE_BUILD && \
		make DESTDIR=SBASE_BUILD sbase-box-install && \
		tar -cf SBASE_BUILD.tar SBASE_BUILD

clean:
	rm -rf sbase-src/

.PHONY: all clean
