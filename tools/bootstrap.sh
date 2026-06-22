#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/YOURUSERNAME/HackingTools.git"
REPO_DIR="${HTB_TOOLKIT_DIR:-$HOME/HackingTools}"

if [ -d "$REPO_DIR/.git" ]; then
  echo "[*] Repo already present, updating..."
  git -C "$REPO_DIR" pull --quiet
else
  echo "[*] Cloning repo..."
  git clone --quiet "$REPO_URL" "$REPO_DIR"
fi

bash "$REPO_DIR/tools/scripts/install-tools.sh"

if ! grep -q 'HackingTools' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" <<EOF

# --- HackingTools ---
export PATH="\$HOME/tools/bin:\$PATH"
alias toolkit='cd $REPO_DIR/tools && ls *.md windows linux recon pivoting 2>/dev/null'
EOF
fi

echo ""
echo "[+] Catalog: $REPO_DIR/tools"
echo "[+] Tools:   $HOME/tools"
echo "[+] Run 'source ~/.bashrc' or open a new shell, then 'toolkit' to browse."
