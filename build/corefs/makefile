COREFS_URL = https://github.com/kiedtl/caustic-corefs/archive/0.1.0.tar.gz

all: corefs-src/COREFS_BUILD.tar

corefs-src/COREFS_BUILD.tar:
	wget $(COREFS_URL) -O corefs.tar.gz && \
		tar -xf corefs.tar.gz && \
		mv caustic-corefs-0.1.0 corefs-src && \
		cd corefs-src && \
		mkdir -p COREFS_BUILD && \
		make DESTDIR=COREFS_BUILD install && \
		tar -cf COREFS_BUILD.tar COREFS_BUILD

clean:
	rm -rf corefs.tar.gz corefs-src/

.PHONY: all clean
