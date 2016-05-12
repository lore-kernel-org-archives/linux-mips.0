Received: from mailapp01.imgtec.com ([195.59.15.196]:5414 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27006153AbcELPzxwR530 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 May 2016 17:55:53 +0200
Date: Thu, 12 May 2016 16:55:47 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2 3/6] MIPS: Add guest CP0 accessors
Message-ID: <20160512155547.GP23699@jhogan-linux.le.imgtec.org>
References: <1462978232-10670-1-git-send-email-james.hogan@imgtec.com>
 <1462978232-10670-4-git-send-email-james.hogan@imgtec.com>
 <5733CB17.9000904@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pvq4FPIYehQuVelz"
Content-Disposition: inline
In-Reply-To: <5733CB17.9000904@gmail.com>
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
To: David Daney <ddaney.cavm@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160512155547.eFg2OKowAD7pP4HSVwNG1tRCzhnPfz_lEs0DiFRUMw8@z>

--pvq4FPIYehQuVelz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 05:15:19PM -0700, David Daney wrote:
> On 05/11/2016 07:50 AM, James Hogan wrote:
> > Add guest CP0 accessors and guest TLB operations along the same lines as
> > the existing macros and functions for the root CP0.
> >
> > Signed-off-by: James Hogan <james.hogan@imgtec.com>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: linux-mips@linux-mips.org
>=20
> Not tested, but this looks correct.
>=20
> We are tying ourselves to binutils versions that understand the "virt"=20
> instructions, but that is probably OK.
>=20
> Acked-by: David Daney <david.daney@cavium.com>

Thanks for taking a look David,

Yes, i think its supported since binutils 2.24, which is now over 2
years old.

What's the policy regarding binutils support for this sort of thing? I
know we have hacks for assemblers that don't support MSA yet, but was
hoping to avoid that sort of thing if possible here.

Cheers
James

>=20
> > ---
> >   arch/mips/include/asm/mipsregs.h | 341 ++++++++++++++++++++++++++++++=
+++++++--
> >   1 file changed, 330 insertions(+), 11 deletions(-)
> >
> [...]

--pvq4FPIYehQuVelz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXNKeDAAoJEGwLaZPeOHZ6ofQQAJa5jQy6W0O2ul6xT4+Ked2Y
Z0ZWsIwtik57nbocJhZ3mSRjyw9YuCWog2jJLbWnYBP1JWTiZC5ZPKf7uJkL4RRo
g3xTBXOuBbeE5FkGcdv03j2+1PXFHdl61EtMiA3Xs7vW3MXWNRHjzkL+1mG6OxCI
h8YVqKls/R5CF5DPb6nDw2Yrf6HexMwgOuLHHAiSaPfXJpZoupup+R1v/PuBvrVs
J0ygG5gQWo1Krk+neopW8TB/7zXhDLmvG21ECmvujRNtugCZ2zXijNRInPxkja4a
Mq8sJ/QZ3676mwmolMFqMjwbz5EqrxFLR03R0cfYduLiR/MeKhCS4qeUUQkZ8NR7
UkLuemwLTD3FX443mJkkAADClV9RpDyZIpjqGb3OPnzymsiG3Lg8deLfa2ZOarWk
PFyERnil2gG6lqirGbBW1I79XIgv+VsV0hWuy1gEIrxhv0ANDqFCiTU4ZsBBkXs9
x8ylo9+o1lkUf7x+9clvgzeeACfNU7j+wqOPD7oZUQJhN72zE2RKKlVnPnDzbaEH
j2tw9Zt39FD/Xm6gTpz+CbsMUkcS+qQvznewVU8E9XPp4h/Kmkw9b9dToWD2B3/n
YeP9Gml/eA6KkWOhtTpfPjB0Jtg21LLlO3kHy3q8jYvv/lZjE0eceUj+0KjqxLhi
8f9HCNZijwrmSMyipfVb
=M/Ep
-----END PGP SIGNATURE-----

--pvq4FPIYehQuVelz--
