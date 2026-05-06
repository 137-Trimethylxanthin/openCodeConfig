---
name: crypto-recipes
description: Cryptographic attack recipes for CTFs and security assessments
license: MIT
compatibility: opencode
metadata:
  audience: cryptographers
  workflow: crypto-ctf
---

## Crypto Attack Recipes

### RSA Attacks
**Small e (Cube Root)**: When e=3, 5, 17 and m^e < N → `sage: Integer(c).nth_root(e)`
**Hastad Broadcast**: Same message encrypted with e=3 to 3+ different N → CRT
**Wiener**: When d < N^0.25 → Wiener's continued fraction attack → RsaCtfTool
**Boneh-Durfee**: d < N^0.292 → sage script
**Common Modulus**: Same N, different e for same m → extended GCD
**Franklin-Reiter**: Related messages, same N → sage
**Coppersmith**: Partial knowledge → sage small_roots()
**Fermat**: p and q close together |p-q| < N^1/4 → Fermat factorization
**Pollard p-1**: p-1 smooth → sage
**ROCA**: Infineon TPM key generation flaw → neca/ROCA tool

### AES Attacks
**ECB Byte-at-a-Time**: No padding oracle needed. Use chosen plaintext to build "ecb dictionary".
**CBC Bit Flipping**: Flip intermediate ciphertext bytes to modify next block decryption.
**CBC Padding Oracle**: Server leaks whether padding is valid → decrypt any ciphertext.
**CBC-MAC Length Extension**: Append blocks with known MAC.
**CTR Nonce Reuse**: Same key+nonce = XOR of plaintexts. Use crib dragging.

### Hashing
**Length Extension**: MD5, SHA1, SHA256, SHA512 (Merkle-Damgard) → hashpumpy/hash_extender.
**Collision**: MD5 chosen-prefix collision tools.
**Hash Identification**: hashid tool or hashcat --example-hashes.

### Common Cipher Identification
```
Base64: ends with = or ==, charset A-Za-z0-9+/
Base32: charset A-Z2-7, padding =
Base58: no 0OIl, used by Bitcoin
Base85: begins with <~
Hex: charset 0-9a-f, even length
ROT13: same length, chars shifted 13
Morse: dots/dashes
Binary: 0/1 in groups of 8
```

### XOR Cracking
**Single-Byte XOR**: Frequency analysis. Score against English letter frequencies. Most printable = likely correct.
**Multi-Byte XOR**: Find key length with Hamming distance. Break into single-byte groups.
**Known Plaintext**: XOR keystream = ciphertext XOR plaintext.
**File XOR**: XOR with known file header magic bytes (e.g., PNG = `89504E470D0A1A0A`, PDF = `25504446`).

### LFSR / Stream Ciphers
**Berlekamp-Massey**: Given enough output bits, recover LFSR polynomial. Sage implementation.
**Correlation Attack**: Multiple LFSRs → Siegenthaler attack.

### ECC Attacks
**Invalid Curve**: Send point not on curve → recover multiplier mod small factor.
**Small subgroup**: Use Pohlig-Hellman on small order points.
**MOV Attack**: Map ECDLP to DLP in extension field (low embedding degree).
**Singular Curve**: ECC curve with discriminant = 0 → map to additive group.

### SageMath Quick Reference
```python
# Factor
factor(n)
# Discrete log
discrete_log(g, h, mod)
# CRT
crt([r1, r2, r3], [n1, n2, n3])
# Roots
Integer(c).nth_root(e)
# Polynomial roots (Coppersmith)
P.<x> = PolynomialRing(Zmod(N))
f = x + known_prefix
roots = f.small_roots(X=2^(bits), beta=0.5)
# Elliptic curve
E = EllipticCurve(GF(p), [a, b])
```

### Useful Tools
- CyberChef (browser): https://gchq.github.io/CyberChef/
- dCode: https://www.dcode.fr/
- RsaCtfTool: `RsaCtfTool.py --publickey key.pub --uncipherfile flag.enc`
- hashcat: `hashcat -m [mode] hash.txt wordlist.txt`
- John: `john --wordlist=rockyou.txt hash.txt`
- Factordb: http://factordb.com/
- Alpertron ECM: https://www.alpertron.com.ar/ECM.HTM
