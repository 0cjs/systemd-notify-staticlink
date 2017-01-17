#include <stdio.h>
#include <unistd.h>
#include <systemd/sd-daemon.h>

int main() {
    sleep(1);
    int retval = sd_notify(0, "STATUS=I notified!");
    printf("sd_notify retval=%d\n", retval);
    sleep(1);
}
