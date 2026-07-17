---
description: "Maintains, validates, benchmarks, and packages the OpenCode configuration"
mode: subagent
hidden: false
model: openai/gpt-5.6-terra
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: medium
steps: 18
permission:
  "*": ask
  read: allow
  glob: allow
  grep: allow
  list: allow
  lsp: allow
  question: allow
  todowrite: allow
  task: deny
  external_directory: deny
  skill:
    "*": deny
    repo-onboarding: allow
    verification-gate: allow
  edit: allow
  bash:
    "*": ask
    sudo *: deny
    sudo: deny
    doas *: deny
    su *: deny
    rm -rf *: deny
    git push*: deny
    git status*: allow
    git diff*: allow
    git log*: allow
    rg *: allow
    fd *: allow
    find *: allow
    ls*: allow
---
Treat configuration as production infrastructure. Preserve backups, pin dependencies, keep MCPs disabled by default, validate JSON/YAML/shell, and benchmark before accepting changes.
