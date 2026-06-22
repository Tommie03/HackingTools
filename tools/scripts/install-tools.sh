#!/usr/bin/env bash
# scripts/install-tools.sh
#
# Idempotent installer for the tools listed in the catalog. Safe to re-run
# on the same box — existing git clones get `pull`ed, existing pipx/gem
# packages get `upgrade`d. SecLists is NOT handled here; `apt install
# seclists` is already part of this.
set -uo pipefail

TOOLS_DIR="${TOOLS_DIR:-$HOME/tools}"
mkdir -p "$TOOLS_DIR/windows" "$TOOLS_DIR/linux" "$TOOLS_DIR/bin"

clone_or_update() {
  local url="$1" dest="$2"
  if [ -d "$dest/.git" ]; then
    echo "[*] Updating $(basename "$dest")"
    git -C "$dest" pull --quiet
  else
    echo "[*] Cloning $(basename "$dest")"
    git clone --quiet --depth 1 "$url" "$dest"
  fi
}

echo "=== apt packages ==="
sudo apt-get update -qq
sudo apt-get install -y -qq \
  seclists impacket-scripts responder enum4linux-ng smbmap rlwrap \
  golang-go ruby-dev pipx nmap ffuf gobuster nikto whatweb proxychains4 \
  socat sshuttle >/dev/null 2>&1

echo "=== pipx tools ==="
for pkg in bloodyAD certipy-ad netexec bloodhound; do
  pipx install --quiet "$pkg" 2>/dev/null || pipx upgrade --quiet "$pkg" 2>/dev/null
done
# `bloodhound` pipx package provides the bloodhound-python collector CLI

echo "=== gem tools ==="
gem list -i evil-winrm >/dev/null 2>&1 || sudo gem install evil-winrm

echo "=== windows/ — source + prebuilt repos ==="
clone_or_update https://github.com/Flangvik/SharpCollection.git           "$TOOLS_DIR/windows/SharpCollection"
clone_or_update https://github.com/GhostPack/Rubeus.git                   "$TOOLS_DIR/windows/Rubeus"
clone_or_update https://github.com/PowerShellMafia/PowerSploit.git        "$TOOLS_DIR/windows/PowerSploit"
clone_or_update https://github.com/itm4n/PrivescCheck.git                 "$TOOLS_DIR/windows/PrivescCheck"
clone_or_update https://github.com/GhostPack/Seatbelt.git                 "$TOOLS_DIR/windows/Seatbelt"
clone_or_update https://github.com/peass-ng/PEASS-ng.git                  "$TOOLS_DIR/windows/PEASS-ng"

echo "=== linux/ ==="
clone_or_update https://github.com/DominicBreuker/pspy.git                "$TOOLS_DIR/linux/pspy"
clone_or_update https://github.com/jondonas/linux-exploit-suggester-2.git "$TOOLS_DIR/linux/les2"
ln -sf "$TOOLS_DIR/windows/PEASS-ng/linPEAS/linpeas.sh" "$TOOLS_DIR/linux/linpeas.sh" 2>/dev/null
ln -sf "$TOOLS_DIR/windows/PEASS-ng/winPEAS/winPEASexe"  "$TOOLS_DIR/windows/winPEAS"   2>/dev/null

echo "=== pivoting/ (go installs) ==="
if command -v go >/dev/null 2>&1; then
  GOBIN="$TOOLS_DIR/bin" go install github.com/ropnop/kerbrute@latest 2>/dev/null
  GOBIN="$TOOLS_DIR/bin" go install github.com/jpillora/chisel@latest 2>/dev/null
fi
clone_or_update https://github.com/nicocha30/ligolo-ng.git                "$TOOLS_DIR/pivoting/ligolo-ng"

echo ""
echo "[+] Done. Tools live in $TOOLS_DIR"
echo "[+] PATH addition (bootstrap.sh does this for you): export PATH=\"$TOOLS_DIR/bin:\$PATH\""
