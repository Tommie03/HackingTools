# Linux — Privilege Escalation

| Tool | What it's for | Quick command |
|---|---|---|
| **[linPEAS](https://github.com/peass-ng/PEASS-ng)** | The first thing to run on any Linux foothold — same idea as winPEAS, sweeps SUID bins, cron jobs, kernel version, writable paths, creds in files. | `./linpeas.sh -a \| tee linpeas-out.txt` |
| **[linux-exploit-suggester (les2)](https://github.com/jondonas/linux-exploit-suggester-2)** | Matches kernel version against known local-root CVEs — useful when linPEAS flags an old kernel but you need exploit candidates. | `./linux-exploit-suggester-2.pl` |
| **[pspy](https://github.com/DominicBreuker/pspy)** | Watches running processes/cron without root — catches scheduled jobs running as root that you'd otherwise never see. Pairs well with a box that "looks clean" on linPEAS. | `./pspy64 -pf` |
| **[GTFOBins](https://gtfobins.github.io/)** | Not a tool, a reference — look up any SUID/sudo-allowed binary here to see the privesc one-liner for it. | n/a — browse the site |
