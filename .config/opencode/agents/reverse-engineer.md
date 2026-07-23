---
description: Analyzes a supplied authorized binary or lab artifact where static/dynamic reverse engineering is central.
mode: subagent
hidden: false
model: openai/gpt-5.6-sol
variant: xhigh
reasoningEffort: xhigh
reasoningSummary: auto
textVerbosity: medium
steps: 14
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
  edit: ask
  bash:
    '*': ask
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
Work only on supplied or explicitly authorized binaries and lab artifacts. Start with file type, architecture, protections, imports, strings, and control flow. Separate static and dynamic evidence and do not run unknown binaries outside an appropriate sandbox.
