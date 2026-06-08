#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════
# Setup script for opencodeSetup repo
# Run this after cloning to symlink all configs into place
#
# Usage:
#   ./setup.sh                    # Symlink everything (default)
#   ./setup.sh --hermes           # Symlink only Hermes config
#   ./setup.sh --codex            # Symlink only Codex config
#   ./setup.sh --opencode         # Symlink only OpenCode config
#   ./setup.sh --install-skills   # Install all skills + MCP servers
#   ./setup.sh --all              # Symlink + install everything
#   ./setup.sh --help             # Show this help
# ═══════════════════════════════════════════════════════════════

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# ── Parse args ─────────────────────────────────────────────────
DO_HERMES=false
DO_CODEX=false
DO_OPENCODE=false
INSTALL_SKILLS=false

if [[ $# -eq 0 ]]; then
    DO_HERMES=true
    DO_CODEX=true
    DO_OPENCODE=true
else
    for arg in "$@"; do
        case "$arg" in
            --hermes)        DO_HERMES=true ;;
            --codex)         DO_CODEX=true ;;
            --opencode)      DO_OPENCODE=true ;;
            --install-skills) INSTALL_SKILLS=true ;;
            --all)
                DO_HERMES=true
                DO_CODEX=true
                DO_OPENCODE=true
                INSTALL_SKILLS=true
                ;;
            --help|-h)
                echo "Usage: ./setup.sh [OPTIONS]"
                echo ""
                echo "Options:"
                echo "  --hermes           Symlink Hermes config (~/.hermes/config.yaml)"
                echo "  --codex            Symlink Codex config (~/.config/codex)"
                echo "  --opencode         Symlink OpenCode config (~/.config/opencode)"
                echo "  --install-skills   Install all skills + MCP servers"
                echo "  --all              Symlink everything + install skills"
                echo "  (none)             Symlink everything (default)"
                echo ""
                echo "After setup, just git pull to update — symlinks auto-reflect changes."
                exit 0
                ;;
            *)
                echo "Unknown option: $arg"
                echo "Run ./setup.sh --help for usage"
                exit 1
                ;;
        esac
    done
fi

# ── Helper ─────────────────────────────────────────────────────
link_file() {
    local src="$1" dst="$2"
    if [[ -L "$dst" ]]; then
        local current
        current="$(readlink "$dst")"
        if [[ "$current" == "$src" ]]; then
            echo "  [ok] $dst -> $src (already linked)"
            return
        fi
        echo "  [update] $dst was -> $current, updating -> $src"
        rm "$dst"
    elif [[ -e "$dst" ]]; then
        local backup="${dst}.bak.$(date +%Y%m%d_%H%M%S)"
        echo "  [backup] $dst -> $backup"
        mv "$dst" "$backup"
    fi
    ln -s "$src" "$dst"
    echo "  [link] $dst -> $src"
}

link_dir() {
    local src="$1" dst="$2"
    if [[ -L "$dst" ]]; then
        local current
        current="$(readlink "$dst")"
        if [[ "$current" == "$src" ]]; then
            echo "  [ok] $dst -> $src (already linked)"
            return
        fi
        echo "  [update] $dst was -> $current, updating -> $src"
        rm "$dst"
    elif [[ -d "$dst" ]]; then
        local backup="${dst}.bak.$(date +%Y%m%d_%H%M%S)"
        echo "  [backup] $dst -> $backup"
        mv "$dst" "$backup"
    fi
    ln -s "$src" "$dst"
    echo "  [link] $dst -> $src"
}

# ── OpenCode ───────────────────────────────────────────────────
if $DO_OPENCODE; then
    echo ""
    echo "── OpenCode ──────────────────────────────────────────────"
    link_dir "$REPO_DIR/.config/opencode" "$HOME/.config/opencode"
    echo "  Done."
fi

# ── Codex ─────────────────────────────────────────────────────
if $DO_CODEX; then
    echo ""
    echo "── Codex ─────────────────────────────────────────────────"
    link_dir "$REPO_DIR/.config/codex" "$HOME/.config/codex"
    echo "  Done."
fi

# ── Hermes ────────────────────────────────────────────────────
if $DO_HERMES; then
    echo ""
    echo "── Hermes ────────────────────────────────────────────────"
    mkdir -p "$HOME/.hermes"
    link_file "$REPO_DIR/.config/hermes/config.yaml" "$HOME/.hermes/config.yaml"
    echo "  Done."
fi

# ── Install Skills & MCP Servers ───────────────────────────────
if $INSTALL_SKILLS; then
    echo ""
    echo "── Installing Skills & MCP Servers ───────────────────────"

    # ── Hermes Skills (69 total) ───────────────────────────────
    if command -v hermes &>/dev/null; then
        echo ""
        echo "  Installing Hermes skills (69)..."
        installed=0
        skipped=0
        failed=0

        while IFS= read -r skill; do
            [[ -z "$skill" ]] && continue
            result=$(hermes skills install "$skill" 2>&1) && {
                installed=$((installed + 1))
            } || {
                if echo "$result" | grep -qi "already installed\|already exists"; then
                    skipped=$((skipped + 1))
                else
                    failed=$((failed + 1))
                    echo "    [FAIL] $skill: $result"
                fi
            }
        done < <(find "$REPO_DIR/.config/skills-manifest.yaml" -maxdepth 0 -exec \
            python3 -c "
import yaml, sys
with open(sys.argv[1]) as f:
    data = yaml.safe_load(f)
for cat, skills in data.get('hermes_skills', {}).items():
    if isinstance(skills, list):
        for s in skills:
            print(s)
" {} \; 2>/dev/null || true)

        # Fallback: install from the manifest categories
        if [[ $installed -eq 0 && $skipped -eq 0 ]]; then
            echo "  (Using direct install from manifest categories...)"
            for skill in \
                apple-notes apple-reminders findmy imessage macos-computer-use \
                claude-code codex hermes-agent opencode \
                architecture-diagram ascii-art ascii-video baoyu-infographic \
                claude-design comfyui design-md excalidraw humanizer \
                manim-video p5js popular-web-designs pretext sketch \
                songwriting-and-ai-music touchdesigner-mcp \
                jupyter-live-kernel \
                ai-agent-config-management kanban-orchestrator kanban-worker \
                dogfood himalaya \
                codebase-inspection github-auth github-code-review \
                github-issues github-pr-workflow github-repo-management \
                gif-search heartmula songsee youtube-content \
                huggingface-hub obsidian \
                airtable google-workspace maps nano-pdf notion \
                ocr-and-documents powerpoint teams-meeting-pipeline \
                godmode \
                arxiv blogwatcher llm-wiki polymarket research-paper-writing \
                openhue xurl \
                hermes-agent-skill-authoring node-inspect-debugger plan \
                python-debugpy requesting-code-review simplify-code spike \
                systematic-debugging test-driven-development \
                yuanbao; do
                result=$(hermes skills install "$skill" 2>&1) && {
                    installed=$((installed + 1))
                } || {
                    if echo "$result" | grep -qi "already installed\|already exists"; then
                        skipped=$((skipped + 1))
                    else
                        failed=$((failed + 1))
                    fi
                }
            done
        fi

        echo "  Hermes skills: $installed installed, $skipped already present, $failed failed"
    else
        echo "  [skip] hermes CLI not found. Install Hermes first."
    fi

    # ── Hermes MCP Servers ────────────────────────────────────
    if command -v hermes &>/dev/null; then
        echo ""
        echo "  Installing Hermes MCP servers..."
        # Note: Hermes MCP servers are added via 'hermes mcp add'
        # The opencode MCP servers are auto-installed via npx when defined in opencode.json
        # Hermes doesn't have MCP servers in config.yaml — they're added via CLI
        echo "  (Hermes MCP servers are managed via 'hermes mcp add' — see README)"
    fi

    # ── OpenCode Skills ───────────────────────────────────────
    echo ""
    echo "  OpenCode skills (142) are auto-managed by OpenCode."
    echo "  They will be available when you run 'opencode'."
    echo "  Use /skills in OpenCode to browse and install additional ones."

    # ── OpenCode MCP Servers ──────────────────────────────────
    echo ""
    echo "  OpenCode MCP servers (53) are defined in .config/opencode/opencode.json."
    echo "  They auto-install via npx on first use — no manual install needed."
fi

# ── Summary ────────────────────────────────────────────────────
echo ""
echo "════════════════════════════════════════════════════════════"
echo "  Setup complete!"
echo ""
echo "  Repo:  $REPO_DIR"
echo ""
if $DO_OPENCODE; then
    echo "  OpenCode: $HOME/.config/opencode -> repo"
fi
if $DO_CODEX; then
    echo "  Codex:    $HOME/.config/codex -> repo"
fi
if $DO_HERMES; then
    echo "  Hermes:   $HOME/.hermes/config.yaml -> repo"
fi
echo ""
echo "  Skills manifest: .config/skills-manifest.yaml"
echo "    Hermes skills:  69"
echo "    OpenCode skills: 142"
echo "    OpenCode MCP:   53 (40 enabled)"
echo "    OpenCode plugins: 31"
echo ""
echo "  To update: just git pull — symlinks auto-reflect changes"
echo "════════════════════════════════════════════════════════════"
