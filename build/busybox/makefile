BUSYBOX_URL    = https://www.busybox.net/downloads/busybox-1.31.1.tar.bz2

all: busybox-src/BUSYBOX_BUILD.tar

busybox-src/BUSYBOX_BUILD.tar:
	wget $(BUSYBOX_URL) -O busybox.tar.bz2 && \
		tar -xf ./busybox.tar.bz2 && \
		mv busybox-1.31.1 busybox-src && \
		cd busybox-src && \
		mkdir -p BUSYBOX_BUILD && \
		cp ../.config . && \
		make && \
		make DESTDIR=BUSYBOX_BUILD install && \
		tar -cf BUSYBOX_BUILD.tar BUSYBOX_BUILD

clean:
	rm -rf busybox.tar.bz2 busybox-src/

.PHONY: all clean
