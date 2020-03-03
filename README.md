## Caustic Linux

> How much space is needed for a minimal but usable Linux distribution?

(I guess it all depends on how you define usable.)

### Status

Highly experimental.

Please note that this Linux distro is slightly corrosive, and may cause some
damage if used without proper equipment and expertise.

- [x] planning phase
- [ ] working `chroot`
	- [ ] `musl` (IN PROGRESS)
	- [ ] shell  (IN PROGRESS)
	- [ ] coreutils
	- [ ] fetch script
	- [ ] core filesystem
		- e.g. `/etc/passwd`, `/etc/os-release`, `/etc/motd`, etc
- [ ] working boot (*on `x86_64`*)
	- [ ] kernel
	- [ ] init system

### Components

This project aims to fit the following components into as little space as
possible:

- init system
	- custom script with busybox init, or
	- [hummingbird](https://github.com/Sweets/hummingbird), or
	- `systemd`. After all, it's only 16MB, and it has service supervision, and...
- a shell
	- <s>dash, maybe</s>
	- the `ash` shell. We're using busybox anyway...
	- <s>why not a custom shell? :)</s>
- `musl` libc
- basic set of coreutils
	- stripped down busybox (or sbase)
	- bareutils(?) (*would require bash as shell...*)
- `util-linux`
	- either busybox or stock `util-linux`
- an editor
	- either `vi` or `nano`
	- a custom editor (forked from [dcat/she](https://github.com/dcat/she)(?)
	- oh wait, ed is the standard text editor. never mind.
- tiny fetch script
	- either a slightly modified version of
	[golfetch](https://github.com/dylanaraps/golfetch), or
	- a custom fetch script.
- kernel
- nothing else.
	- no service supervisor.
	- no windowing system.
	- no package manager/package system (as of now anyway...)
		- **small** chance it might be added later.
	- no web browser.
	- no unicorns or rainbows.
	- etc etc etc
