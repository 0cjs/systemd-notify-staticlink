justnotifyd: justnotifyd.c Makefile
	cc -o $@ $< -lsystemd

# Unfortunately, libsystemd.a isn't available for CentOS
justnotifyd.static: justnotifyd.c Makefile
	cc -o $@ $< libsystemd.a
