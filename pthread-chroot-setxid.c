#include <errno.h>
#include <pthread.h>
#include <pwd.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

static void* dummyThread()
{
    void* ignore=0;
    pthread_exit(ignore);
}

void main() {
    struct passwd *pw=getpwnam("nobody");

    pthread_t tid;
    pthread_create(&tid, 0, dummyThread, 0);
    void* res;
    pthread_join(tid, &res);

    int ret = 0;

    ret = chroot("/var/empty");
    if (ret != 0) {
        printf("[-] Cannot chroot(): %s\n", strerror(errno));
    } else {
        printf("[+] Successfully chroot()'ed\n");
    }

    ret = setuid(pw->pw_uid);
    if (ret != 0) {
        printf("[-] Cannot setuid(): %s\n", strerror(errno));
    } else {
        printf("[+] Successfully setuid()'ed\n");
    }
}