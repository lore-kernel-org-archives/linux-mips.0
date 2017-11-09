Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:37560 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990921AbdKIM4M34f4H (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Nov 2017 13:56:12 +0100
Date: Thu, 9 Nov 2017 12:55:44 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: DTS: remove num-slots from Pistachio SoC
Message-ID: <20171109125544.GU15260@jhogan-linux>
References: <1499238288-28914-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9r3HF47jptiQlX4s"
Content-Disposition: inline
In-Reply-To: <1499238288-28914-1-git-send-email-shawn.lin@rock-chips.com>
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
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: James Hartley <james.hartley@sondrel.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <20171109125544.AQ_kEYWyHcV8C1oAW1zGc0dPN21lAiINCMopUxb__Gk@z>

--9r3HF47jptiQlX4s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2017 at 03:04:48PM +0800, Shawn Lin wrote:
> dwmmc driver deprecated num-slots and plan to get rid
> of it finally. Just move a step to cleanup it from DT.
>=20
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Thanks, Applied for 4.15.

Cheers
James

> ---
>=20
>  arch/mips/boot/dts/img/pistachio.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/mips/boot/dts/img/pistachio.dtsi b/arch/mips/boot/dts/i=
mg/pistachio.dtsi
> index 57809f6..f8d7e6f 100644
> --- a/arch/mips/boot/dts/img/pistachio.dtsi
> +++ b/arch/mips/boot/dts/img/pistachio.dtsi
> @@ -805,7 +805,6 @@
>  		pinctrl-0 =3D <&sdhost_pins>;
>  		pinctrl-names =3D "default";
>  		fifo-depth =3D <0x20>;
> -		num-slots =3D <1>;
>  		clock-frequency =3D <50000000>;
>  		bus-width =3D <8>;
>  		cap-mmc-highspeed;
> --=20
> 1.9.1
>=20
>=20
>=20

--9r3HF47jptiQlX4s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloEUFAACgkQbAtpk944
dnroKxAAjCoJLxVF/PkTGQOINrKFxdgL4gb2QgIUF5/1TIDTQ0qJ77RgooignZll
QPQpcLrtrN1CWWDahOBbcOg6AEbZ9Tt25ByXlX2Yf+iI0Y/zotusu1FqCwGM/g6g
lWRB5H4pgSNIq/nSUFjE9Weob6xgRD175TUnttxuNTiS8zhdHU+9GUyiLUDpQ6Au
oAAhfCeCFYcaV3TTZRduS5hYpHUt66I20X6WazIb262Y/6P0FIh6nIAiUvQxYcUJ
oe1LX7iVvAou3V9gFx/pX+M5feouPip5Ygc7PcA0H98eC07gk6GF2mPUimSxUQh7
YZJuIb9hJ/XJNmNDgQysC4qEV0u2zvW/iTVolAzj72zgdcVft27t00fOJ0+Kgr80
a87T1qo7urvdlBUNavaGHVuSM8s2snc+t7oOcnStyHoNKyZkS7b9MBauix3wnLp6
GGTZAhQ+FXgvDesGI5fkybh5udm8xMij4evIIhJfskD4ctOH67fEFb17xSsediiZ
/QkYztiO+Or598eQHZdq4OCQ3PUSKUts0NmnWdseohAV0muCS3Sj4O5b2PJJ0Omy
FWts1K0K0EGDqeuAsO5SKFcDC0BBps3ii52v88UhufO8MDpVUpIo42EtWyVHD1Bu
mvazSCgcRc0ZCoYIeAoEvB/02ubz26t6iDigiz3MnXQBAvALd3c=
=8g4N
-----END PGP SIGNATURE-----

--9r3HF47jptiQlX4s--
