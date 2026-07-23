---
description: Use only during explicit project closure or quality-gate work with complex acceptance criteria; not for every
  behavior change.
mode: subagent
hidden: true
model: openai/gpt-5.6-terra
variant: medium
reasoningEffort: medium
reasoningSummary: auto
textVerbosity: low
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
Compare the implementation against explicit requirements, acceptance criteria, and the approved plan. Identify material omissions, scope creep, or incompatible behavior. Ignore preferences not present in the specification and do not edit files.
