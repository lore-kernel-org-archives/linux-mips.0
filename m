Received: from mailapp01.imgtec.com ([195.59.15.196]:3382 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27032096AbcETXhnv6cQM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 May 2016 01:37:43 +0200
Date: Sat, 21 May 2016 00:37:37 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 0/5] MIPS: microMIPS encoding fixes
Message-ID: <20160520233737.GA1124@jhogan-linux.le.imgtec.org>
References: <1463783321-24442-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="72pTQ1Q5L511SwPT"
Content-Disposition: inline
In-Reply-To: <1463783321-24442-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20160520233737.vWAcYNNXShRVV7r5p82eqTuOoJegj3urn2KhtuhUa5E@z>

--72pTQ1Q5L511SwPT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Whoops, forgot to Cc linux-mips on the cover letter! Sorry about that!

On Fri, May 20, 2016 at 11:28:36PM +0100, James Hogan wrote:
> These patches add & fix some explicit instruction encodings in assembly
> code to take microMIPS into account. Comments most welcome.
>=20
> Patches 1 and 2 are needed for v4.7 to add microMIPS encodings to
> recently added VZ instruction wrappers, otherwise a microMIPS kernel
> built with an old toolchain will fail to boot on M5150 which has both
> microMIPS and VZ.
>=20
> The other patches are lower priority, and can wait until v4.8.
>=20
> Patch 1 adds an abstraction for encoding MIPS and microMIPS instructions
> explicitly in inline assembly, and is used by all the other patches.
>=20
> As mentioned, patch 2 adds microMIPS encodings of VZ instructions to fix
> a regression on M5150.
>=20
> Patch 3 fixes microMIPS encodings of MSA instructions (especially for
> little endian). I'm not aware of any cores supporting both, but it was
> plain wrong before so lets fix it.
>=20
> Patch 4 adds microMIPS encodings for the tlbinvf, mfhc0 & mthc0 (XPA)
> wrappers. Again I'm not aware of any microMIPS cores which support
> either tlbinv or XPA, but the encodings exist, so lets use them.
>=20
> Finally Patch 5 simplifies the existing DSP wrappers which already
> handle microMIPS (although with a couple of missing .insn directives),
> to use the macros introduced in patch 1. Asside from the .insn change
> (which fixes some disassembly output), this change is a no-op.
>=20
> James Hogan (5):
>   MIPS: Add inline asm encoding helpers
>   MIPS: Add missing VZ accessor microMIPS encodings
>   MIPS: Fix little endian microMIPS MSA encodings
>   MIPS: Add missing tlbinvf/XPA microMIPS encodings
>   MIPS: Simplify DSP instruction encoding macros
>=20
>  arch/mips/include/asm/asmmacro.h |  99 +++++++++++-----------
>  arch/mips/include/asm/mipsregs.h | 179 ++++++++++++++++-----------------=
------
>  arch/mips/include/asm/msa.h      |  21 ++---
>  3 files changed, 130 insertions(+), 169 deletions(-)
>=20
> --=20
> 2.4.10
>=20

--72pTQ1Q5L511SwPT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXP5/BAAoJEGwLaZPeOHZ6eXwQAKnZ0mquty7pW13etSSoJDqE
7LShmnL1iqRKZqTOoHtCwQVNOajSTi/VgmpFNJw28TJ1YCQgBFt/u92FrMmgmPDD
i3TkEjq19jYkxOMaQ2TUcl2tlRAI6OGMdRCQsT+cFSEZPlhR/PicaeMP9eyKWiKe
r6dUBAqcr0vYZGPcR+zYzAMLssDZZeqME5kmSPshsZO/5AGFmnv7Uk9rdl9/rfOE
K/8YcpDu24PYwJ767cWHbKxWbscqwbcU3rGLyrMHPm4P074h8+5gcOlWbCp1cUTE
/iSyMyHgTdcmwF3Gq3Pp88YU+Y89ps2Rd1Z5fm9OH9nibHFUQSoUxyz3ijoK99Jr
OJuBAtdEIuLt8t8EXPD+ktOkrpD+Z+5vBEX+0/FHOrIXozKhpl5kRtenYyRVU6Ee
ScR/I+0FNjKfRFv8K8clQnzVB6sJ3DOHa3KGWv49RUEiFeaiY89tXsnNV8nqufkh
tC3PHPUnhbUZa0y5gD2TBpaLlX6V5EcyVNiXp+VZYDw4dVS5ABqe4h3j7NEycPYc
EmU2p7hvOhqdOSzc0OGZpgqUfvFLZGtqmX6LLGQO56VwOM2cULYaiF1AzDR1I+8n
TLP8KMIue2fbOUnARg4LOjzmsk/Y+SxiDXSFOeIJhQ4lC0bvZ5UR7XSm4x055eCR
RF6Vih0codrCxAIYnFds
=SLV8
-----END PGP SIGNATURE-----

--72pTQ1Q5L511SwPT--
