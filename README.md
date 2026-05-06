# OpenCode Ultimate Setup

A comprehensive, battle-tested OpenCode configuration for polyglot development and cybersecurity work.

Built for **Arch Linux** (CachyOS) — works on any Arch-based distro. Uses **DeepSeek V4 Pro** as the primary model.

## Quick Start (Fresh Arch Install)

```bash
# 1. Install base packages
sudo pacman -S --needed python python-pip uv ruff rust rust-analyzer nodejs npm go gopls pyright gdb ghidra binwalk john hashcat foremost steghide exiftool wireshark-qt tshark git curl wget fish docker kubectl github-cli

# 2. Install AUR packages
paru -S --needed nuclei nmap sqlmap radare2 rizin volatility3

# 3. Install global npm tools
npm install -g @biomejs/biome typescript

# 4. Install OpenCode
curl -fsSL https://opencode.ai/install | bash
# OR on Arch: sudo pacman -S opencode

# 5. Clone this config
mkdir -p ~/.config
git clone https://github.com/YOUR_USER/opencode-setup.git ~/tmp-setup
cp -r ~/tmp-setup/.config/opencode ~/.config/opencode
rm -rf ~/tmp-setup

# 6. Set API keys
export DEEPSEEK_API_KEY="sk-your-key-here"

# 7. Launch
opencode
# Then run:  /connect   → select DeepSeek
```

## What's Included

### MCP Servers (22)
| Category | Servers |
|----------|---------|
| **Dev & Docs** | ctx7 (Context7), gh_grep (GitHub code search) |
| **Browser** | playwright (Chrome+Firefox+WebKit), chrome-devtools, browser-use |
| **Infra** | docker, github, filesystem |
| **AI** | seqthink (structured thinking), memory (knowledge graph) |
| **Pentest** | pentest-mcp, nmap (@ebowwa, 18 tools), nuclei, sqlmap |
| **OSINT** | osint-mcp-server (Shodan+VT+SecurityTrails+Censys+DNS+WHOIS+crt.sh+BGP), wayback |
| **Threat Intel** | mitre-attack (50+ tools), cve-search (CIRCL) |
| **Reverse Eng** | js-reverse (JS deobfuscation), cheatengine (disabled), burp-bridge (disabled) |
| **Web Testing** | webhook (SSRF/blind testing) |

### Agents (15)
| Agent | Type | Role |
|-------|------|------|
| **plan** | primary | Planning/analysis without code changes |
| **build** | primary | Default — full dev with all tools |
| **code-reviewer** | subagent | Code review (read-only) |
| **debugger** | subagent | Root-cause bug investigation |
| **optimizer** | subagent | Performance/memory/bundle optimization |
| **security-auditor** | subagent | Dependency audit, CVE scanning |
| **docs-writer** | subagent | Documentation only |
| **pentester** | subagent | Web app pentesting (OWASP Top 10) |
| **reverse-engineer** | subagent | Binary/JS RE, Ghidra/GDB/Frida |
| **osint-agent** | subagent | Domain/IP/email OSINT |
| **exploit-dev** | subagent | PoC exploit development |
| **redteam** | subagent | Campaign planning, C2, lateral movement |
| **blueteam** | subagent | Detection engineering, Sigma/YARA, IR |
| **crypto-agent** | subagent | Cryptography attacks, CTF crypto |
| **payload-crafter** | subagent | Shellcode, reverse shells, evasion |
| **ctf-player** | subagent | All CTF categories |

### Slash Commands (15)
| Command | Agent | Purpose |
|---------|-------|---------|
| `/test` | build | Run full test suite, fix failures |
| `/lint` | build | Run linters, fix all issues |
| `/fmt` | build | Format all code |
| `/biome` | build | Biome lint+format (JS/TS/HTML/CSS) |
| `/review` | code-reviewer | Code review staged changes |
| `/audit` | security-auditor | Dependency security audit |
| `/optimize` | optimizer | Performance analysis |
| `/init-project` | build | Deep project analysis + AGENTS.md |
| `/pentest <target>` | pentester | Full web app pentest |
| `/recon <target>` | osint-agent | Full OSINT recon |
| `/threat-model <target>` | redteam | MITRE ATT&CK threat model |
| `/exploit <vuln>` | exploit-dev | PoC exploit development |
| `/payload <specs>` | payload-crafter | Custom payload generation |
| `/ctf <challenge>` | ctf-player | CTF challenge solver |
| `/forensics <file>` | ctf-player | Forensic artifact analysis |

### Skills (7)
| Skill | Content |
|-------|---------|
| `git-release` | Semantic versioning, changelog generation |
| `pr-review` | Structured PR review checklist |
| `pentest-checklist` | Complete OWASP Testing Guide checklist |
| `ctf-methodology` | CTF workflows for all categories |
| `threat-hunting` | Sigma/YARA templates, hunt hypotheses |
| `crypto-recipes` | RSA/AES/ECC attacks, hash cracking |
| `payload-crafting` | Reverse shells, shellcode, AMSI bypass |
| `programming-resources` | Curated APIs, docs, tools, CTF resources |

### Plugins (6)
| Plugin | Purpose |
|--------|---------|
| `opencode-notify` | Desktop notifications on task completion |
| `opencode-shell-strategy` | Prevent TTY hangs on interactive commands |
| `opencode-vibeguard` | Redact secrets/PII before LLM calls |
| `opencode-wakatime` | Time tracking integration |
| `opencode-supermemory` | Persistent memory across sessions |
| `sudo-plugin.ts` (custom) | Auto-inject SUDO_ASKPASS for sudo commands |

### Custom Themes (3)
| Theme | Style |
|-------|-------|
| `catppuccin-mocha` | Catppuccin Mocha (default) |
| `dracula` | Dracula |
| `rose-pine` | Rosé Pine |

Plus 11 built-in themes: tokyonight, everforest, ayu, catppuccin, gruvbox, kanagawa, nord, matrix, one-dark, system, opencode

## File Structure

```
~/.config/opencode/
├── opencode.json          # Main config — model, MCPs, formatters, permissions, agents
├── AGENTS.md              # Global coding rules for 8+ languages
├── tui.json               # TUI settings — theme, mouse, scroll
├── agents/                # 15 agent definitions (markdown)
│   ├── code-reviewer.md   ├── debugger.md       ├── docs-writer.md
│   ├── optimizer.md       ├── security-auditor.md
│   ├── pentester.md       ├── reverse-engineer.md ├── osint-agent.md
│   ├── exploit-dev.md     ├── redteam.md         ├── blueteam.md
│   ├── crypto-agent.md    ├── payload-crafter.md └── ctf-player.md
├── commands/              # 15 slash command definitions (markdown)
│   ├── test.md  ├── lint.md  ├── fmt.md  ├── biome.md
│   ├── review.md  ├── audit.md  ├── optimize.md  ├── init-project.md
│   ├── pentest.md  ├── recon.md  ├── threat-model.md
│   ├── exploit.md  ├── payload.md  ├── ctf.md  └── forensics.md
├── skills/                # 7 reusable skill definitions
│   ├── git-release/       ├── pr-review/
│   ├── pentest-checklist/ ├── ctf-methodology/
│   ├── threat-hunting/    ├── crypto-recipes/
│   ├── payload-crafting/  └── programming-resources/
├── themes/                # 3 custom theme files
│   ├── catppuccin-mocha.json  ├── dracula.json  └── rose-pine.json
├── plugins/               # Custom local plugins
│   └── sudo-plugin.ts
└── bin/
    └── sudo-askpass       # SUDO_ASKPASS helper script
```

## Environment Variables

```bash
# Required
export DEEPSEEK_API_KEY="sk-..."       # Your DeepSeek API key

# Optional — enables additional MCP features
export GITHUB_TOKEN="ghp_..."          # GitHub API access
export CONTEXT7_API_KEY="..."          # Higher rate limits on docs search
export SHODAN_API_KEY="..."           # Shodan OSINT queries
export VIRUSTOTAL_API_KEY="..."       # Malware analysis
export SECURITYTRAILS_API_KEY="..."   # DNS/domain OSINT
export CENSYS_API_ID="..."            # Internet scanning OSINT
export CENSYS_API_SECRET="..."        # Internet scanning OSINT

# Optional — sudo plugin
export SUDO_PASSWORD="..."            # Auto-fill sudo passwords
export OPENCODE_SUDO_ENABLED="1"      # Enable GUI password prompt
```

## Languages Supported

Python · Rust · TypeScript · JavaScript · Go · Svelte · Astro · HTML · CSS · Vite

Formatters auto-run on write: ruff (Python), biome (JS/TS/HTML/CSS/Svelte/Astro), gofmt (Go), cargofmt (Rust)

LSP servers auto-start on file open: pyright, rust-analyzer, typescript, gopls, svelte, astro

## Updating

```bash
# Update OpenCode
sudo pacman -S opencode   # or: curl -fsSL https://opencode.ai/install | bash

# Update npm MCP servers (on next opencode start they auto-update via npx)
# Or manually:
opencode debug config   # verify config loads cleanly

# Pull config updates if using git
cd ~/.config/opencode && git pull
```

## Security Notes

- The `opencode-vibeguard` plugin automatically redacts secrets and PII from prompts before they're sent to the LLM
- `.env` files are denied by default in OpenCode's permission system
- Dangerous bash operations (`rm -rf`, `sudo`, `git push`, `docker system prune`, `kubectl delete`) require explicit approval
- **Ethics**: Pentest and exploit agents are configured to only target systems you own or have explicit permission for

## Credits

Built for [OpenCode](https://opencode.ai) by anomalyco.
Models: DeepSeek V4 Pro (primary) + DeepSeek V4 Flash (small tasks).
