---
name: threat-hunting
description: Blue team threat hunting methodology and detection engineering
license: MIT
compatibility: opencode
metadata:
  audience: defenders
  workflow: detection
---

## Threat Hunting Methodology

### Hunt Cycle
1. **Hypothesis Formation**: Based on threat intel, recent incidents, or known TTPs
2. **Data Collection**: Gather relevant logs (endpoint, network, cloud, identity)
3. **Analysis**: Query, visualize, correlate across data sources
4. **Validation**: Verify findings are malicious, not benign
5. **Response**: Contain if active, document for detection engineering
6. **Feedback**: Create/update detection rules, improve visibility

### Common Hunt Hypotheses

#### Credential Access
- LSASS process access from unexpected processes
- Kerberoasting: Event 4769 with RC4 encryption type
- DCSync: Event 4662 with specific GUIDs
- Suspicious SAM/SYSTEM registry access
- NTDS.dit access

#### Persistence
- New services created: Event 7045
- Scheduled tasks: Event 4698
- WMI event subscriptions
- Startup folder modifications
- Registry Run/RunOnce keys
- New local user creation: Event 4720
- SSH authorized_keys modifications

#### Lateral Movement
- PSExec/SMB: Event 5145 with specific share access
- WinRM: Event 4648 with non-standard workstations
- WMI remote execution
- RDP from unusual source IPs
- DCOM lateral movement

#### Command & Control
- DNS queries to recently registered domains
- Long-duration DNS TXT queries
- HTTP POST with minimal headers
- Periodic beaconing (Jitter analysis)
- Unusual user-agent strings
- Non-standard protocol usage on standard ports

#### Defense Evasion
- AMSI/ETW patching detection
- Process hollowing (cmd.exe spawning w/ unusual parent)
- Clearing event logs: Event 1102
- Timestomping (MFT anomalies)
- Disabling security products

### Sigma Rule Template
```yaml
title: [Descriptive title]
id: [UUID]
status: experimental
description: [What this detects]
author: [Your name]
date: [YYYY/MM/DD]
tags:
  - attack.[tactic]
  - attack.[technique_id]
logsource:
  category: [process_creation|dns|firewall|etc.]
  product: windows
detection:
  selection:
    EventID: [ID]
    [Field]: [Value]
  condition: selection
falsepositives:
  - [Known legitimate use case]
level: [low|medium|high|critical]
```

### YARA Rule Template
```yara
rule Malware_Name {
  meta:
    description = "Detects Malware Name sample"
    author = "Your Name"
    date = "YYYY-MM-DD"
    hash = "sample_hash"
    reference = "https://..."
  strings:
    $str1 = "malicious_string" wide ascii
    $str2 = { 4D 5A 90 00 [4] FF FF }
    $re1 = /regex[0-9]{4}patttern/
  condition:
    uint16(0) == 0x5A4D and any of them
}
```
