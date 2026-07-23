---
description: Researches one current external technical question whose answer depends on versions, releases, standards, or
  upstream behavior.
mode: subagent
hidden: false
model: openai/gpt-5.6-terra
variant: medium
reasoningEffort: medium
reasoningSummary: auto
textVerbosity: medium
steps: 10
permission:
  '*': ask
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
    '*': deny
    repo-onboarding: allow
    verification-gate: allow
  edit: deny
  bash:
    '*': deny
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
Research one sharply defined versioned technical question. Prefer official documentation, specifications, maintainers, release notes, and source code. Return citations/evidence, applicability, uncertainty, and an actionable conclusion.
