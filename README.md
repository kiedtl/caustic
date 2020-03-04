## Caustic Linux

> How much space is needed for a minimal (*but usable*) Linux distribution?

(I guess it all depends on how you define usable.)

### Status

Highly experimental.

Please note that this Linux distro is slightly corrosive, and may cause
damage if used without proper equipment and expertise.

- [x] planning phase
- [ ] get a working system first.
	- [ ] working `chroot`
		- [x] shell (`loksh`)
		- [x] coreutils (sbase + ubase)
		- [x] fetch script
		- [x] core filesystem
		- [x] editor (`vi`)
		- [ ] the `man` utility
	- [ ] working boot (*on `x86_64`*)
		- [ ] kernel
		- [ ] init system
- [ ] minification

### Components

This project aims to fit the following components into as little space as
possible:

- init system
	- **custom script**
	- <s>[hummingbird](https://github.com/Sweets/hummingbird), or</s>
	- <s>`systemd`. After all, it's only 16MB, and it has service supervision, and...</s>
- a shell
	- **loksh** (see: [dimkr/loksh](https://github.com/dimkr/loksh))
	- <s>the `ash` shell.</s>
	- <s>why not a custom shell.</s>
- `musl` libc (*statically linked*)
- basic set of coreutils with `util-linux`
	- <s>stripped down busybox.</s>
	- <s>bareutils (would require bash as shell...)</s>
	- **sbase + ubase**
- an editor
	- **`vi`** (sorry)
	- <s> a custom editor</s>
	- oh wait, ed is the standard text editor. never mind.
- `man`
	- includes the manual pages for sbase and ubase.
- tiny fetch script
	- **a slightly modified version of
	[golfetch](https://github.com/dylanaraps/golfetch)
	(see: [caustic-sysinfo](https://github.com/kiedtl/caustic-sysinfo))**
- kernel
- nothing else.
	- no service supervisor.
	- no windowing system. (X11, Wayland, whatever)
	- no package manager/package system (as of now anyway...)
	- no unicorns or rainbows.
	- etc etc etc

### Build

You will need:
- GNU Make (bmake is untested...)
- POSIX-compatible `/bin/sh`
- `wget`
- `git`
- `tar`
- `find` and `xargs`

...in addition to a C99 compiler and the rest of the components needed to
build the kernel, sbase, ubase, and loksh. Please refer to those
project's documentation to ensure you have them all installed.

Then, retrieve the repository source via either `git` and `wget` and run:

```
$ make build
$ make chroot
```

This will create a `chroot`-able directory in `./root`. You may then use the
`scripts/caustic-chroot` script to `chroot` into the directory and run
`du -sh`.

**WARNING**: This project has only been tested on `armv6l`, so if you are using
a different architecture, you must **expect** most things to be broken and be
prepared to fix it yourself.

### FAQ

- **Q**: Why are the manpages included for sbase/ubase? Won't that increase the
  size significantly?
	- **A**: 1) sbase and ubase have horrible `--help` messages, so the
	  manpage is a must. 2) manpages are included in my definition of "usable".
