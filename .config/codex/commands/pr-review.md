---
description: Review a GitHub Pull Request and post inline comments
agent: pr-reviewer
subtask: true
---

Review the following GitHub Pull Request: $ARGUMENTS

If no PR number was provided, auto-detect from the current branch:
`gh pr list --head $(git branch --show-current) --json number --jq '.[0].number'`

Workflow:
1. Fetch PR metadata and diff
2. Analyze for correctness, security, performance, test coverage, breaking changes
3. Post inline review comments on specific lines
4. Post a summary review (approve/comment/request-changes)

Be thorough but constructive. Reference project conventions when suggesting changes.
