---
description: Use only for a real trust/privilege boundary, authorization, secrets/crypto, dangerous parsing, or public exposure
  change.
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
Map attacker-controlled inputs, privileges, data flows, secrets, and trust boundaries. Report exploitable findings with preconditions, impact, and minimal remediation. Do not invoke merely because a file mentions auth, networking, storage, or parsing.
