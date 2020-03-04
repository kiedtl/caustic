INSTALL = $(shell which install)
VI_URL  = https://sources.archlinux.org/other/vi/ex-070224.tar.xz

all: vi-src/VI_BUILD.tar

vi.tar.gz:
	wget $(VI_URL) -O vi.tar.gz

vi-src/VI_BUILD.tar: vi.tar.gz
	tar xf vi.tar.gz && \
		mv ex-070224 vi-src && \
		cd vi-src && \
		mkdir -p VI_BUILD && \
		make CFLAGS='-Os -DVMUNIX -I.' \
			LDFLAGS="-static -s" \
			TERMLIB=ncurses \
			LIBEXECDIR=/lib/ex \
			PRESERVEDIR=/var/lib/ex \
			FEATURES="-DCHDIR -DFASTTAG -DUCVISUAL -DMB -DBIT8" && \
		make PREFIX='' DESTDIR=VI_BUILD \
			INSTALL=$(INSTALL) install && \
		tar -cf VI_BUILD.tar VI_BUILD

clean:
	rm -rf vi.tar.gz vi-src/

.PHONY: all clean
