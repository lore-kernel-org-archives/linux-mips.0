Received: from mailapp01.imgtec.com ([195.59.15.196]:32653 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992378AbcHPPkA4deOd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 16 Aug 2016 17:40:00 +0200
Date: Tue, 16 Aug 2016 16:39:52 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 0/2] MIPS: Memory setup tweaks
Message-ID: <20160816153952.GZ19514@jhogan-linux.le.imgtec.org>
References: <cover.842913b0756706569a896ef308bb5bf98be4f0ce.1470745146.git-series.james.hogan@imgtec.com>
 <20160816153606.GF3894@linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4mUolEm2oNas7DxE"
Content-Disposition: inline
In-Reply-To: <20160816153606.GF3894@linux-mips.org>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160816153952.od656hBXXAGBxAN2eiA0ovSnkET5zpVWer0ehVx_rpk@z>

--4mUolEm2oNas7DxE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 05:36:07PM +0200, Ralf Baechle wrote:
> On Tue, Aug 09, 2016 at 01:21:47PM +0100, James Hogan wrote:
>=20
> > Here are a couple of tweaks for MIPS memory setup, primarily in order to
> > handle memory which extends right up to the end of physical memory on
> > 32-bit systems with 32-bit phys_addr_t. More specifically we omit the
> > final page of physical memory to avoid the overflow (see patch 1 for
> > details).
> >=20
> > Patch 2 improves the rounding in the MAAR setup, so as to include the
> > first full page of an already aligned region, and to avoid a BUG_ON for
> > regions with non 64-KByte aligned end addresses (which I happened to hit
> > while working on a different version of patch 1 which wasn't correctly
> > merging the kernel data section into the main RAM region).
>=20
> There's a DMA issue with one of the system controllers on Malta which
> afair only affects one endianess and can be worked around by not using
> the last bit of memory. That isn't the only platform having such issues
> I've seen and debugging has always been very painful so I'm wondering
> if as a general precaution we should just leave the last page of memory
> unused.

If I understand you right, I think thats pretty much what patch 1 does,
or rather it allows such a region to be created but reduces the length
so it doesn't quite reach the end, I suppose assuming it will get
rounded down to a page boundary.

Cheers
James

--4mUolEm2oNas7DxE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXszPIAAoJEGwLaZPeOHZ6mZsP/juYsQfq9z01riWr/RxA0qfL
3SM+q4s5Yck7+QFLLUrnstcbkGMQ2zsdfqPi5hQ+iLQOBkzr5UnM3DrmoOx2Luw+
31pACE05A5PzBcqE+Y4EK/2JzeORgAh+4Wsj2g90jFkRUB0nl0lLH0KAGdFGYxnO
ZC2gV4AwU7BuhQK490ejO/pluG194hFGmImMPSfeE52eJ0uZ73nAAnOc5mm3XrKn
H1ZRTkZTWbwfOHUR64NOuuvLX21gJ4W1dhQ8wUMddJ/7CpgxZg/L99c5ktAkhP7h
C9btOek5Y/p1wIi4fGo0VeTGr7t46OXXAzKr2HQ7HaSU/agmGZOtuvDKTXNnlRjq
/m7VQ08++WkG4H8h9gLtPYKw5P9ORICJlKqL0oPGep4tUoBknFsx6PNo7V/baeAe
yozhynJkAPbZJz/HjiqD90OQE9oNtAQ62YHvU1Sh+WSyv0riKbtKwPBagrpJ32D0
iDw0ewF/urNRjwKO+Vq9zo5kvIrNkpMmm1LVJO2c1wBK8U0bJjxe04Q3SukdlNVb
7Ki25awPvC/cBt33Ee+KAX3AOzPeKOUE6MgzYW/ECPvVquFwNn51w9O+vfk4WVfi
74wAXtl8C8sSglX8Vp8UlL3Kryemzhla9D2rXP0JwIGoC0XxwqcuydEc/6lvYNsV
LMxWqkl62A8zxn6gSH6S
=hDil
-----END PGP SIGNATURE-----

--4mUolEm2oNas7DxE--
