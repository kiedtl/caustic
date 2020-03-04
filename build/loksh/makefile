LOKSH_URL    = https://github.com/dimkr/loksh/archive/6.6.tar.gz

all: loksh.tar.gz loksh-src/LOKSH_BUILD.tar

loksh.tar.gz:
	wget $(LOKSH_URL) -O loksh.tar.gz

loksh-src/LOKSH_BUILD.tar:
	rm -rf loksh-src/
	tar -xf loksh.tar.gz
	mv loksh-6.6 loksh-src
	cd loksh-src && \
		mkdir -p LOKSH_BUILD && \
		make \
			CFLAGS="-Os -s" \
			LDFLAGS=-static \
			NCURSES_LDFLAGS=-lncurses && \
		make DESTDIR=LOKSH_BUILD install && \
		mkdir -p LOKSH_BUILD/bin && \
		ln -s /usr/bin/ksh LOKSH_BUILD/bin/sh && \
		tar -cf LOKSH_BUILD.tar LOKSH_BUILD

clean:
	rm -rf loksh.tar.gz loksh-src

.PHONY: all clean
