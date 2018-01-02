Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:59703 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990475AbeABIsY4jTOx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jan 2018 09:48:24 +0100
Date: Tue, 2 Jan 2018 08:48:00 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: Loongson64: Drop 32-bit support for Loongson 2E/2F
 devices
Message-ID: <20180102084759.GL5027@jhogan-linux.mipstec.com>
References: <20171226042138.13227-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qpqR4wE1CEr+Roqx"
Content-Disposition: inline
In-Reply-To: <20171226042138.13227-1-jiaxun.yang@flygoat.com>
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
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Huacai CHen <chenhc@lemote.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180102084800.zqAsIsBSiJnnHGKylimzJdvSQqdAHKBMtieq6mIISxA@z>

--qpqR4wE1CEr+Roqx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2017 at 12:21:38PM +0800, Jiaxun Yang wrote:
> Make loongson64 a pure 64-bit mach.

Please expand to provide some rationale behind the change. Was 32-bit
support broken at runtime, or broken at build time, or are we simply no
longer interested in supporting it?

Cheers
James

>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/loongson64/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
> index 0d249fc3cfe9..a7d9a9241ac4 100644
> --- a/arch/mips/loongson64/Kconfig
> +++ b/arch/mips/loongson64/Kconfig
> @@ -17,7 +17,6 @@ config LEMOTE_FULOONG2E
>  	select I8259
>  	select ISA
>  	select IRQ_MIPS_CPU
> -	select SYS_SUPPORTS_32BIT_KERNEL
>  	select SYS_SUPPORTS_64BIT_KERNEL
>  	select SYS_SUPPORTS_LITTLE_ENDIAN
>  	select SYS_SUPPORTS_HIGHMEM
> @@ -49,7 +48,6 @@ config LEMOTE_MACH2F
>  	select ISA
>  	select SYS_HAS_CPU_LOONGSON2F
>  	select SYS_HAS_EARLY_PRINTK
> -	select SYS_SUPPORTS_32BIT_KERNEL
>  	select SYS_SUPPORTS_64BIT_KERNEL
>  	select SYS_SUPPORTS_HIGHMEM
>  	select SYS_SUPPORTS_LITTLE_ENDIAN
> --=20
> 2.15.1
>=20

--qpqR4wE1CEr+Roqx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlpLRz8ACgkQbAtpk944
dnqjig/+JxblzZ2hMk1sXm5Hw01j2UIugN2CVoJYPOn5iAg0p+U5eZddjHaSksgi
/dk0mXqeSYxRnaMjwy05CMjNX2mghEZLKVDdZ4YTDhmdQfDBvOuwoVsaUEtByC1c
X4T1y+47Pg42Okp1OYQ92aCO1tqcJUxXF5zHMldaozJpoYG5Cx5i17QMwu2JEM8W
Tb1AVKL9dnOxlL7x7woNrWYRVZaqwTcD2Doq6oxJAajQbEpr2mXfd0DQo+bBg4ya
q1aOo73Tpyuzp25p3l0zv9bcvCYs/MI4YBb7ja4C/7CvabK47kJm8oCZWZbUdkDZ
c+4ueVniOXG6lPiwiXdbMEM6Ne6/MbfNNYRTqGaB7EVZ55Aj9isq6Zr2Mr9YaOWb
kS8ArZBEshD1MMnwBzAzFbXcvek4gGg6gV77MDrqdXnR/pt86U/oEhdv09SJFxBK
h31wP7+XsRJgIM+HQFyO3rl6tfBa70aZs8yI310of4N2MTnx8ST6aqAFTgTyuG3A
QWA1Oet0Jo+JnqO3IOcxfSQwJVlrnpWuGuSjqxW7lr3lVd7VBOMSNCQEWiBRw96c
HfFXaxca9UwV2Tzy43D2qZc5cVn3Se8o4iTAmFDX0iE406KoSo4fsLSbLSXwJ6vG
fZibMswSi/gW9Z8JCOd9jw05P3PYXLTt9A99FYMwyxhHHqSxPAM=
=PIu1
-----END PGP SIGNATURE-----

--qpqR4wE1CEr+Roqx--
