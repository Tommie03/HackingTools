# Linux — Service Enumeration

| Tool | What it's for | Quick command |
|---|---|---|
| **[enum4linux-ng](https://github.com/cddmp/enum4linux-ng)** | SMB/AD enum from a Linux box — shares, users, password policy, OS info. | `enum4linux-ng -A <ip>` |
| **[smbmap](https://github.com/ShawnDEvans/smbmap)** | Quick view of SMB share permissions — what you can read/write without mounting anything. | `smbmap -H <ip> -u user -p pass` |
| **[smbclient](https://www.samba.org/samba/docs/current/man-html/smbclient.1.html)** | Interactive SMB client for browsing/pulling files off a share once you know it's accessible. | `smbclient //\<ip\>/share -U user` |
| **[rpcclient](https://www.samba.org/samba/docs/current/man-html/rpcclient.1.html)** | Low-level RPC queries against a DC — `enumdomusers`, `querydispinfo`, useful when null sessions are allowed. | `rpcclient -U "" -N <ip>` |
