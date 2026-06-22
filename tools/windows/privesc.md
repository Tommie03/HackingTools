# Windows — Privilege Escalation

| Tool | What it's for | Quick command |
|---|---|---|
| **[winPEAS](https://github.com/peass-ng/PEASS-ng)** | The first thing to run on any Windows foothold — sweeps misconfigs, creds, services, scheduled tasks, AV/EDR present, color-codes likely wins. | `winPEASany.exe quiet cmd` |
| **[PrivescCheck](https://github.com/itm4n/PrivescCheck)** | PowerShell equivalent of winPEAS — good when you can't get an .exe past AV/AMSI. | `Import-Module .\PrivescCheck.ps1; Invoke-PrivescCheck` |
| **[Seatbelt](https://github.com/GhostPack/Seatbelt)** | C# situational-awareness tool — broader system info than winPEAS, more aimed at red-team checks (AV, AppLocker, autologon creds). | `Seatbelt.exe -group=all` |
| **[PowerUp](https://github.com/PowerShellMafia/PowerSploit/tree/master/Privesc)** | Classic PowerShell privesc checks — unquoted service paths, weak service permissions, AlwaysInstallElevated. | `Invoke-AllChecks` |
| **[PrintSpoofer](https://github.com/itm4n/PrintSpoofer)** | Abuses `SeImpersonatePrivilege` (common on service accounts) to get SYSTEM via the print spooler — usually your go-to before trying Potato variants. | `PrintSpoofer64.exe -i -c cmd` |
| **[GodPotato](https://github.com/BeichenDream/GodPotato)** | Same `SeImpersonatePrivilege` → SYSTEM trick, works on newer Windows builds where the older Potato exploits got patched. | `GodPotato.exe -cmd "cmd /c whoami"` |
| **[SharpUp](https://github.com/GhostPack/Sharp/Up)** | C# port of PowerUp's checks, useful when you want a single .exe drop instead of a PowerShell session. | `SharpUp.exe audit` |
