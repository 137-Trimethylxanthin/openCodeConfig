# To feed the AI clusterfuck

# OpenCode Ultimate Setup

A comprehensive, battle-tested OpenCode configuration for polyglot development and cybersecurity work.

Built for **Arch Linux** (CachyOS) and **Ubuntu/Debian**. Uses **DeepSeek V4 Pro** as the primary model.

Full package lists for both distros: **[REQUIREMENTS.md](REQUIREMENTS.md)**

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

# 5. Clone this config
mkdir -p ~/.config
git clone https://github.com/137-Trimethylxanthin/openCodeConfig.git ~/tmp-setup
cp -r ~/tmp-setup/.config/opencode ~/.config/opencode
rm -rf ~/tmp-setup

# 6. Set API keys
export DEEPSEEK_API_KEY="sk-your-key-here"

# 7. Launch
opencode

# 8. (Optional) Install Open Design preview
git clone https://github.com/nexu-io/open-design.git ~/Documents/code/open-design
cd ~/Documents/code/open-design && pnpm install
# od-preview helper is included in this config (~/.local/bin/od-preview)
od-preview start
```

### Quick Start (Fresh Ubuntu / Debian)

```bash
# 1. Install system packages
sudo apt update && sudo apt install -y python3 python3-pip python3-venv rustc cargo nodejs npm gdb binwalk john hashcat foremost steghide libimage-exiftool-perl wireshark tshark git curl wget fish docker.io kubectl gh nmap sqlmap radare2 golang-go
sudo snap install go --classic gopls ghidra
pip install uv ruff pyright
pip install volatility3
go install golang.org/x/tools/gopls@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
npm install -g @biomejs/biome typescript
nuclei -update-templates

# 2. Install OpenCode
curl -fsSL https://opencode.ai/install | bash

# 3. Clone this config
mkdir -p ~/.config
git clone https://github.com/137-Trimethylxanthin/openCodeConfig.git ~/tmp-setup
cp -r ~/tmp-setup/.config/opencode ~/.config/opencode
rm -rf ~/tmp-setup

# 4. Set API key & launch
export DEEPSEEK_API_KEY="sk-your-key-here"
opencode

# 5. (Optional) Install Open Design preview
git clone https://github.com/nexu-io/open-design.git ~/Documents/code/open-design
cd ~/Documents/code/open-design && pnpm install
od-preview start
```

## What's Included

### MCP Servers (46)

| Category | Servers |
|----------|---------|
| **Dev & Docs** | context7, gh_grep, semgrep |
| **Design** | open-design, open-design-live-artifacts (disabled), figma (disabled) |
| **Productivity** | google-sheets (disabled), grafana (disabled) |
| **Creative** | blender (disabled), godot (disabled) |
| **Monitoring** | sentry (disabled) |
| **Messaging** | discord (disabled), telegram (disabled), whatsapp (disabled) |
| **Browser** | playwright, chrome-devtools, browser-use |
| **Infra** | docker, github, filesystem, postgres, sqlite |
| **AI & Search** | seqthink, memory, tavily, firecrawl, brave-search, exa, perplexity |
| **Pentest** | pentest-mcp, nmap, nuclei, sqlmap, webhook |
| **OSINT** | osint (Shodan+VT+SecurityTrails+Censys+DNS+WHOIS+crt.sh+BGP), wayback |
| **Threat Intel** | mitre-attack, cve-search |
| **Reverse Eng** | js-reverse |
| **Network** | wireshark |
| **Secure Dev** | skillssafe |
| **Disabled** | burp-bridge, cheatengine, sonarqube, gitlab, spotify, open-design-live-artifacts |

### Primary Agents (9)

Available directly or as default agent:

| Agent | Role |
|-------|------|
| **build** | Default — full development with all tools |
| **plan** | Planning and analysis without code changes |
| **maker** | Production-grade implementation |
| **fullstack-dev** | End-to-end full-stack features |
| **scrum** | Orchestrates full development lifecycle |
| **dev-lead** | Delegates tasks, reviews outputs, ensures quality |
| **devops** | Docker, CI/CD, deployments, monitoring |
| **ctf-player** | All CTF categories |
| **hacker** | Penetration testing, red team, vulnerability research |
| **designer** | Design specialist — decks, prototypes, brands, UI, social cards |
| **startup-mvp** | Rapid prototyping and MVPs |

### Subagents (25)

Specialized agents invoked by primary agents:

| Agent | Role |
|-------|------|
| **coder** | General-purpose coding |
| **ui-builder** | Frontend UI components and layouts |
| **architect** | System architecture and tech stack |
| **data-modeler** | Database schemas, migrations, ORM |
| **api-designer** | REST/GraphQL/gRPC API design |
| **code-reviewer** | Code review for best practices and bugs |
| **deep-review** | Architecture-level review (SOLID, security, perf) |
| **pr-reviewer** | GitHub PR review with inline comments |
| **debugger** | Root-cause bug investigation |
| **optimizer** | Performance, memory, bundle size |
| **security-auditor** | Dependency audit, CVE scanning |
| **security-lead** | Security program management |
| **test-writer** | Unit, integration, E2E tests |
| **docs-writer** | Documentation only |
| **product-manager** | Requirements, user stories, prioritization |
| **planning-agent** | Strategic planning and estimation |
| **research-lead** | Technology research and evaluation |
| **todo-creator** | Task tracking and project boards |
| **pentester** | Web app pentesting (OWASP Top 10) |
| **exploit-dev** | PoC exploit development |
| **redteam** | Campaign planning, C2, lateral movement |
| **blueteam** | Detection engineering, Sigma/YARA, IR |
| **reverse-engineer** | Binary/JS RE, Ghidra/GDB/Frida |
| **osint-agent** | Domain/IP/email OSINT |
| **crypto-agent** | Cryptography attacks, CTF crypto |
| **payload-crafter** | Shellcode, reverse shells, evasion |
| **designer** | Design specialist — decks, prototypes, brands, UI mockups |

### Slash Commands (16)

| Command | Agent | Purpose |
|---------|-------|---------|
| `/test` | build | Run full test suite, fix failures |
| `/lint` | build | Run linters, fix all issues |
| `/fmt` | build | Format all code |
| `/biome` | build | Biome lint+format (JS/TS/HTML/CSS) |
| `/review` | code-reviewer | Code review staged changes |
| `/pr-review` | pr-reviewer | GitHub PR review |
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

### Skills (10)

| Skill | Content |
|-------|---------|
| `open-design` | Design engine — decks, prototypes, brands, mockups, images |
| `git-release` | Semantic versioning, changelog generation |
| `pr-review` | Structured PR review checklist |
| `pentest-checklist` | Complete OWASP Testing Guide checklist |
| `ctf-methodology` | CTF workflows for all categories |
| `threat-hunting` | Sigma/YARA templates, hunt hypotheses |
| `crypto-recipes` | RSA/AES/ECC attacks, hash cracking |
| `payload-crafting` | Reverse shells, shellcode, AMSI bypass |
| `programming-resources` | Curated APIs, docs, tools, CTF resources |
| `passover` | Passover/holiday utilities |

### Plugins (34)

| Plugin | Purpose |
|--------|---------|
| `opencode-notify` | Desktop notifications on task completion |
| `opencode-shell-strategy` | Prevent TTY hangs on interactive commands |
| `opencode-vibeguard` | Redact secrets/PII before LLM calls |
| `opencode-wakatime` | Time tracking integration |
| `opencode-supermemory` | Persistent memory across sessions |
| `opencode-skills-collection` | Community skills bundle |
| `opencode-scheduler` | Scheduled task execution |
| `opencode-plugin-langfuse` | LLM observability and tracing |
| `opencode-subagent-statusline` | Subagent status in TUI |
| `opencode-background-agents` | Async background task delegation |
| `opencode-worktree` | Zero-friction git worktrees |
| `opencode-morph-fast-apply` | 10x faster code editing |
| `opencode-morph-plugin` | Morph Fast Apply + WarpGrep search |
| `opencode-dynamic-context-pruning` | Prune obsolete tool outputs |
| `opencode-pty` | Background processes in PTY |
| `opencode-websearch-cited` | Native cited web search |
| `opencode-type-inject` | Auto-inject TS/Svelte types into reads |
| `opencode-skillful` | Lazy-load prompts on demand |
| `opencode-sentry-monitor` | Sentry AI agent tracing |
| `opencode-firecrawl` | Web scraping and crawling |
| `opencode-conductor` | Protocol-driven Context→Spec→Plan→Implement |
| `opencode-md-table-formatter` | Clean up LLM-generated markdown tables |
| `opencode-daytona` | Isolated Daytona sandbox sessions |
| `opencode-devcontainers` | Multi-branch devcontainer isolation |
| `opencode-openai-codex-auth` | Use ChatGPT Plus/Pro subscription |
| `opencode-gemini-auth` | Use Gemini plan instead of API billing |
| `opencode-antigravity-auth` | Antigravity free models |
| `opencode-google-antigravity-auth` | Google Antigravity OAuth + Google Search |
| `opencode-zellij-namer` | AI-powered Zellij session naming |
| `opencode-jfrog-plugin` | JFrog platform integration |
| `@plannotator/opencode` | Interactive plan review with annotation |
| `@openspoon/subtask2` | Advanced orchestration system |
| `micode` | Structured Brainstorm→Plan→Implement workflow |
| `octto` | Interactive browser UI for AI brainstorming |
| `sudo-plugin.ts` (custom) | Auto-inject SUDO_ASKPASS for sudo commands |

### Custom Themes (3)

| Theme | Style |
|-------|-------|
| `catppuccin-mocha` | Catppuccin Mocha (default) |
| `dracula` | Dracula |
| `rose-pine` | Rosé Pine |

Plus built-in themes: tokyonight, everforest, ayu, catppuccin, gruvbox, kanagawa, nord, matrix, one-dark, system, opencode

## File Structure

```
~/.config/opencode/
├── opencode.json          # Main config — model, 46 MCPs, 34 plugins, formatters, permissions, agents
├── AGENTS.md              # Global coding rules for 8+ languages
├── tui.json               # TUI settings — theme, mouse, scroll
├── agents/                # 34 agent definitions (markdown)
│   ├── plan.md / build.md                      # Primary agents
│   ├── coder.md  ├── maker.md  ├── fullstack-dev.md  ├── ui-builder.md
│   ├── architect.md  ├── data-modeler.md  ├── api-designer.md
│   ├── devops.md  ├── dev-lead.md  ├── scrum.md  ├── todo-creator.md
│   ├── code-reviewer.md  ├── deep-review.md  ├── pr-reviewer.md
│   ├── debugger.md  ├── optimizer.md  ├── test-writer.md
│   ├── security-auditor.md  ├── security-lead.md
│   ├── docs-writer.md  ├── product-manager.md
│   ├── planning-agent.md  ├── research-lead.md  ├── startup-mvp.md
│   ├── pentester.md  ├── exploit-dev.md  ├── redteam.md  ├── blueteam.md
│   ├── reverse-engineer.md  ├── osint-agent.md  ├── hacker.md  ├── designer.md
│   ├── crypto-agent.md  ├── payload-crafter.md  └── ctf-player.md
├── commands/              # 16 slash command definitions (markdown)
│   ├── test.md  ├── lint.md  ├── fmt.md  ├── biome.md
│   ├── review.md  ├── pr-review.md  ├── audit.md  ├── optimize.md
│   ├── init-project.md  ├── pentest.md  ├── recon.md
│   ├── threat-model.md  ├── exploit.md  ├── payload.md
│   ├── ctf.md  └── forensics.md
├── skills/                # 10 reusable skill definitions (+132 Open Design skills)
│   ├── open-design/        ├── git-release/       ├── pr-review/
│   ├── pentest-checklist/ ├── ctf-methodology/
│   ├── threat-hunting/    ├── crypto-recipes/
│   ├── payload-crafting/  ├── programming-resources/
│   └── passover/
├── themes/                # 3 custom theme files
│   ├── catppuccin-mocha.json  ├── dracula.json  └── rose-pine.json
├── plugins/               # Custom local plugins
│   └── sudo-plugin.ts
└── bin/
    ├── sudo-askpass       # SUDO_ASKPASS helper script
    ├── od-design          # OD CLI wrapper (OD_PREVIEW-aware)
    └── od-preview         # Start/stop preview daemon
```

## Environment Variables

```bash
# Required
export DEEPSEEK_API_KEY="sk-..."       # Your DeepSeek API key

# Open Design — switch between stable (AUR) and preview (source)
export OD_PREVIEW="1"                  # Set to 1 for source-built 0.8.0 preview
                                       # Leave unset for AUR 0.7.0 stable

# Optional — enables additional MCP features
export GITHUB_TOKEN="ghp_..."          # GitHub API access
export CONTEXT7_API_KEY="..."          # Higher rate limits on docs search
export SHODAN_API_KEY="..."            # Shodan OSINT queries
export VIRUSTOTAL_API_KEY="..."        # Malware analysis
export SECURITYTRAILS_API_KEY="..."   # DNS/domain OSINT
export CENSYS_API_ID="..."             # Internet scanning OSINT
export CENSYS_API_SECRET="..."         # Internet scanning OSINT

# Optional — messaging MCP bots
export DISCORD_BOT_TOKEN="..."          # Discord bot token (Discord Dev Portal)
export DISCORD_APP_ID="..."             # Discord application ID
export DISCORD_GUILD_ID="..."           # Discord server/guild ID
export TELEGRAM_BOT_TOKEN="..."         # Telegram bot token (@BotFather)

# Optional — sudo plugin
export SUDO_PASSWORD="..."             # Auto-fill sudo passwords
export OPENCODE_SUDO_ENABLED="1"       # Enable GUI password prompt
```

## Languages Supported

Python · Rust · TypeScript · JavaScript · Go · Svelte · Astro · HTML · CSS · Vite

Formatters auto-run on write: ruff (Python), biome (JS/TS/HTML/CSS/Svelte/Astro), gofmt (Go), cargofmt (Rust)

LSP servers auto-start on file open: pyright, rust-analyzer, typescript, gopls, svelte, astro

## Open Design Integration

[Open Design](https://github.com/nexu-io/open-design) is an agent-native design engine. It generates decks, prototypes, brand identities, UI mockups, posters, social cards, diagrams, video frames, and more through MCP. The `open-design` MCP server connects to a local daemon and exposes tools for project management, file operations, and artifact creation.

### Installation

**Stable (AUR, recommended for Arch):**
```bash
paru -S open-design-bin          # installs od-design CLI globally
```

**Preview (source, for 0.8.0 features):**
```bash
git clone https://github.com/nexu-io/open-design.git ~/Documents/code/open-design
cd ~/Documents/code/open-design && git checkout main && pnpm install

# Rebuild native modules if needed
cd node_modules/.pnpm/better-sqlite3@*/node_modules/better-sqlite3 && npx node-gyp rebuild
node node_modules/.pnpm/electron@*/node_modules/electron/install.js
```

**Launcher scripts** (included in this config at `~/.config/opencode/bin/`):

| Script | Purpose |
|--------|---------|
| `od-design` | CLI wrapper — auto-switches between AUR stable (`0.7.0`) and source preview (`0.8.0`) based on `OD_PREVIEW` env var |
| `od-preview` | Daemon lifecycle — `start`, `daemon`, `stop`, `status`, `logs`, `url` |

```bash
# Start the daemon + web UI
od-preview start        # daemon on :7456, web UI on :7457

# Use preview (source) instead of stable
export OD_PREVIEW=1
od-preview start
```

### Skills and Agents

This config includes two Open Design components that work together:

**`designer` agent** (`agents/designer.md`):
A primary agent (`mode: all`) that handles design tasks. It uses the `open-design` MCP server and follows a 6-step workflow: understand the request → check active context → select a design system → generate the artifact → write via MCP → direct to preview. Invoke it explicitly with `/agent designer` or by asking for any design task.

**`open-design` skill** (`skills/open-design/SKILL.md`):
Auto-loads when design-related terms are detected (design, deck, prototype, brand, mockup, poster, slide, presentation, landing page, design system, social card, diagram, flowchart, resume, wireframe, etc.). Contains the full reference for all 152+ design systems, MCP tools, artifact types, and CLI commands.

```
# Skill auto-triggers on any of these terms:
"design a landing page for..."
"create a pitch deck..."
"build a brand identity..."
"mock up an iPhone screenshot..."
"generate a social card for..."
```

### MCP Servers

Two MCP servers are configured in `opencode.json`:

| Server | Status | Purpose |
|--------|--------|---------|
| `open-design` | **enabled** | Project management, file ops, artifact creation, active context |
| `open-design-live-artifacts` | disabled | Live artifact streaming (preview feature) |

### Design Systems (152 available)

Open Design bundles 152+ design systems. Key categories:

| Category | Systems |
|----------|---------|
| **General** | `default`, `warm-editorial`, `editorial` |
| **Japanese** | `kami` (parchment + ink aesthetic) |
| **Bold** | `brutalism`, `neobrutalism`, `swiss-creative` |
| **Glass/Clay** | `glassmorphism`, `claymorphism` |
| **Magazine** | `atelier-zero` (collage), `article-magazine` |
| **Terminal** | `opencode-ai` (monospace-first, terminal-native) |
| **Brand** | `apple`, `nike`, `stripe`, `spotify`, `figma`, `notion`, `vercel`, `supabase`, `linear-app`, `airbnb`, `tesla`, `nvidia`, `discord`, `github`, `openai`, `claude`, `cursor`, `raycast`, `warp` |

```bash
od design-systems list              # browse all 152+ systems
od design-systems show opencode-ai  # inspect a specific system
```

### CLI Reference

```bash
od project create --name <name> --kind <kind>   # create a project
od project list                                  # list all projects
od design-systems list                           # browse design systems
od design-systems show <id>                      # inspect a design system
od skills list                                   # list available templates/skills
od skills show <id>                              # inspect a skill
od plugin search <query>                         # search community plugins
od plugin install <id>                           # install a plugin
od media generate --surface image --prompt "..." # generate media
```

Run CLI commands from `~/Documents/code/open-design` (source) or anywhere (AUR).

### Ports

| Service | Port |
|---------|------|
| Daemon API | `7456` |
| Web UI | `7457` |



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
