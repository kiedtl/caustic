MRSH_URL    = git://github.com/emersion/mrsh

all: mrsh-src/MRSH_BUILD.tar

mrsh-src/MRSH_BUILD.tar:
	git clone --depth=1 $(MRSH_URL) mrsh-src && \
		cd mrsh-src && \
		mkdir -p MRSH_BUILD && \
		./configure --prefix=/usr && \
		make CFLAGS="-Os -s -static" && \
		make DESTDIR=MRSH_BUILD install && \
		strip MRSH_BUILD/usr/bin/mrsh && \
		rm -rf MRSH_BUILD/usr/include MRSH_BUILD/usr/lib && \
		mkdir -p MRSH_BUILD/bin && \
		ln -s /usr/bin/mrsh MRSH_BUILD/bin/sh && \
		tar -cf MRSH_BUILD.tar MRSH_BUILD

clean:
	rm -rf mrsh-src

.PHONY: all clean
