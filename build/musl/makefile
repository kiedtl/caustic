MUSL_URL = https://musl.libc.org/releases/musl-1.2.0.tar.gz

all: musl-src/MUSL_BUILD.tar

musl-src/MUSL_BUILD.tar:
	wget $(MUSL_URL) -O musl.tar.gz && \
		tar -xf musl.tar.gz && \
		mv musl-1.2.0 musl-src && \
		cd musl-src && \
		mkdir -p MUSL_BUILD && \
		./configure --prefix /usr --syslibdir /usr/lib && \
		make && \
		make DESTDIR=MUSL_BUILD install && \
		tar -cf MUSL_BUILD.tar MUSL_BUILD

clean:
	rm -rf musl.tar.gz musl-src/

.PHONY: all clean
