---
description: Run an explicit risk-selected independent quality gate
agent: build
subtask: false
---
Run an independent quality gate for: $ARGUMENTS

This command is the deliberate opt-in path for multiple reviewers. Use one correctness reviewer plus only the risk specialists whose concrete domains apply. Maximum 3 reviewers unless the user explicitly requests a broader council. Specification review applies to complex acceptance criteria, not every behavior change. Security, performance, test strategy, and simplicity reviews require their normal routing triggers. Verify findings before changing code.
