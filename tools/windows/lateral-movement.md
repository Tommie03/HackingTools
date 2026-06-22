# Windows — Lateral Movement & Remote Access

| Tool | What it's for | Quick command |
|---|---|---|
| **[evil-winrm](https://github.com/Hackplayers/evil-winrm)** | Interactive WinRM shell — usually the easiest remote shell on a domain box once you've got creds/hash. Supports upload/download and loading PowerShell modules in-session. | `evil-winrm -i <ip> -u user -p pass` |
| **[NetExec (nxc)](https://github.com/Pennyw0rth/NetExec)** | Swiss-army-knife for SMB/WinRM/MSSQL/LDAP — spray creds across a whole subnet, check local admin access, dump SAM, execute commands. Successor to CrackMapExec. | `nxc smb <ip_range> -u user -p pass --shares` |
| **[Impacket exec scripts](https://github.com/fortra/impacket)** | `psexec.py`, `wmiexec.py`, `smbexec.py` — different execution methods when one gets blocked by AV/EDR or needs different privileges. | `wmiexec.py domain.local/user:pass@<ip>` |
| **[xfreerdp](https://github.com/FreeRDP/FreeRDP)** | Full RDP client from Linux when you need a GUI session, not just a shell. | `xfreerdp /v:<ip> /u:user /p:pass /dynamic-resolution` |
| **[Responder](https://github.com/lgandx/Responder)** | LLMNR/NBT-NS/mDNS poisoner — captures NetNTLM hashes from broadcast traffic, often the first foothold on an AD-heavy box. | `responder -I <interface>` |
