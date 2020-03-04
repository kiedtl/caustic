# Milestones

Please note that all size data was taken on a 32-bit setup (armv6l), so the
results may be different for you if your machine is 64-bit.

The size of the chroot was measured with
[diskus](https://github.com/sharkdp/diskus).

| date       | description                              | size of chroot |
|:----------:|:----------------------------------------:|:--------------:|
| 2020-03-02 | project started                          | 0 MiB          |
| 2020-03-03 | working chroot                           | 5.36 MiB       |
| 2020-03-03 | busybox => suckless sbase/ubase          | 5.30 MiB       |
| 2020-03-03 | add mrsh shell                           | 5.41 MiB       |
| 2020-03-04 | mrsh => loksh                            | 5.51 MiB       |
| 2020-03-04 | enable static linking && remove musl     | 1.92 MiB       |
| 2020-03-04 | add `vi` editor                          | 2.47 MiB       |
