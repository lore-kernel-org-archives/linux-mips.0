Received: from mailapp01.imgtec.com ([195.59.15.196]:34775 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992364AbdI2QRAIu2Li (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 29 Sep 2017 18:17:00 +0200
Date: Fri, 29 Sep 2017 17:16:53 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix input modify in __write_64bit_c0_split()
Message-ID: <20170929161653.GB32161@jhogan-linux.le.imgtec.org>
References: <20170919131122.23926-1-james.hogan@imgtec.com>
 <alpine.DEB.2.00.1709282351210.12020@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1709282351210.12020@tp.orcam.me.uk>
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
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170929161653.VMlG0ke5SuUTvX70cMO4GzdPa-LfkUZh0AjurpEKuNY@z>

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 04:29:25PM +0100, Maciej W. Rozycki wrote:
> On Tue, 19 Sep 2017, James Hogan wrote:
>=20
> > Avoid modifying the input by using a temporary variable as an output
> > which is modified instead of the input and not otherwise used. The asm
> > is always __volatile__ so GCC shouldn't optimise it out. The low
> > register of the temporary output is written before the high register of
> > the input is read, so we have two constraint alternatives, one where
> > both use the same registers (for when the input value isn't subsequently
> > used), and one with an early clobber on the output in case the low
> > output uses the same register as the high input. This allows the
> > resulting assembly to remain mostly unchanged.
>=20
>  Clever and well-spotted!
>=20
> Reviewed-by: Maciej W. Rozycki <macro@imgtec.com>

Thanks Maciej!

>=20
>  NB you could use DINS on MIPS64r2+ (and `__read_64bit_c0_split' could=20
> use one instruction less; patch posted separately).

Yes, that did occur to me, but it seemed simpler for this non-critical
case to use the more compatible sequence (whereas for the equivalent VZ
guest accessors, which imply R5+, I've used DINS in my not-yet-submitted
patches).

Cheers
James

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlnOcewACgkQbAtpk944
dnoj1A/9EqQ0EoN6eOw9x5HqAfE6MKH3M1B+rZuKDCa3WNTmvad13rwYrcadKyjP
L6REKMmaxYtIARCgQkx7H4Na1sRapyvfbJqWjKMozcaxNKgI2jXPJzQituE66Iyi
fWJuvjeHR98kqpXU+Ei/EZmB0jZ+uw1TkxJa7O8RI4rDYOyzO/wdhP1zm5cVEDQd
PgDtqGWS7REnmpk7S0XBRlQh5RPF0AyVNit8VMyRT/gsxtAz15bMAXe/fJBO4O6/
Zk39RmcufPJjo4RdxcctqK/mU15dULO0D6I1vfXQTqNR19cWlJPMMfqTy8P0c0nr
u1MnYLP56PkWQNTIeRz9ToDSGJncPb5//pRNRtrZqpUOdBrs8szD7zcs1GJT9Rng
u9qezFfBpA2Pq1nuMywFz704bSddFznf5dWk7ZhPW7mWiVmBnDnT8zdXM4efMBYm
nUAxN5WW7I7fp8HF8PaslWhdy+41ORmrcYK/DNz3Vbo7WFrj5JseFG6LTDNM3UyP
g0r3AT5gg0fg+K07HoAzWnJQFENowWFQ4U8T4HiNpCQ8qTwNpQ0cyHd9YlKQwa6P
dl24QxsRXH51fczpTNnTv7AyFNkSQ6SgNdGLhL2WbWpCxCl7Dr9+LjzzRoMF1wqF
1LIoATg6XAnM3NigTsQKn0DTHqU5bUQfan2SyDT0D6luQpOp+Xw=
=d20q
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
