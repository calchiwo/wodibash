#!/usr/bin/env bash
set -e

REPO="calchiwo/wodibash"
RELEASES_API="https://api.github.com/repos/$REPO/releases/latest"
ALIASES_URL="https://github.com/$REPO/releases/latest/download/aliases.sh"
START_MARKER="# --- WODIBASH START ---"
END_MARKER="# --- WODIBASH END ---"

# $HOME works correctly on all platforms including Termux
# (/data/data/com.termux/files/home) and standard Linux/macOS paths
TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT

echo ""
echo "Installing wodibash..."
echo ""

# --- Detect shell and target the right config file ---
DETECTED_SHELL="$(basename "$SHELL")"

case "$DETECTED_SHELL" in
    zsh)  SHELL_RC="$HOME/.zshrc" ;;
    bash) SHELL_RC="$HOME/.bashrc" ;;
    *)
        echo "Unsupported shell: $DETECTED_SHELL"
        echo "wodibash supports bash and zsh."
        exit 1
        ;;
esac

echo "Detected: $DETECTED_SHELL -> $SHELL_RC"
echo ""

# --- Already installed ---
if grep -q "$START_MARKER" "$SHELL_RC" 2>/dev/null; then
    echo "wodibash is already installed."
    echo "To update, run: wodibashupdate"
    echo ""
    exit 0
fi

# --- Download aliases.sh from latest release ---
if command -v curl &>/dev/null; then
    curl -fsSL "$ALIASES_URL" -o "$TMP"
elif command -v wget &>/dev/null; then
    wget -qO "$TMP" "$ALIASES_URL"
else
    echo "Error: curl or wget is required."
    exit 1
fi

# --- Verify markers are in the downloaded file (hard stop before writing anything) ---
if ! grep -q "$START_MARKER" "$TMP" || ! grep -q "$END_MARKER" "$TMP"; then
    echo "Error: downloaded file is missing WODIBASH markers. Aborting."
    exit 1
fi

# --- Fetch installed version from GitHub API ---
VERSION="unknown"
if command -v curl &>/dev/null; then
    VERSION=$(curl -fsSL "$RELEASES_API" | grep '"tag_name"' | head -1 | sed 's/.*"tag_name": *"\(.*\)".*/\1/')
elif command -v wget &>/dev/null; then
    VERSION=$(wget -qO- "$RELEASES_API" | grep '"tag_name"' | head -1 | sed 's/.*"tag_name": *"\(.*\)".*/\1/')
fi

# --- Create config file if it doesn't exist (fresh Termux, Docker, minimal envs) ---
if [ ! -f "$SHELL_RC" ]; then
    touch "$SHELL_RC"
    echo "Created $SHELL_RC"
fi

# --- Backup before touching anything ---
cp "$SHELL_RC" "$SHELL_RC.bak"
echo "Backed up $SHELL_RC to $SHELL_RC.bak"

# --- Append wodibash block ---
echo "" >> "$SHELL_RC"
cat "$TMP" >> "$SHELL_RC"

# --- Source it ---
# shellcheck source=/dev/null
source "$SHELL_RC"

echo ""
echo "wodibash $VERSION installed successfully!"
echo "Shell config: $SHELL_RC"
echo ""
echo "Run 'helpme' to see all available aliases."
echo "Run 'wodibashupdate' anytime to update."
echo ""

