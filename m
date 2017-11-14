Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:44816 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990475AbdKNLS7En5po (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 12:18:59 +0100
Date: Tue, 14 Nov 2017 11:17:38 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] watchdog: indydog: Add dependency on SGI_HAS_INDYDOG
Message-ID: <20171114111737.GB5823@jhogan-linux.mipstec.com>
References: <1510656774-31464-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <1510656774-31464-1-git-send-email-matt.redfearn@mips.com>
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
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-mips@linux-mips.org, "# 4 . 11 +" <stable@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>
Message-ID: <20171114111738.ouGrXbMqBwA1TGLlA73UVZYa8IhVf8PrMZ0N8wsnOMc@z>

--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 10:52:54AM +0000, Matt Redfearn wrote:
> Commit da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
> enabled building the Indy watchdog driver when COMPILE_TEST is enabled.
> However, the driver makes reference to symbols that are only defined for
> certain platforms are selected in the config. These platforms select
> SGI_HAS_INDYDOG. Without this, link time errors result, for example
> when building a MIPS allyesconfig.
>=20
> drivers/watchdog/indydog.o: In function `indydog_write':
> indydog.c:(.text+0x18): undefined reference to `sgimc'
> indydog.c:(.text+0x1c): undefined reference to `sgimc'
> drivers/watchdog/indydog.o: In function `indydog_start':
> indydog.c:(.text+0x54): undefined reference to `sgimc'
> indydog.c:(.text+0x58): undefined reference to `sgimc'
> drivers/watchdog/indydog.o: In function `indydog_stop':
> indydog.c:(.text+0xa4): undefined reference to `sgimc'
> drivers/watchdog/indydog.o:indydog.c:(.text+0xa8): more undefined
> references to `sgimc' follow
> make: *** [Makefile:1005: vmlinux] Error 1
>=20
> Fix this by ensuring that CONFIG_INDIDOG can only be selected when the
> necessary dependent platform symbols are built in.
>=20
> Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
> Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
> Cc: <stable@vger.kernel.org> # 4.11 +
> ---
>=20
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index ca200d1f310a..d96e2e7544fc 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1451,7 +1451,7 @@ config RC32434_WDT
> =20
>  config INDYDOG
>  	tristate "Indy/I2 Hardware Watchdog"
> -	depends on SGI_HAS_INDYDOG || (MIPS && COMPILE_TEST)
> +	depends on SGI_HAS_INDYDOG || (MIPS && COMPILE_TEST && SGI_HAS_INDYDOG)

(MIPS && COMPILE_TEST && SGI_HAS_INDYDOG) implies SGI_HAS_INDYDOG

So I think you can just do:
-	depends on SGI_HAS_INDYDOG || (MIPS && COMPILE_TEST)
+	depends on SGI_HAS_INDYDOG

I.e. COMPILE_TEST isn't of any value in this case.

Cheers
James

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloK0NEACgkQbAtpk944
dnoElg//WRwok5OHQhwie64lh6z9g+szr+u4xADuY41gaiPGEfDlwHD4IqDhaKO+
hyCfDp+Yr+eDyRX0i3HPjZDmDob2mN0KfPbKtzcW1XCzpPel0pZZyMIWhHZO+kbe
47lp87rEeuHsZhzz75p74mgrX5WkwBN3DfEMA1rIEDseGKmHmWdVd154k2X4JhaX
Uq5D3IZTR8bY+652I01UvWBrZ0IWsWiLsAZAeNztOUQZNZotgCfRbFETQuy5D3DY
jciylT+hltb/wiXS/MatOPrsaT66KOXjJaVld2ve0WSLwPn9OCvg/ryBaRKMlzDi
V/xchst5Nk3cIpEHVu8vxMpH5vEUZ9bH6+XfE0zcBJ2zRbbt3S6E3skBufF+F+xb
75UFq9Rn61x6CSuy8vMt/X8KzTXM1W4jd3MFPKkNnVWJiWzrwdaaw6O+vkC/s7bj
aQVeMqqUR4M9etzTQyk22hbsqHoICIM6DPeq2WonkxQrAI+Almtuuekhs9Ck/Xx7
oyYydDE02HgNoPX7V41DGoGwnTkiF1/AWkWu1eE9JVG1cPJKsxEvtNMkzsf9Wgsq
55rfw/JbfYPWgFekwZUYLAQPZuLJqeKGYeDml8gPSZ1+SEUGO8FNmB+FcSLrkZeG
1N14L2aNkLpndBCHGAMAvgytvkJEnwsL1OJbm1Ju04XjnIFK8uc=
=OJto
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
