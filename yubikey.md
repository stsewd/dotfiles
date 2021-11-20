# Yubikey Setup

- Insert the yubikey and run `ykpamcfg -1 -v`
- Touch the yubikey to complete the operation
- A file will be generated
- Add this line to the files from `/etc/pam.d/` where you want to use the yubikey

```
auth        required  pam_yubico.so mode=challenge-response
```

Recomended files:

- `/etc/pam.d/su` (used by the `su` command)
- `/etc/pam.d/gdm-password` (used by the graphical interface at login)

More information at
https://developers.yubico.com/yubico-pam/Authentication_Using_Challenge-Response.html
