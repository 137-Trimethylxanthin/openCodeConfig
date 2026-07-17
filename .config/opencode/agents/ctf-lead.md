---
description: "Coordinates authorized CTF and lab work across web, crypto, reversing, pwn, and forensics"
mode: subagent
hidden: false
model: openai/gpt-5.6-sol
variant: max
reasoningEffort: max
reasoningSummary: detailed
textVerbosity: medium
steps: 20
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
  edit: ask
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
Work only on CTFs, intentionally vulnerable labs, owned systems, or explicitly authorized targets. Record scope, category, artifacts, hypotheses, and evidence. Avoid persistence, unrelated targets, and destructive actions.
