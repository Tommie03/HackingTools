# Windows — Kerberos & Credential Attacks

| Tool | What it's for | Quick command |
|---|---|---|
| **[Impacket](https://github.com/fortra/impacket)** | The toolbox for basically every Kerberos/SMB attack from Linux. `secretsdump.py`, `GetUserSPNs.py`, `GetNPUsers.py`, `getTGT.py` cover 90% of cases. | `GetUserSPNs.py domain.local/user:pass -dc-ip <dc_ip> -request` (kerberoast) |
| **[Rubeus](https://github.com/GhostPack/Rubeus)** | Kerberos abuse from a Windows foothold — ticket requests, kerberoasting, AS-REP roasting, ticket renewal, overpass-the-hash. | `Rubeus.exe kerberoast /outfile:hashes.txt` |
| **[mimikatz](https://github.com/gentilkiwi/mimikatz)** | Dumps creds/hashes/tickets from LSASS memory — `sekurlsa::logonpasswords`, golden/silver ticket creation, DCSync. Heavily AV-flagged; expected, not a bug. | `mimikatz # sekurlsa::logonpasswords` |
| **[kerbrute](https://github.com/ropnop/kerbrute)** | Fast username enumeration + password spraying against Kerberos pre-auth, without triggering normal account lockout logging as easily. | `kerbrute userenum -d domain.local --dc <dc_ip> userlist.txt` |
| **[Certipy](https://github.com/ly4k/Certipy)** | Also belongs here — requesting certs and turning them into TGTs/NTLM hashes via ESC abuse. | `certipy req -u user@domain.local -p pass -ca CA-NAME -template Template` |
| **[SharpDPAPI / SharpChrome](https://github.com/GhostPack/SharpDPAPI)** | Decrypt DPAPI-protected secrets (saved creds, browser passwords) once you've got a foothold. Both ship pre-built in SharpCollection. | `SharpDPAPI.exe machinetriage` |
| **[ntlmrelayx.py](https://github.com/fortra/impacket/blob/master/examples/ntlmrelayx.py)** | Relays captured NTLM auth (e.g. from Responder) to another service instead of just cracking the hash — often a faster path to a shell. | `ntlmrelayx.py -t smb://<target> -smb2support` |
