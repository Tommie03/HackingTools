#!/usr/bin/env bash
# One-liner entry point. Run on any fresh box:
#
#   bash <(curl -fsSL https://raw.githubusercontent.com/YOURUSERNAME/htb-toolkit/main/bootstrap.sh)
#
# Clones (or updates) this repo, then runs the tool installer.
set -euo pipefail

REPO_URL="https://github.com/YOURUSERNAME/htb-toolkit.git"
REPO_DIR="${HTB_TOOLKIT_DIR:-$HOME/htb-toolkit}"

if [ -d "$REPO_DIR/.git" ]; then
  echo "[*] htb-toolkit already present, updating..."
  git -C "$REPO_DIR" pull --quiet
else
  echo "[*] Cloning htb-toolkit..."
  git clone --quiet "$REPO_URL" "$REPO_DIR"
fi

bash "$REPO_DIR/scripts/install-tools.sh"

# Wire up PATH + a quick alias to browse the catalog, once.
if ! grep -q 'htb-toolkit' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" <<EOF

# --- htb-toolkit ---
export PATH="\$HOME/tools/bin:\$PATH"
alias toolkit='cd $REPO_DIR && ls *.md windows linux recon pivoting 2>/dev/null'
EOF
fi

echo ""
echo "[+] Catalog: $REPO_DIR"
echo "[+] Tools:   $HOME/tools"
echo "[+] Run 'source ~/.bashrc' or open a new shell, then 'toolkit' to browse."
