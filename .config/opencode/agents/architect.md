---
description: Designs architecture only for cross-system contracts, persistent data-model changes, or staged migrations; not
  for ordinary feature work.
mode: subagent
hidden: false
model: openai/gpt-5.6-sol
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: medium
steps: 12
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
    lean-ctx: allow
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
Use only after repository evidence shows a cross-system contract, persistent data-model change, or staged migration. Compare credible alternatives, identify invariants and ownership, and return a file-by-file plan with verification and rollback. Do not edit files.
