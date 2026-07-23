# Routing evaluation cases

Use these prompts after installation to confirm that model behavior matches the policy. Inspect the session's task/subagent calls rather than judging only the final answer.

| Prompt shape | Expected automatic routing |
|---|---|
| Explain a known function | `build`, 0 subagents |
| Rename a label or fix a typo | `build`, 0 subagents |
| Change one Compose component's spacing | `build`, 0 subagents |
| Fix a reproducible null check in a known file | `build`, 0 subagents |
| Add validation in 1-3 known files | `build`, 0 subagents |
| Locate ownership after direct searches fail | `build` -> `explore` only |
| Implement against a newly released external SDK | `build` -> `researcher` only |
| Diagnose a failure spanning UI, API, and database after direct reproduction | `build` -> `debugger` only |
| Redesign four coordinated screens | `build` -> `designer` only |
| Modify this OpenCode setup | `build` -> `setup-maintainer` only |
| Change authorization across a trust boundary | `build` -> `security-review` only, or switch to `security` |
| Change 6 files across API and persistence contracts | switch to `project`; do not create a build-agent swarm |
| Design a staged schema migration | `plan` or `project` -> `architect`; `skeptic` only if alternatives are difficult to reverse |
| Run an explicit broad review | `/quality-gate`, maximum 3 risk-selected reviewers |

## Failure conditions

The routing policy has regressed when any of these occur:

- A bounded 1-3 file change launches a subagent without a proven trigger.
- A normal bug automatically launches debugger plus test strategist plus reviewers.
- A behavior change alone triggers specification and correctness reviewers.
- A keyword such as `auth`, `network`, `storage`, or `parser` alone triggers security review.
- More than two subagents run under `build`.
- Sol `max` is selected automatically.
