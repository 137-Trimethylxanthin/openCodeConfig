---
name: open-design
description: Design generation engine — create decks, prototypes, images, design systems, social cards, mockups, diagrams, brands. Use when asked to design anything visual, create presentations, generate branding, build UI mockups, or produce design artifacts.
triggers:
  - design
  - deck
  - prototype
  - brand
  - mockup
  - poster
  - slide
  - presentation
  - landing page
  - design system
  - social card
  - diagram
  - flowchart
  - resume
  - article layout
  - video frame
  - device mockup
  - color palette
  - typography
  - Figma
  - UI mockup
  - wireframe
  - hero image
  - logo outro
  - glitch title
license: MIT
compatibility: opencode
metadata:
  audience: developers
  requires: Open Design daemon running (od-preview start)
---

# Open Design — Agent-Native Design Engine

Open Design is a headless design engine that generates production-grade design artifacts through agents. It runs as a daemon on `http://127.0.0.1:7456` and exposes tools via MCP.

## Prerequisites

The Open Design daemon must be running. Start it with:
```bash
od-preview start
```
Verify: `curl http://127.0.0.1:7456/api/health` should return `{"ok":true}`.

## Available MCP Tools

The `open-design` MCP server exposes these tools:

| Tool | Use |
|------|-----|
| `list_projects` | List all design projects on this daemon |
| `get_active_context` | Find the project/file the user has open |
| `get_project` | Get project metadata (name, design system, kind) |
| `get_file` | Read a project file (with offset/limit) |
| `get_artifact` | **BEST for reading designs.** Bundles entry file + all referenced siblings (HTML imports, CSS, JS, images) up to depth 3 |
| `search_files` | Substring search across project files |
| `list_files` | List files in a project with metadata |
| `create_artifact` | Write a new artifact into a project |

## Workflow: Generate a Design

### 1. Check Active Context
First, call `get_active_context` to see if the user has a project open. If they do, use that project. If not, create one.

### 2. Create a Project (via CLI)
```bash
od project create --name "my-brand" --kind web-prototype
```
Run this in the Open Design repo: `~/Documents/code/open-design`

### 3. Generate the Artifact
Use the MCP `create_artifact` tool to write the generated HTML/CSS/JS into the project. The artifact manifest helps Open Design render it correctly.

### 4. Preview
The artifact renders at `http://127.0.0.1:7457` in the active project.

## Design Systems (152 available)

Open Design has 152+ bundled design systems. Key ones:

| System | Style |
|--------|-------|
| `default` | Neutral Modern starter |
| `warm-editorial` | Warm Editorial serif |
| `kami` | Japanese paper aesthetic (parchment + ink) |
| `atelier-zero` | Magazine-grade collage |
| `opencode-ai` | Terminal-native, monospace-first |
| `brutalism` | Raw, unpolished brutalism |
| `glassmorphism` | Frosted glass translucent |
| `claymorphism` | Soft 3D clay |
| `neobrutalism` | Bold colors + hard shadows |

### Brand-specific systems
`apple`, `nike`, `stripe`, `spotify`, `figma`, `notion`, `vercel`, `supabase`, `linear-app`, `airbnb`, `tesla`, `nvidia`, `discord`, `github`, `openai`, `claude`, `cursor`, `raycast`, `warp`

### Finding systems
```bash
od design-systems list
od design-systems show opencode-ai
```

## Key Capabilities by Task

### Decks & Presentations
- The `deck-swiss-international` template: 16-column grid, single saturated accent, 22 locked layouts
- The `deck-open-slide-canvas` template: 1920x1080, React component-level free composition
- HTML-PPT studio: generate `.html` slides, export to PPTX
- Run `od skills show deck-swiss-international` for the full spec

### Prototypes & UI
- `web-prototype` template: full interactive prototype
- `saas-landing`, `pricing-page`, `docs-page`, `dashboard`, `mobile-app` templates
- Login flows, onboarding screens, kanban boards

### Images & Posters
- `poster-hero`: vertical poster / social sharing image
- `image-poster`, `magazine-poster`: editorial posters
- `card-twitter`, `card-xiaohongshu`, `social-x-post-card`: social cards

### Mockups & Devices
- `mockup-device-3d`: iPhone + MacBook with real HTML content and glass lens refraction

### Diagrams & Charts
- `frame-flowchart-sticky`: SVG curve connectors + sticky notes
- `frame-data-chart-nyt`: editorial charts with NYT-newsroom layout

### Video Frames
- `frame-glitch-title`: digital glitch title cards
- `frame-light-leak-cinema`: film grain + letterbox cinema openers
- `frame-liquid-bg-hero`: WebGL fluid displacement backgrounds
- `frame-logo-outro`: logo + glow bloom + tagline reveal
- `vfx-text-cursor`: cursor light trail effects

### Documents
- `article-magazine`: long-form HTML essays
- `doc-kami-parchment`: warm parchment editorial documents
- `resume-modern`: A4 single-page resume

## Design Systems as MCP Resources

Design systems are exposed as `od://design-systems/<id>/DESIGN.md` resources. When building a design, pull the active design system to get color palette, typography, spacing, and component specs.

## Design Briefs

For structured design requests, use the `design-brief` skill pattern to parse user requirements into a 9-section design spec (Visual Theme, Color Palette, Typography, Components, Layout, Depth/Elevation, Interaction/Motion, Responsive, Agent Prompt Guide).

## CLI Quick Reference

```bash
od project create --name <name> --kind <kind>
od project list
od design-systems list
od design-systems show <id>
od skills list
od skills show <id>
od plugin search <query>
od plugin install <id>
od media generate --surface image --prompt "..."
```

Commands must be run from `~/Documents/code/open-design` unless using the AUR-installed version.

## Notes

- The daemon at `http://127.0.0.1:7456/api/*` is the single source of truth
- All MCP tools default to the user's active project/file when no explicit project is passed
- Use `get_artifact` over `get_file` whenever you need the full rendered design — it bundles all referenced assets
- Design systems influence every generated artifact — always check `get_active_context` for the selected system
- For complex multi-file designs, use `create_artifact` with an `artifactManifest` that lists all files and their relationships
