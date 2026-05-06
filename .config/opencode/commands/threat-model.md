---
description: Create a MITRE ATT&CK threat model for the given system or adversary
agent: redteam
subtask: true
---

Create a comprehensive threat model for $ARGUMENTS using the MITRE ATT&CK framework:

1. **Identify Assets**: What are we protecting?
2. **Threat Actors**: Who would attack? APT groups, script kiddies, insiders?
3. **Attack Surface**: External, internal, cloud, supply chain
4. **TTP Mapping**: Map likely techniques to the MITRE ATT&CK matrix covering:
   - Initial Access → Execution → Persistence → Privilege Escalation
   - Defense Evasion → Credential Access → Discovery → Lateral Movement
   - Collection → Command & Control → Exfiltration → Impact
5. **Detection Coverage**: What can we currently detect? Where are the gaps?
6. **Risk Scoring**: Highest impact/most likely techniques
7. **Recommendations**: Detection rules, hardening steps, monitoring improvements

**Output**: Structured threat model document with MITRE technique IDs, detection gap analysis, and a prioritized hardening roadmap.
