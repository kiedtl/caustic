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
		- [x] shell (busybox `ash`)
		- [x] coreutils (busybox)
		- [x] fetch script
		- [x] core filesystem
	- [ ] working boot (*on `x86_64`*)
		- [ ] kernel
		- [ ] init system
	- [ ] editor
- [ ] minification

### Components

This project aims to fit the following components into as little space as
possible:

- init system
	- **custom script with busybox init**
	- <s>[hummingbird](https://github.com/Sweets/hummingbird), or</s>
	- <s>`systemd`. After all, it's only 16MB, and it has service supervision, and...</s>
- a shell
	- <s>dash, maybe</s>
	- **the `ash` shell. We're using busybox anyway.**
	- <s>why not a custom shell.</s>
- `musl` libc
- basic set of coreutils with `util-linux`
	- **stripped down busybox.**
	- <s>bareutils (would require bash as shell...)</s>
- an editor
	- either `vi` or `nano`
	- a custom editor (forked from [dcat/she](https://github.com/dcat/she)(?))
	- oh wait, ed is the standard text editor. never mind.
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
