# OpenCode Ultimate Setup — Requirements

This document lists all packages needed to replicate this setup on any Arch Linux system.
Installs are split into: **Pacman (official repos)**, **AUR (paru)**, and **npm (global)**.

## One-Command Installs

### Pacman (official repos)
```bash
sudo pacman -S --needed python python-pip uv ruff rust rust-analyzer nodejs npm go gopls pyright gdb ghidra binwalk john hashcat foremost steghide exiftool wireshark-qt tshark git curl wget fish docker kubectl github-cli
```

### AUR (paru — installs from Arch User Repository)
```bash
paru -S --needed nuclei nmap sqlmap radare2 rizin volatility3 burpsuite-pro
```
> `burpsuite-pro` requires a license. The free `burpsuite` community edition is in pacman as `burpsuite`.

### npm (global packages — optional, mostly for manual use)
```bash
npm install -g @biomejs/biome typescript prettier
```

---

## Full Package List

### Base System & Shell
| Package | Source | Purpose |
|---------|--------|---------|
| `fish` | pacman | Shell (configurable in opencode.json) |
| `git` | pacman | Version control |
| `github-cli` | pacman | GitHub CLI for `/review` and github MCP |

### Languages & Toolchains
| Package | Source | Purpose |
|---------|--------|---------|
| `python` | pacman | Python runtime |
| `python-pip` | pacman | Python package manager |
| `uv` | pacman | Python project/package manager (preferred over pip) |
| `ruff` | pacman | Python linter + formatter |
| `pyright` | pacman | Python LSP server |
| `rust` | pacman | Rust toolchain (rustc + cargo) |
| `rust-analyzer` | pacman | Rust LSP server |
| `nodejs` | pacman | JavaScript/TypeScript runtime |
| `npm` | pacman | Node package manager |
| `typescript` | npm | TypeScript compiler (global) |
| `@biomejs/biome` | npm | JS/TS/HTML/CSS/Svelte/Astro linter + formatter |
| `go` | pacman | Go toolchain |
| `gopls` | pacman | Go LSP server |

### Reverse Engineering
| Package | Source | Purpose |
|---------|--------|---------|
| `gdb` | pacman | GNU Debugger — binary analysis, exploitation |
| `ghidra` | pacman | NSA reverse engineering suite (Java-based) |
| `radare2` | AUR | Radare2 — CLI disassembler/debugger |
| `rizin` | AUR | Rizin — modern fork of radare2 |
| `binwalk` | pacman | Firmware analysis and file carving |
| `foremost` | pacman | File carving / data recovery |
| `exiftool` | pacman | Metadata extraction from files/images |

### Pentesting & Scanning
| Package | Source | Purpose |
|---------|--------|---------|
| `nmap` | pacman | Network scanning and service discovery |
| `nuclei` | AUR | Vulnerability scanner (template-based) |
| `sqlmap` | AUR | Automated SQL injection tool |
| `wireshark-qt` | pacman | GUI network protocol analyzer |
| `tshark` | pacman | CLI network protocol analyzer (PCAP analysis) |
| `burpsuite` | pacman | Web app security testing (community edition) |
| `burpsuite-pro` | AUR | Burp Suite Pro (requires license) |

### Forensics & Crypto
| Package | Source | Purpose |
|---------|--------|---------|
| `volatility3` | AUR | Memory forensics framework |
| `john` | pacman | John the Ripper — password cracking |
| `hashcat` | pacman | GPU-accelerated password cracking |
| `steghide` | pacman | Steganography detection and extraction |

### Infrastructure & Containers
| Package | Source | Purpose |
|---------|--------|---------|
| `docker` | pacman | Container runtime (docker MCP) |
| `kubectl` | pacman | Kubernetes CLI |

### OpenCode MCP Servers (auto-installed via npx on first use)
These are defined in `opencode.json` and auto-installed when OpenCode starts:

```
# General & Development
@playwright/mcp              # Browser automation (Chrome + Firefox + WebKit)
browser-use-mcp              # Real-time web data access
@modelcontextprotocol/server-filesystem  # Filesystem operations
@modelcontextprotocol/server-sequential-thinking  # Structured thinking
@modelcontextprotocol/server-memory    # Knowledge graph memory
chrome-devtools-mcp          # Chrome DevTools protocol
docker-mcp                   # Docker management
@fre4x/github                # GitHub API

# Security & Pentesting
@ebowwa/mcp-nmap             # Nmap network scanning
gc-nuclei-mcp                # Nuclei vulnerability scanning
@iflow-mcp/stanleyj03-sqlmap-mcp  # SQLMap injection testing
osint-mcp-server             # Full OSINT suite
@imouiche/mitre-attack-mcp-server  # MITRE ATT&CK framework
@iflow-mcp/cyreslab-circl-cve-search-mcp-server  # CVE search
mcp-wayback-machine          # Wayback Machine
@kevinwatt/mcp-webhook       # Webhook receiver
pentest-mcp                  # Professional pentest toolkit
@iflow-mcp/fwaeytens-burp-mcp-bridge  # Burp Suite bridge
cheatengine                  # Cheat Engine reverse engineering
js-reverse-mcp               # JS reverse engineering

# Documentation & Search
@upstash/context7-mcp        # Documentation search (remote)
```

### OpenCode Plugins (auto-installed via opencode.json)
```
opencode-notify               # Desktop notifications
opencode-shell-strategy       # Non-interactive shell commands
opencode-wakatime             # Time tracking
opencode-vibeguard            # Secrets/PII redaction
opencode-supermemory          # Persistent memory
```

### Optional — Still Needed on Current Device
| Package | Source | Why |
|---------|--------|-----|
| `radare2` | AUR | RE CLI disassembler (`paru -S radare2`) |
| `rizin` | AUR | Modern radare2 fork (`paru -S rizin`) |
| `volatility3` | AUR | Memory forensics (`paru -S volatility3`) |
| `foremost` | pacman | File carving (`sudo pacman -S foremost`) |
| `john` | pacman | Password cracking (`sudo pacman -S john`) |
| `hashcat` | pacman | GPU password cracking (`sudo pacman -S hashcat`) |
| `steghide` | pacman | Steganography (`sudo pacman -S steghide`) |
| `exiftool` | pacman | Metadata extraction (`sudo pacman -S exiftool`) |
| `kubectl` | pacman | Kubernetes CLI (`sudo pacman -S kubectl`) |
| `github-cli` | pacman | GitHub CLI (`sudo pacman -S github-cli`) |
| `pyright` | pacman | Python LSP (`sudo pacman -S pyright`) |
| `uv` | pacman | Python project manager (`sudo pacman -S uv`) |
| `ruff` | pacman | Python linter/formatter (`sudo pacman -S ruff`) |
| `@biomejs/biome` | npm | JS/TS linter/formatter (`npm i -g @biomejs/biome`) |
| `typescript` | npm | TS compiler (`npm i -g typescript`) |

### Optional — Only If Using the Service
| Tool | Why |
|------|-----|
| `kubectl` | Only if working with Kubernetes clusters |
| `docker` | Only if using Docker containers (docker MCP) |
| `burpsuite-pro` (AUR) | Only if you have a Burp Pro license |
| `github-cli` | Only if using GitHub MCP or `/review` command |

### API Keys (set as env vars)
```bash
export DEEPSEEK_API_KEY="sk-..."           # Required — your DeepSeek API key
export GITHUB_TOKEN="ghp_..."              # Optional — for GitHub MCP server
export CONTEXT7_API_KEY="..."              # Optional — free account at context7.com
export SHODAN_API_KEY="..."               # Optional — for OSINT recon
export VIRUSTOTAL_API_KEY="..."           # Optional — for malware analysis
export SECURITYTRAILS_API_KEY="..."       # Optional — for OSINT
export CENSYS_API_ID="..."                # Optional — for OSINT
export CENSYS_API_SECRET="..."            # Optional — for OSINT
export SUDO_PASSWORD="..."                # Optional — for sudo plugin auto-password
export OPENCODE_SUDO_ENABLED="1"          # Optional — enable GUI sudo password prompt
```

### Known Quirks
- `rust-analyzer` must be manually installed: `rustup component add rust-analyzer` or `pacman -S rust-analyzer`
- CachyOS uses `paru` as AUR helper (pre-installed). On vanilla Arch, use `yay` or `paru`.
- Some AUR packages (`volatility3`, `radare2`) take a while to compile from source.
- `nuclei` needs templates: `nuclei -update-templates` after install.
- For the `cheatengine` MCP: Cheat Engine must be installed separately (AUR or wine).
- For the `burp-bridge` MCP: Burp Suite Pro must be running locally with the MCP proxy extension.
