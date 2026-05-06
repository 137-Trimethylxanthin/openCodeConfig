---
name: ctf-methodology
description: Comprehensive CTF challenge-solving methodology across all categories
license: MIT
compatibility: opencode
metadata:
  audience: ctf-players
  workflow: ctf
---

## CTF Methodology

### Web Challenge Workflow
1. Open challenge URL, inspect source, check `/robots.txt`
2. Check cookies, headers, hidden form fields, HTML comments
3. Test for common vulnerabilities based on functionality (login, search, file upload, etc.)
4. Check `/flag`, `/admin`, `/.git`, backup files
5. View HTTP history, look for unusual responses
6. If PHP: test `php://filter`, `data://`, `expect://` wrappers for LFI
7. If Python: test for SSTI with `{{7*7}}`, `{{config}}`, `{{''.__class__}}`
8. If Node: test SSTI with `#{7*7}`, `process.env`
9. Always check for JWT tokens and test algorithm confusion
10. If stuck, re-read the challenge — look for hints in description

### Binary Exploitation (PWN) Workflow
1. `file binary` — check architecture and protections
2. `checksec binary` — NX, PIE, RELRO, Stack Canary, Fortify
3. `strings binary | grep -i flag` — quick win check
4. `objdump -d binary` — disassemble, find main(), win(), flag functions
5. Run binary, understand input requirements
6. Determine vulnerability type (buffer size, format string, use-after-free)
7. Build exploit with pwntools template
8. Develop ROP chain if needed (ROPgadget)
9. Test locally against binary, then remote if needed

### Reverse Engineering Workflow
1. `file`, `strings` for quick wins and hints
2. Open in Ghidra/IDA, find main() and key functions
3. If encrypted/encoded, find the algorithm, extract key
4. Look for: strcmp, memcmp for flag comparison
5. If obfuscated: dynamic analysis with GDB breakpoints
6. If .NET: use dnSpy/ILSpy
7. If Java: use jadx-gui/CFR
8. If Python: use uncompyle6/pycdc
9. If Go: function names are preserved — look for main.*
10. Patch binary (NOP out checks, change jump conditions)

### Cryptography Workflow
1. Identify algorithm (cipher name, key size, mode)
2. Check for implementation flaws:
   - ECB mode? → byte-at-a-time attack
   - Same key reused? → known plaintext
   - Small e in RSA? → cube root attack
   - Oracle available? → padding oracle, timing attack
3. If custom cipher: analyze mathematical properties
4. Tools: RsaCtfTool, hashcat, john, CyberChef, SageMath, factordb
5. For hashing: check hashcat mode first, try rockyou.txt

### Forensics Workflow
1. Identify file type: `file *`
2. Strings + grep for flag format
3. If disk image: foremost/testdisk for file carving
4. If memory dump: Volatility for process analysis
5. If PCAP: Wireshark → Follow TCP streams, extract objects
6. If steganography: steghide, zsteg, binwalk, exiftool
7. If registry: Eric Zimmerman tools pattern
8. If log analysis: awk/grep for patterns, timeline reconstruction

### Quick Win Checklist
- [ ] `strings file | grep -i flag`
- [ ] `binwalk -e file` (nested archives)
- [ ] `exiftool file` (metadata)
- [ ] `file *` (identify types)
- [ ] Check hex dump for file headers
- [ ] Google the challenge text/function names
- [ ] Check if binary is packed: `strings binary | grep UPX`
- [ ] Try common passwords: admin, password, flag, ctf
- [ ] Try default JWT secret: secret, key, private, none algorithm
- [ ] Test PIN brute force if 4-6 digits
