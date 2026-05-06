---
description: Analyze forensic artifacts — disk images, memory dumps, PCAP, logs
agent: ctf-player
subtask: true
---

Analyze the provided forensic artifact(s) and extract findings:

$ARGUMENTS

**If Disk Image**:
- Mount and explore filesystem structure
- Recover deleted files (foremost, testdisk patterns)
- Extract registry hives, browser history, shellbags
- Check $MFT, USN journal, event logs

**If Memory Dump**:
- Determine OS profile (Volatility imageinfo)
- List processes, network connections, loaded DLLs/so
- Scan for injected code, hooks, rootkits
- Extract process memory, dumped files, passwords

**If Network PCAP**:
- Identify protocols and session reconstruction
- Extract transferred files, credentials
- Detect C2 patterns, exfiltration, beaconing
- SSL/TLS analysis, DNS tunneling detection

**If Logs**:
- Timeline reconstruction
- Identify attacker IPs, tools, commands
- Trace lateral movement, privilege escalation

**Output**: Comprehensive analysis with timeline, IOCs, and any extracted flags/data.
