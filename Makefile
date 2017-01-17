BINS = justnotifyd justnotifyd.static

all: ${BINS}

clean:
	rm -f ${BINS}

justnotifyd: justnotifyd.c Makefile
	cc -o $@ $< -lsystemd

# systemd doesn't build a static `libsystemd.a` for distribution,
# apparently, but does build a `libcore.a` which I guess would be used
# for statically linked binaries or whatever. So you need to point the
# following var to a checkout where you've built systemd from:
#     http://anongit.freedesktop.org/git/systemd/systemd.git
#
SYSTEMD_SRC=/home/cjs/co/freedesktop.org/systemd/systemd

justnotifyd.static: justnotifyd.c Makefile
	cc -o $@ $< ${SYSTEMD_SRC}/.libs/libcore.a -lrt
