---
description: OSINT recon on target domain, IP, or org
agent: osint-agent
subtask: true
---

Perform full OSINT reconnaissance on $ARGUMENTS:

**Domain Intelligence**:
- WHOIS lookup and history
- DNS records (A, AAAA, MX, NS, TXT, CNAME, SOA)
- Subdomain enumeration via crt.sh and certificate transparency
- Zone transfer attempts

**IP & Infrastructure**:
- Shodan search for exposed services
- IP reputation, geolocation, hosting provider
- Reverse DNS, related domains
- BGP/ASN analysis

**Web Surface**:
- Technology stack fingerprinting
- Wayback Machine historical analysis
- Google/GitHub dorking for sensitive exposure
- JavaScript analysis for endpoints/secrets

**Email & Identity**:
- Email breach checks
- Associated usernames and social profiles

**Deliverable**: Comprehensive OSINT report with all findings correlated. Include a summary of attack surface.
