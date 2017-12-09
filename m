Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:53123 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990393AbdLIHVngzcnO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 9 Dec 2017 08:21:43 +0100
Date: Sat, 9 Dec 2017 07:15:58 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: Implement __multi3 for GCC7 MIPS64r6 builds
Message-ID: <20171209071558.GQ5027@jhogan-linux.mipstec.com>
References: <20171206085034.3869dc9d@windsurf.lan>
 <20171207072046.31125-1-jhogan@kernel.org>
 <alpine.DEB.2.00.1712082339130.4584@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Lez9QO3Seu3ycz0M"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1712082339130.4584@tp.orcam.me.uk>
Return-Path: <James.Hogan@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Matthew Fortune <matthew.fortune@mips.com>, Florian Fainelli <florian@openwrt.org>, Waldemar Brodkorb <wbx@openadk.org>, linux-mips@linux-mips.org
Message-ID: <20171209071558.Iq4ODCZNrcj8-ci1Ra7bYDySPXlT6OcR-jQRl1wUI4M@z>

--Lez9QO3Seu3ycz0M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2017 at 11:52:05PM +0000, Maciej W. Rozycki wrote:
> On Wed, 6 Dec 2017, James Hogan wrote:
>=20
> > GCC7 is a bit too eager to generate suboptimal __multi3 calls (128bit
> > multiply with 128bit result) for MIPS64r6 builds, even in code which
> > doesn't explicitly use 128bit types, such as the following:
> >=20
> > unsigned long func(unsigned long a, unsigned long b)
> > {
> > 	return a > (~0UL) / b;
> > }
> >=20
> > Which GCC rearanges to:
> >=20
> > return (unsigned __int128)a * (unsigned __int128)b > 0xffffffff;
>=20
>  You mean:
>=20
> return (unsigned __int128)a * (unsigned __int128)b > 0xffffffffffffffff;
>=20
> presumably, or is there another bug here?

Yes, thats what was meant. It was copy + pasted from Ralf's analysis.

Thanks
James

>=20
> > Therefore implement __multi3, but only for MIPS64r6 with GCC7 as under
> > normal circumstances we wouldn't expect any calls to __multi3 to be
> > generated from kernel code.
>=20
>  That does look bad; I'd expect a `umulditi3' (widening 64-bit by 64-bit=
=20
> unsigned multiplication) kind of operation instead, which should expand=
=20
> internally.  And we only really need to execute DMUHU and then check the=
=20
> result for non-zero here, because the value of the low 64 bits of the=20
> product does not matter for the evaluation of the expression.
>=20
>  I don't know offhand if such a transformation can be handled by GCC as i=
t=20
> stands by tweaking the MIPS backend without a corresponding update to the=
=20
> middle end though.
>=20
>   Maciej
>=20

--Lez9QO3Seu3ycz0M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlorjaQACgkQbAtpk944
dnpOHg/9FuZMj0CBaimhlDSKJQyCTNXyeo8J35r6kNvuzA8DTgyy6iNp8jArKW7n
TOcZ+J7TwILmn5ctcnh/MspP1Il9GNsGKloA5Y/2O+fxMPKrHP3Ii61gaFeSyx71
6dEJvWXM2g7HgRzbxdLQXvi+AaYYVMMJnd0wcmNeAbjNfce7LPPucJG6k0wstniV
7czBU03w8p55bW52AROsWoGZecunhg3TTHBP62SHN2OWJKrZheU+iCUGRbX1VF9k
EArihU5Vf41llju3rpB+HJDwWTvI2Gf+GSaU5C4Q+KPKvcwMS8D+4aQg6JLRvQgT
RyygqYYv6MjgFQJcp3iNeYNRPA5uJzjoHcM6NSCTi0yiLcSSFhpS8o8rlRjRy8Tl
J/oCef+DUQAoyeqcHSmRr6R8upilBtTlBSpTTeBUliqQhX7jY5312XU/JjkW351g
AeyO6lMug0r5GzAAR9jNuXJP521I44bAVov+hvDoysrrII7JqKnoMwuWIx6pLGQ3
dGHXbDTrx37u4FiNk2zZcBUA/JxECNDBYDKfbCV0tOtnHB1nhtyLLYsW2R+O4M1P
99jJAoRmRZVX911AcAr+fdBkW4wtIIvuJyxLaBkQj53U+HtAG0XbsmFoz9Pfv6LX
90owZ8tGn8EPMkIbHvJDOpPU3cKIjnPy6ge32wxTd+yq2svETfs=
=wUSm
-----END PGP SIGNATURE-----

--Lez9QO3Seu3ycz0M--
