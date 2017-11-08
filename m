Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:47255 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993917AbdKHWJGgPiHr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 8 Nov 2017 23:09:06 +0100
Date: Wed, 8 Nov 2017 22:06:44 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: Use SLL by 0 for 32-bit truncation in
 `__read_64bit_c0_split'
Message-ID: <20171108220643.GP15260@jhogan-linux>
References: <alpine.DEB.2.00.1709291502060.12020@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E187YRO8KGM40JwS"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1709291502060.12020@tp.orcam.me.uk>
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
To: "Maciej W. Rozycki " <macro@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20171108220644.A2EgqAu7GP6L-0pUkBr86UjqXrq4XEt7J0I9agnunlI@z>

--E187YRO8KGM40JwS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 04:26:31PM +0100, Maciej W. Rozycki wrote:
> Optimize `__read_64bit_c0_split' and reduce the instruction count by 1,=
=20
> observing that a DSLL/DSRA pair by 32, is equivalent to SLL by 0, which=
=20
> architecturally truncates the value requested to 32 bits on 64-bit MIPS=
=20
> hardware regardless of whether the input operand is or is not a properly=
=20
> sign-extended 32-bit value.
>=20
> Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
> ---
>  Tested by compilation only to verify syntax correctnes as I do not know=
=20
> if this execution path is actually used by any configuration (suggestions=
=20
> welcome).  I believe it to be technically correct though, being=20
> sufficiently straightforward to verify by proofreading, and an obvious=20
> improvement.
>=20
>  Therefore, please apply.

Thanks, Applied for 4.15.

Cheers
James

--E187YRO8KGM40JwS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloDf/MACgkQbAtpk944
dnoeuQ//WTBzaIdGliegG3NUnozCe3aPu67GMxNGBURhqqz6mg2ilikrZR2s8lk9
u4L2naLhpH+mWwucChzxe46SvK+8tLLOGrv9qfK6DAkUw+Ql6utMUKL/Gne4s0dW
dfvUo7VPBWOzQLnklyXQpmlg7RmmBV3Q2GvJTGH+6G3VVn3IDto1D39b4H8e+bSp
iqrv7tsy2UvVhPhgp4tbsgt5vqgYc8+/Qatu8wCvrbO1RsXAKMjHkwKmbDR/5eDI
yA+OGwfn7FTdipEsCZQRrsQ76adhIPnqMrSqwSRF8WHDrQk0kWfBP3uODge2O4QJ
c2I/K9Kf10Z/SfKwfipPsvbOXDlvoCOh5yjf9J6cpZeRb3UjopYbmDMorv/z1/Qf
EU7FNg4AE92cMJxWFQyVtpVI/UjWLPQEWUKzISoxFKfN5PFdoxCSyYp2vsBC9EbE
/12aBX5368K8kRktZw3OZqhWPY9HtX1CxPpa2MxVdWhz+mZb5evL2CUs2pgeb/zx
6wkKM7pSJVsy/xKyAQ8/IUUcmxsK8ws0Ywv9bGvRheVPUfXzhj63eU4NwEn3F5Q0
2FfqOXijA1rTiAAMkYzBqzF1mw8/GjQI1lXWsksSGX8xE/y3JqTbcHqYUAdmE2oD
rDlMZezGbOowqRfpgXo9YnHfppCFTI3hqRbp+E+E332pFa/utMM=
=RqTU
-----END PGP SIGNATURE-----

--E187YRO8KGM40JwS--
