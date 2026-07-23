# Global OpenCode rules

- Inspect the repository and nearest project instructions before editing.
- Direct execution is the default for bounded work; do not launch subagents merely because a task changes behavior or mentions a risk-domain keyword.
- Delegate only when the active primary prompt's measurable trigger is satisfied, and stay within its subagent budget.
- Prefer the smallest correct change and preserve established conventions.
- Never claim a build, test, deployment, migration, or command succeeded unless it was run and inspected.
- Treat privilege escalation, destructive commands, remote writes, deployments, credentials, and pushes as user-controlled actions.
- Use primary sources for changing APIs and state uncertainty explicitly.
- Before completion, inspect the diff and run proportionate verification.
- No agent may use a `*-fast` model or reasoning below `medium`.

## Output style

- Be concise, but include enough evidence, exact paths, commands, and verification results to make the answer actionable.
- Prefer clear headings and short bullets over artificial abbreviations or fixed token limits.
- Show changed code when it is the deliverable; do not omit essential details to satisfy brevity.

## Lean CTX

- Every agent must use Lean CTX when it is available; use native tools only when no matching `ctx_*` tool is available or Lean CTX fails, and record that fallback in the handoff/result.
- Start each session with `ctx_overview`; use `ctx_compose` first for code understanding. Prefer `ctx_read`/`ctx_search`/`ctx_glob`/`ctx_tree` for files, `ctx_patch` after an anchored read for edits, and `ctx_shell` for verification.
- The current `standard` profile exposes 17 direct tools (older docs may say 16): `ctx_overview`, `ctx_compose`, `ctx_explore`, `ctx_read`, `ctx_search`, `ctx_glob`, `ctx_tree`, `ctx_callgraph`, `ctx_graph`, `ctx_patch`, `ctx_delta`, `ctx_shell`, `ctx_execute`, `ctx_expand`, `ctx_session`, `ctx_knowledge`, and `ctx_url_read`. Use `ctx_call` as the gateway for installed tools not directly exposed; discover them with `ctx_discover_tools`.
- Use each tool by intent: overview/orientation; compose/task understanding; explore/cited investigation; read/file content; search/text, semantic, or symbol lookup; glob/file names; tree/layout; callgraph/call edges; graph/file dependencies and impact; patch/hash-anchored edits; delta/post-edit changes; shell/build-test commands; execute/sandboxed scripts; expand/archived output; session/task findings and decisions; knowledge/durable project facts; url_read/primary web sources.

### Multi-agent coordination and handoff

- Every participating agent registers with `ctx_agent action=register` and a clear role, keeps `status` current, and runs `ctx_agent action=sync` before assigning, accepting, or completing work. If `ctx_agent` is not directly exposed, invoke it through `ctx_call`.
- Use `ctx_task` for nontrivial delegated work with explicit owner and state. Use direct `ctx_agent` messages for requests, blockers, findings, and status; use diaries for private reasoning/progress and `share_knowledge` only for team facts.
- When an agent's own prompt designates it manager-only for heavy work, it must delegate implementation, command execution, and detailed investigation to suitable workers rather than perform them itself. Bounded trivial coordination/config edits may remain direct only where permissions permit; if no suitable worker exists, return the plan and blocker rather than silently taking over heavy execution.
- Workers must receive an exact objective, owned scope, relevant paths/symbols, constraints, dependencies, acceptance checks, permitted commands, and rollback expectations. They use `ctx_overview`/`ctx_compose`, make only owned changes, verify them, and report changed files, commands/results, risks, blockers, and the next action.
- Use `ctx_agent action=handoff` only for a small status-only baton pass. For analysis→implementation, implementation→review, cross-session, or other stateful transfer, create and export a deterministic `ctx_handoff` bundle with relevant paths; the receiver imports it before work. Keep the default redacted privacy unless full context is explicitly required and authorized.
- A full handoff must state: objective, owner, completed/pending work, files/symbols, decisions and rejected alternatives, constraints, exact verification evidence, known risks/blockers, next action, and recovery/rollback steps. Never include credentials or unrelated context.
- `ctx_share` may push already-loaded compressed file context to the receiver, but it is only a token optimization and never replaces the durable handoff. The receiver independently inspects the imported state and verification evidence; reviewers remain independent and post findings through `ctx_agent`.
- Before final completion, the manager runs `ctx_agent action=sync`, confirms every delegated task is terminal or explicitly blocked, records durable facts in `ctx_knowledge`, and reports residual risk and rollback.

<!-- lean-ctx-rules -->
<!-- version: 8 -->

lean-ctx shadow mode: native file/search/shell calls auto-route to ctx_* — no tool-mapping needed.
Exclusive tools (no native trigger): ctx_compose (understand code, call first), ctx_search(action=symbol) (exact symbol), ctx_search(action=semantic) (by meaning), ctx_callgraph (callers), ctx_knowledge / ctx_session (memory).
<!-- lean-ctx-compression -->
OUTPUT STYLE: dense
- Each statement = one atomic fact line
- Use abbreviations: fn, cfg, impl, deps, req, res, ctx, err, ret
- Diff lines only (+/-/~), never repeat unchanged code
- Symbols: → (causes), + (adds), − (removes), ~ (modifies), ∴ (therefore)
- No narration, no filler, no hedging
- BUDGET: ≤200 tokens per response unless code block required
<!-- /lean-ctx-compression -->
<!-- /lean-ctx-rules -->
