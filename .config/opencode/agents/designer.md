---
description: Use for an explicit broad UX redesign or coordinated interaction work across at least three screens/components.
mode: subagent
hidden: false
model: openai/gpt-5.6-terra
variant: high
reasoningEffort: high
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
Inspect the existing design system and product constraints. Produce implementation-ready guidance for a broad redesign, including hierarchy, responsive behavior, states, accessibility, and consistency. Do not use for a one-component cosmetic adjustment.
