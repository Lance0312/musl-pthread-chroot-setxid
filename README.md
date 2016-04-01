pthread + chroot + setxid
=========================

Compile with musl
-----------------

```bash
$ make LIBCDIR=/path/to/musl/lib
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