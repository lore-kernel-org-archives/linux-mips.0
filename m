Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:41434 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994634AbeAPVn0Kd5Tg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 16 Jan 2018 22:43:26 +0100
Date: Tue, 16 Jan 2018 21:42:16 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: Fix vmlinuz build when ZBOOT is selected
Message-ID: <20180116214215.GY27409@jhogan-linux.mipstec.com>
References: <20180116032954.13722-1-dsabogalcc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="I33OQG5IFrqF2BWt"
Content-Disposition: inline
In-Reply-To: <20180116032954.13722-1-dsabogalcc@gmail.com>
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
To: Daniel Sabogal <dsabogalcc@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20180116214216._BJ4ylqVwWVUYJnuybBg81ytPH57GuQoCZGrNim8PNk@z>

--I33OQG5IFrqF2BWt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2018 at 10:29:54PM -0500, Daniel Sabogal wrote:
> vmlinuz is not built by default for platforms using
> COMPRESSION_FNAME (e.g. Malta) due to an erroneous
> check on ZBOOT
>=20
> Signed-off-by: Daniel Sabogal <dsabogalcc@gmail.com>

Reviewed-by: James Hogan <jhogan@kernel.org>

Cheers
James

> ---
>  arch/mips/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 9f6a26d72f9f..0f20f84de53b 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -228,7 +228,7 @@ libs-y				+=3D arch/mips/fw/lib/
>  #
>  # Kernel compression
>  #
> -ifdef SYS_SUPPORTS_ZBOOT
> +ifdef CONFIG_SYS_SUPPORTS_ZBOOT
>  COMPRESSION_FNAME		=3D vmlinuz
>  else
>  COMPRESSION_FNAME		=3D vmlinux
> --=20
> 2.15.0
>=20
>=20

--I33OQG5IFrqF2BWt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlpecbcACgkQbAtpk944
dnrkPw//al49jHwchaInwl2UuqX+7GQ7VtrMi2jEH0Z7wbmpLgCNGPfI3al9mTtJ
3xZznjKoFYOCi/k3ye91oXAp3Jzh+OvX2N26CT8UoKxB8vsF7BGTp4MzZenIj4JI
d4Nx94RfjnrhgZQMvb4eHLw6Bi283+VfkzgJDi8G5Ms7ozwJb1qj/zcbiHrsZUt5
5fp0cfolPrptzt6I07JDlgpTD0D/rH/O+J0vp0p3Ml5L2an5ksvWJJyXZWtS/Ltm
BJ6SEIGMb8qFNRgPqnettCVSLbtUQnHz1/uXZytXZ1N5EQGseNKN5r9/3XSvGnnZ
TIp4wP6p00GvKReJCjys4LsFWV6CnvAqxzZJgP0XSc0ULca0XPAFo27/bIa8hnqg
4pBpHwqH3qUzmoCPhvXT2NRPrXQs495Krvkl7h9wIgL6PiPbE3IxfJt91VNsNjK7
jHLvhpFxKQg4ycmfnJ9Ey1PGKVOlhk/YuO7TUTm/ZfZvo2KJK7GmsFavlq27mcBn
JzclmVTgMWaaP5rWhP0uVUC/ACxT/9gNEEA2sPYKv4YQVp+Pg5C+kB2t15iy5mGA
K9O8Wl+Bs2N/ube2vEAAOIAl2oBwdrEezW1VpQUpTk17RDw6dV9UbSnnD07ozl3I
YlW0mfFyO+PfCRzfW7CQghPTJqKApb3Dx2ri2HbywV0zD9a1D/w=
=IDTh
-----END PGP SIGNATURE-----

--I33OQG5IFrqF2BWt--
