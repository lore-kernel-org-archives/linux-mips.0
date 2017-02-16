Received: from mailapp01.imgtec.com ([195.59.15.196]:3398 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993896AbdBPNGuHlY44 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 16 Feb 2017 14:06:50 +0100
Date: Thu, 16 Feb 2017 13:06:43 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: [GIT PULL] MIPS fixes for 4.10
Message-ID: <20170216130643.GV9246@jhogan-linux.le.imgtec.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wfgmFf0LjPE7xkRl"
Content-Disposition: inline
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20170216130643.WcSTF0jgXK43ge6tFOBDcJhoomW_irLRpEOcsUqHwQI@z>

--wfgmFf0LjPE7xkRl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Ralf is travelling for a couple of weeks, and has asked me to take care
of maintainer duties and the main MIPS 4.11 pull request while he's not
around [1].=20

I've gathered together some of the more important fixes that it'd be
good to get into 4.10. They're mostly build fixes, with a few runtime
fixes too.

Please consider pulling,

Thanks
James

[1] https://www.linux-mips.org/archives/linux-mips/2017-02/msg00188.html

The following changes since commit 566cf877a1fcb6d6dc0126b076aad062054c2637:

  Linux 4.10-rc6 (2017-01-29 14:25:17 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/mips.git tags/mips_f=
ixes_4.10

for you to fetch changes up to c3ea245e2a92d9107e8690b9b1958b9a8f87a598:

  MIPS: ip27: Disable qlge driver in defconfig (2017-02-15 10:22:02 +0000)

----------------------------------------------------------------
MIPS fixes for 4.10

A selection of MIPS build and runtime fixes for 4.10:

- fix longstanding 64-bit IP checksum carry bug
- fix Octeon large copy_from_user corner case
- fix xway ethernet packet header corruption over reboot
- fix various build errors, in ip27, xway, ralink, and pic32mzda
  platforms
- fix generic (multiplatform) big endian kernels
- fix weak uprobes function that should have been strong

----------------------------------------------------------------
Arnd Bergmann (5):
      MIPS: VDSO: avoid duplicate CAC_BASE definition
      MIPS: Lantiq: Fix another request_mem_region() return code check
      MIPS: ralink: Remove unused timer functions
      MIPS: ralink: Remove unused rt*_wdt_reset functions
      MIPS: ip27: Disable qlge driver in defconfig

Felix Fietkau (1):
      MIPS: Lantiq: Keep ethernet enabled during boot

James Cowgill (1):
      MIPS: OCTEON: Fix copy_from_user fault handling for large buffers

Marcin Nowakowski (1):
      MIPS: uprobes: Remove __weak attribute from arch_uprobe_copy_ixol.

Matt Redfearn (1):
      MIPS: Generic: Fix big endian CPUs on generic machine

Purna Chandra Mandal (1):
      MIPS: pic32mzda: Fix linker error for pic32_get_pbclk()

Ralf Baechle (1):
      MIPS: Fix special case in 64 bit IP checksumming.

 arch/mips/Kconfig                        |  1 +
 arch/mips/cavium-octeon/octeon-memcpy.S  | 20 ++++++++++++--------
 arch/mips/configs/ip27_defconfig         |  1 -
 arch/mips/include/asm/checksum.h         |  2 ++
 arch/mips/include/asm/mach-ip27/spaces.h |  6 ++++--
 arch/mips/kernel/uprobes.c               |  2 +-
 arch/mips/lantiq/xway/sysctrl.c          | 12 ++++++------
 arch/mips/pic32/pic32mzda/Makefile       |  5 ++---
 arch/mips/ralink/rt288x.c                | 10 ----------
 arch/mips/ralink/rt305x.c                | 11 -----------
 arch/mips/ralink/rt3883.c                | 10 ----------
 arch/mips/ralink/timer.c                 | 14 --------------
 12 files changed, 28 insertions(+), 66 deletions(-)

--wfgmFf0LjPE7xkRl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpaPdAAoJEGwLaZPeOHZ63i8P/3h0/KvhauR6odEh7pc3SCco
hRLb3nkLCuK9nNbmMjOYWw+K/40dvg1R/cM6iUq5u62rKfyLeKutgnVf6QCxB9+B
hFI/oNEqH/2XitLyzjKBIAi9TV9IedJNF0kYREXC2FWmkvpuZG8rTysum564LgcK
t5La0wgdGlEdtV4o+9L0yYdig4A6r/myRYf5SIKsQ9UpHKvN7qY+eRxIyyau+6Df
21peC7tSxTR5AtIbZ/pvPng9O701TDh8+Cgg+8wseTBrJz05tnwUlkK8sDnMPjas
FTL2qXeoJ1VRUJ/rfkLGEjElsEbil4vB+dbtLIdB92vPednVOr/92yOJhvZXXkwt
EnUsErrru0K0cEBQqOYNKHi1OCBbRQ4DIfHgSdFhl2mmWVmfrzpMGL6PaMuLgkUP
fCny7Tz5xLRmetgWn5BOOGa+XEscS2rD42OliYySLMLNx/zsAAKmzDIVbrigsh5M
qB0o9gzsquQ5gQ+lwLMPp8JkhZxAv91bCAaM51S+opAS2cPqWUyG2G+rTx81Admy
yRwR0Ajt1W6AajwPDkQApb53SgrR8q04bGgq4AIQbC79/yJhSP87TV5eYnzU99fD
chctVRYIwfj44v3Fwb3XC5yRkeBMU908lGSw2SuMFjy8dd2gZh3NA292WqDEHMbb
EjWatmy+krG9cMyUVw1/
=eLN8
-----END PGP SIGNATURE-----

--wfgmFf0LjPE7xkRl--
