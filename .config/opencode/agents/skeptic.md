---
description: Use only before a difficult-to-reverse architecture/migration decision with at least two credible approaches.
mode: subagent
hidden: true
model: openai/gpt-5.6-terra
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: medium
steps: 8
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
Challenge one difficult-to-reverse decision. Search for hidden coupling, migration hazards, operational failure modes, missing evidence, and simpler credible alternatives. Do not repeat the architect review or edit files.
