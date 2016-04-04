musl issue with pthread + chroot + setxid
=========================================

Clone
-----
```bash
$ git clone --recursive https://github.com/Lance0312/musl-pthread-chroot-setxid
```

Compile with musl
-----------------

```bash
$ ./build-musl.sh
$ make
```

Run
---

You have to run it with root permission, since `chroot()` and `setuid()` are
restricted to root permission.

```bash
$ sudo ./pthread-chroot-setxid
[+] Successfully chroot()'ed
[-] Cannot setuid(): No such file or directory
```