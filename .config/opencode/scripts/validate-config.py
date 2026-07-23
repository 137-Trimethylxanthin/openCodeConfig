#!/usr/bin/env python3
from __future__ import annotations
import json
from pathlib import Path
import re
import sys

root = Path(__file__).resolve().parents[1]
errors = []

try:
    cfg = json.loads((root / 'opencode.json').read_text())
except Exception as exc:
    print(f'ERROR: invalid opencode.json: {exc}')
    raise SystemExit(1)

primary = {name for name, value in cfg.get('agent', {}).items() if value.get('mode') == 'primary'}
configured = set(cfg.get('agent', {}))
custom = {p.stem for p in (root / 'agents').glob('*.md')}
known = configured | custom

if cfg.get('default_agent') not in primary:
    errors.append('default_agent is not a configured primary agent')
if cfg.get('subagent_depth') != 1:
    errors.append('subagent_depth must remain 1')
if 'enabled_providers' in cfg:
    errors.append('enabled_providers unexpectedly hides connected providers')
if cfg.get('instructions') == ['AGENTS.md']:
    errors.append('AGENTS.md is redundantly injected through instructions')

for name, agent in cfg.get('agent', {}).items():
    variant = agent.get('variant')
    if variant in {'none', 'minimal', 'low', 'fast'}:
        errors.append(f'{name}: disallowed variant {variant}')
    task = agent.get('permission', {}).get('task')
    if isinstance(task, dict):
        for target, action in task.items():
            if target != '*' and action == 'allow' and target not in known:
                errors.append(f'{name}: unknown task target {target}')

for path in sorted((root / 'agents').glob('*.md')):
    text = path.read_text()
    match = re.match(r'^---\n(.*?)\n---\n', text, re.S)
    if not match:
        errors.append(f'{path.name}: missing YAML frontmatter')
        continue
    fm = match.group(1)
    for required in ['description:', 'mode: subagent', 'model:', 'variant:', 'steps:', 'permission:']:
        if required not in fm:
            errors.append(f'{path.name}: missing {required}')
    if re.search(r'^\s*variant:\s*(none|minimal|low|fast)\s*$', fm, re.M):
        errors.append(f'{path.name}: disallowed reasoning variant')
    if not re.search(r'^\s*task:\s*deny\s*$', fm, re.M):
        errors.append(f'{path.name}: subagent must deny nested tasks')

if (root / 'node_modules').exists():
    errors.append('node_modules must not be shipped')

if errors:
    print('VALIDATION FAILED')
    for error in errors:
        print(f'- {error}')
    raise SystemExit(1)

print(f'VALID: {len(primary)} primary workflows, {len(custom)} custom subagents, {len(known)} total known agent names')
