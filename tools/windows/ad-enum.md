# Windows — Active Directory Enumeration

| Tool | What it's for | Quick command |
|---|---|---|
| **[BloodHound](https://github.com/SpecterOps/BloodHound)** | Maps AD attack paths (who can DCSync, who's a member of what, kerberoastable users, etc) as a graph. The thing you open after collecting data. | Import data via the BloodHound CE GUI/API after collection |
| **[bloodhound-python](https://github.com/dirkjanm/BloodHound.py)** | BloodHound collector, runs from Linux — no need to land a binary on the DC. | `bloodhound-python -u user -p pass -d domain.local -ns <dc_ip> -c All` |
| **[SharpHound](https://github.com/SpecterOps/SharpHound)** | The official Windows-side BloodHound collector (.exe/.ps1), for when you've got a foothold and want a more complete collection. | `SharpHound.exe -c All` |
| **[bloodyAD](https://github.com/CravateRouge/bloodyAD)** | Swiss-army-knife for AD enum *and* abuse over LDAP — read attributes, add users to groups, set passwords, abuse GenericAll/WriteDacl, etc. One tool instead of five PowerView one-liners. | `bloodyAD --host dc01.domain.local -d domain.local -u user -p pass get writable` |
| **[PowerView](https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/PowerView.ps1)** | Classic PowerShell AD recon — `Get-NetUser`, `Get-NetGroupMember`, `Find-LocalAdminAccess`. Still useful when you're already in a PS session. | `Get-NetUser -SPN` |
| **[ADRecon](https://github.com/adrecon/ADRecon)** | Generates a full AD recon report (users, groups, GPOs, trusts, ACLs) as an Excel file — good for "I need everything" rather than a targeted query. | `.\ADRecon.ps1 -OutputDir .` |
| **[ldapdomaindump](https://github.com/dirkjanm/ldapdomaindump)** | Dumps AD via LDAP into browsable HTML — fast first look at a domain with just creds. | `ldapdomaindump -u 'domain\user' -p pass dc_ip` |
| **[enum4linux-ng](https://github.com/cddmp/enum4linux-ng)** | Null-session / low-priv SMB+LDAP enum — users, shares, password policy. First thing to try before you have any creds. | `enum4linux-ng -A -u '' -p '' <ip>` |
| **[Certipy](https://github.com/ly4k/Certipy)** | Enumerate and abuse AD CS (certificate templates) — ESC1-ESC16 misconfigs. Also does Kerberos auth via certs. | `certipy find -u user@domain.local -p pass -dc-ip <dc_ip> -vulnerable` |
