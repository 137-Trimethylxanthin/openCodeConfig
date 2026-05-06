# OpenCode Ultimate Setup — Requirements

This document lists all packages needed to replicate this setup.
Supports **Arch Linux** and **Ubuntu/Debian**. Installs split into OS packages, AUR/snap, and npm.

## One-Command Installs

### Arch Linux

```bash
# Pacman (official repos)
sudo pacman -S --needed python python-pip uv ruff rust rust-analyzer nodejs npm go gopls pyright gdb ghidra binwalk john hashcat foremost steghide exiftool wireshark-qt tshark git curl wget fish docker kubectl github-cli nmap sqlmap

# AUR (paru — installs from Arch User Repository)
paru -S --needed nuclei radare2 rizin volatility3 burpsuite-pro

# npm (global packages)
npm install -g @biomejs/biome typescript

# Rust analyzer component
rustup component add rust-analyzer

# Nuclei templates
nuclei -update-templates
```

### Ubuntu / Debian

```bash
# Apt (official repos)
sudo apt update && sudo apt install -y python3 python3-pip python3-venv rustc cargo nodejs npm gdb binwalk john hashcat foremost steghide libimage-exiftool-perl wireshark tshark git curl wget fish docker.io kubectl gh nmap sqlmap radare2 golang-go

# Snap packages (Snap Store)
sudo snap install go --classic
sudo snap install gopls --classic
sudo snap install ghidra
sudo snap install rust-analyzer

# pip (Python packages — use pipx or pip)
pip install uv ruff pyright
pip install volatility3

# go install (Go packages)
go install golang.org/x/tools/gopls@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

# npm (global packages)
npm install -g @biomejs/biome typescript

# Rust analyzer
rustup component add rust-analyzer

# Nuclei templates
nuclei -update-templates
```

> **Note on Ubuntu security tools**: `burpsuite` (community), `rizin`, and `burpsuite-pro` are not in apt. Download from:
> - Burp Suite: https://portswigger.net/burp/communitydownload
> - Rizin: https://rizin.re (AppImage or build from source)
> - Ghidra: `sudo snap install ghidra`

---

## Full Package List

### Base System & Shell
| Arch (pacman) | Ubuntu (apt) | Purpose |
|---------------|-------------|---------|
| `fish` | `fish` | Shell (configurable in opencode.json) |
| `git` | `git` | Version control |
| `github-cli` | `gh` | GitHub CLI for `/review` and github MCP |
| `curl` | `curl` | HTTP client |
| `wget` | `wget` | Download tool |

### Languages & Toolchains
| Arch (pacman) | Ubuntu (apt/pip) | Purpose |
|---------------|-----------------|---------|
| `python` | `python3` | Python runtime |
| `python-pip` | `python3-pip` | Python package manager |
| `uv` | `pip install uv` | Python project/package manager (preferred) |
| `ruff` | `pip install ruff` | Python linter + formatter |
| `pyright` | `pip install pyright` | Python LSP server |
| `rust` | `rustc cargo` | Rust toolchain (or use rustup) |
| `rust-analyzer` | `snap install rust-analyzer` or `rustup component add` | Rust LSP server |
| `nodejs` | `nodejs` | JavaScript/TypeScript runtime |
| `npm` | `npm` | Node package manager |
| `typescript` | `npm i -g typescript` | TypeScript compiler |
| `@biomejs/biome` | `npm i -g @biomejs/biome` | JS/TS/HTML/CSS linter + formatter |
| `go` | `golang-go` or `snap install go` | Go toolchain |
| `gopls` | `snap install gopls` or `go install golang.org/x/tools/gopls@latest` | Go LSP server |

### Reverse Engineering
| Arch (pacman/AUR) | Ubuntu (apt/snap) | Purpose |
|-------------------|-------------------|---------|
| `gdb` | `gdb` | GNU Debugger |
| `ghidra` | `snap install ghidra` | NSA RE suite |
| `radare2` (AUR) | `radare2` | CLI disassembler |
| `rizin` (AUR) | Download from rizin.re | Modern radare2 fork |
| `binwalk` | `binwalk` | Firmware analysis / file carving |
| `foremost` | `foremost` | File carving / data recovery |
| `exiftool` | `libimage-exiftool-perl` | Metadata extraction |

### Pentesting & Scanning
| Arch (pacman/AUR) | Ubuntu (apt/go) | Purpose |
|-------------------|-----------------|---------|
| `nmap` | `nmap` | Network scanning |
| `nuclei` (AUR) | `go install nuclei` | Vulnerability scanner |
| `sqlmap` | `sqlmap` | Automated SQL injection |
| `wireshark-qt` | `wireshark` | GUI network analyzer |
| `tshark` | `tshark` | CLI network analyzer |
| `burpsuite` | Download from portswigger.net | Web app security testing |
| `burpsuite-pro` (AUR) | Download from portswigger.net | Burp Suite Pro |

### Forensics & Crypto
| Arch (pacman/AUR) | Ubuntu (apt/pip) | Purpose |
|-------------------|-----------------|---------|
| `volatility3` (AUR) | `pip install volatility3` | Memory forensics |
| `john` | `john` | Password cracking |
| `hashcat` | `hashcat` | GPU password cracking |
| `steghide` | `steghide` | Steganography detection |

### Infrastructure & Containers
| Arch (pacman) | Ubuntu (apt) | Purpose |
|---------------|-------------|---------|
| `docker` | `docker.io` | Container runtime |
| `kubectl` | `kubectl` | Kubernetes CLI |

---

## OpenCode MCP Servers (auto-installed via npx on first use)
These are defined in `opencode.json` — no manual install needed. OpenCode npx's them automatically:

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
@ebowwa/mcp-nmap             # Nmap network scanning (18 tools)
gc-nuclei-mcp                # Nuclei vulnerability scanning
@iflow-mcp/stanleyj03-sqlmap-mcp  # SQLMap injection testing
osint-mcp-server             # Full OSINT suite (Shodan, VT, SecurityTrails, Censys, DNS, WHOIS, crt.sh, BGP)
@imouiche/mitre-attack-mcp-server  # MITRE ATT&CK framework (50+ tools)
@iflow-mcp/cyreslab-circl-cve-search-mcp-server  # CVE search
mcp-wayback-machine          # Wayback Machine archive
@kevinwatt/mcp-webhook       # Webhook receiver (SSRF/blind testing)
pentest-mcp                  # Professional pentest toolkit
@iflow-mcp/fwaeytens-burp-mcp-bridge  # Burp Suite bridge (needs Burp running)
cheatengine                  # Cheat Engine RE bridge (needs CE installed)
js-reverse-mcp               # JS reverse engineering + anti-detection

# Documentation & Search
@upstash/context7-mcp        # Documentation search (remote)
```

---

## OpenCode Plugins (auto-installed via opencode.json)

```
opencode-notify               # Desktop notifications on task completion
opencode-shell-strategy       # Non-interactive shell commands (prevents TTY hangs)
opencode-wakatime             # Time tracking integration
opencode-vibeguard            # Secrets/PII redaction before LLM calls
opencode-supermemory          # Persistent memory across sessions
```

---

## Optional — Only If Using the Service
| Tool | Arch | Ubuntu | Why |
|------|------|--------|-----|
| `kubectl` | pacman | apt | Kubernetes clusters |
| `docker` | pacman | apt (`docker.io`) | Docker containers |
| `burpsuite-pro` | AUR | Download from website | Burp Pro license |
| `github-cli` | pacman | apt (`gh`) | GitHub MCP, `/pr-review` |

---

## API Keys (set as env vars)

```bash
# Required
export DEEPSEEK_API_KEY="sk-..."           # Your DeepSeek API key

# Optional — enables additional MCP features
export GITHUB_TOKEN="ghp_..."              # GitHub API access
export CONTEXT7_API_KEY="..."              # Higher rate limits on docs search (free at context7.com)
export SHODAN_API_KEY="..."               # Shodan OSINT queries
export VIRUSTOTAL_API_KEY="..."           # Malware analysis
export SECURITYTRAILS_API_KEY="..."       # DNS/domain OSINT
export CENSYS_API_ID="..."                # Internet scanning OSINT
export CENSYS_API_SECRET="..."            # Internet scanning OSINT

# Optional — sudo plugin
export SUDO_PASSWORD="..."                # Auto-fill sudo passwords
export OPENCODE_SUDO_ENABLED="1"          # Enable GUI password prompt
```

---

## Known Quirks

### Both Distros
- `rust-analyzer` can be installed via `rustup component add rust-analyzer` or the OS package.
- `nuclei` needs templates after install: `nuclei -update-templates`.
- For the `cheatengine` MCP: Cheat Engine must be installed separately (Wine on Linux).
- For the `burp-bridge` MCP: Burp Suite Pro must be running locally with the MCP proxy extension.

### Arch-Specific
- CachyOS uses `paru` as AUR helper (pre-installed). On vanilla Arch, use `yay` or `paru`.
- Some AUR packages (`volatility3`, `radare2`) compile from source — may take a few minutes.

### Ubuntu-Specific
- `snap` must be installed: `sudo apt install snapd` if not already present.
- `go` from snap gives the latest version; `golang-go` from apt may lag behind.
- `ghidra` via snap is the easiest install; manual download from https://ghidra-sre.org also works.
- `burpsuite` is not in apt — download the `.sh` installer from https://portswigger.net.
- `pip install` requires `python3-venv` for PEP 668 compatibility on Ubuntu 23.04+:
  ```bash
  sudo apt install python3-venv
  # Then either:
  pipx install uv ruff pyright        # Recommended (isolated)
  # Or force pip:
  pip install --break-system-packages uv ruff pyright
  ```
