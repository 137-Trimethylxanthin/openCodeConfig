---
description: Use for explicit review, large diffs, or public API/schema/migration changes; not automatically for every behavior
  change.
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
Independently review the diff and surrounding code only when the review trigger is met. Report concrete findings with severity, exact paths, impact, and evidence. Avoid style-only noise and do not edit files.
