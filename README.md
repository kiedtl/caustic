## Caustic Linux

> How much space is needed for a minimal (*but usable*) Linux distribution?

(I guess it all depends on how you define usable.)

### Status

Highly experimental.

Please note that this Linux distro is slightly corrosive, and may cause
damage if used without proper equipment and expertise.

- [x] planning phase
- [ ] get a working system first.
	- [x] working `chroot`
		- [x] libc (`musl`)
		- [ ] shell (`dash`)
		- [ ] coreutils (sbase + ubase)
		- [x] fetch script
		- [x] core filesystem
	- [ ] working boot (*on `x86_64`*)
		- [ ] kernel
		- [ ] init system
	- [ ] editor
	- [ ] `man`
- [ ] minification

### Components

This project aims to fit the following components into as little space as
possible:

- init system
	- **custom script with busybox init**
	- <s>[hummingbird](https://github.com/Sweets/hummingbird), or</s>
	- <s>`systemd`. After all, it's only 16MB, and it has service supervision, and...</s>
- a shell
	- **dash**
	- <s>the `ash` shell.</s>
	- <s>why not a custom shell.</s>
- `musl` libc
- basic set of coreutils with `util-linux`
	- <s>stripped down busybox.</s>
	- <s>bareutils (would require bash as shell...)</s>
	- **sbase** + ubase
- an editor
	- **`vi`**
	- <s> a custom editor</s>
	- <s>oh wait, ed is the standard text editor. never mind.</s>
- `man`
	- includes the manual pages for sbase and ubase.
- tiny fetch script
	- **a slightly modified version of
	[golfetch](https://github.com/dylanaraps/golfetch)
	(see: [caustic-sysinfo](https://github.com/kiedtl/caustic-sysinfo))**
	- <s>a custom fetch script.</s>
- kernel
- nothing else.
	- no service supervisor.
	- no windowing system. (X11, Wayland, whatever)
	- no package manager/package system (as of now anyway...)
	- no unicorns or rainbows.
	- etc etc etc

### FAQ

- **Q**: Why are the manpages included for sbase/ubase? Won't that increase the size significantly?
	- **A**: 1) sbase and ubase have horrible `--help` messages, so the manpage is a must. 2) manpages are included in my definition of "usable".
