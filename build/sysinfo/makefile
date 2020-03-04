SYSINFO_URL = https://github.com/kiedtl/caustic-sysinfo/archive/0.2.0.tar.gz

all: sysinfo-src/SYSINFO_BUILD.tar

sysinfo-src/SYSINFO_BUILD.tar:
	wget $(SYSINFO_URL) -O sysinfo.tar.gz && \
		tar -xf sysinfo.tar.gz && \
		mv caustic-sysinfo-0.2.0 sysinfo-src && \
		cd sysinfo-src && \
		mkdir -p SYSINFO_BUILD && \
		make DESTDIR=SYSINFO_BUILD install && \
		tar -cf SYSINFO_BUILD.tar SYSINFO_BUILD

clean:
	rm -rf sysinfo.tar.gz sysinfo-src/

.PHONY: all clean
