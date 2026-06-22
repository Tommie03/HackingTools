# htb-toolkit

My personal HTB/pentest arsenal — a catalog of tools I actually use, organized
so I can scan for "what do I reach for here" instead of googling it again,
plus a script that gets a fresh box (Pwnbox, Kali, whatever) fully tooled in
one command.

This repo does **not** store tool source/binaries — Pwnbox resets every
session, so committing tool code would just rot. Instead the repo holds:

- **Markdown catalogs** (`windows/`, `linux/`, `recon/`, `pivoting/`) — one
  page per category, listing each tool, what it's for, and the command I
  actually run.
- **`scripts/install-tools.sh`** — clones/updates the real tools into
  `~/tools` on whatever machine you run it on.
- **`bootstrap.sh`** — the one-liner. Clones this repo (or updates it),
  then runs the installer.

Wordlists aren't in here — `apt install seclists` covers that.

## Quick start (run on a fresh Pwnbox / new box — the attack host is always Linux)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/YOURUSERNAME/htb-toolkit/main/bootstrap.sh)
```

Clones this repo to `~/htb-toolkit`, pulls every tool (Linux *and* the
Windows binaries you'd upload to a target — SharpCollection, Rubeus,
mimikatz, etc.) into `~/tools`, and adds `~/tools/bin` to PATH. Idempotent —
re-run any time, existing tools just get `git pull`'d instead of re-cloned.

To just browse the catalog without installing anything:

```bash
git clone https://github.com/YOURUSERNAME/htb-toolkit.git
```

## Structure

```
htb-toolkit/
├── bootstrap.sh               # one-liner entry point (run on the Linux attack host)
├── windows/
│   ├── ad-enum.md            # BloodHound, bloodyAD, PowerView, ADRecon...
│   ├── kerberos-credentials.md  # Rubeus, mimikatz, Certipy, Impacket creds...
│   ├── privesc.md            # winPEAS, PrivescCheck, Seatbelt, PrintSpoofer...
│   └── lateral-movement.md   # evil-winrm, NetExec, Impacket exec, RDP...
├── linux/
│   ├── privesc.md            # linPEAS, les2, pspy, GTFOBins...
│   └── enum-services.md      # enum4linux-ng, smbmap, rpcclient...
├── recon/
│   └── network-web.md        # nmap, ffuf/feroxbuster, whatweb, nikto...
├── pivoting/
│   └── tunneling-pivoting.md # chisel, ligolo-ng, sshuttle, socat, proxychains
└── scripts/
    └── install-tools.sh       # pulls everything into ~/tools on the attack host
```

## Updating the catalog

Found a new tool worth keeping? Add a line to the relevant `.md` file —
that's it, no install logic needed there. Only add to
`scripts/install-tools.sh` if it's something you want auto-fetched on every
new box.

## A note on scope

This repo is just *links + commands for public, well-known tools* — nothing
here is target-specific. Keep actual machine notes, loot, and creds in a
**separate private repo or a gitignored local folder**, never in this one.
HTB's rules don't allow publishing flags or detailed box writeups, and it's
an easy mistake to commit a notes file with live creds in it.
