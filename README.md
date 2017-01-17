systemd-notify-staticlink
=========================

This is an example of statically linking enough of the systemd library
into an application that you can call [`sd_notify`] without making
your binary dependent on `libsystemd.so`, which would prevent it from
running on systems without systemd. This adds a bit under 500 KB to
the binary on my Linux x86_64 system.

Why would you want to do this? Well, one of the problems that
[ewontfix] points out with systemd's notification mechanism is that
using the normal dynamic linking method your binary would have a
dependency on the systemd libraries and, worse yet, you wouldn't be
able to distribute the same binary to systems both with and without
systemd.

However, you may well be better off just checking for the
[`systemd-notify`] program and just running that if available.

Note that this does not fix other issues, such as if your program does
a chroot that makes the systemd socket unavailable to it before it
wants to send a notification. This obvious way to handle this would be
to open a connection to the socket before you chroot, but the
`systemd` API doesn't support that. (It can't really, since it uses
the connection close as the message boundary.)


[`sd_notify`]: https://www.freedesktop.org/software/systemd/man/sd_notify.html
[`systemd-notify`]: https://www.freedesktop.org/software/systemd/man/systemd-notify.html
[ewontfix]: https://ewontfix.com/15/
