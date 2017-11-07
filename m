Received: from 19pmail.ess.barracuda.com ([64.235.154.230]:41254 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992329AbdKGVkOcVrh5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 7 Nov 2017 22:40:14 +0100
Date: Tue, 7 Nov 2017 21:39:15 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: BMIPS: Fix missing cbr address
Message-ID: <20171107213915.GK15260@jhogan-linux>
References: <20170616110301.38103-1-jaedon.shin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Z8yxTSU1mh2gsre7"
Content-Disposition: inline
In-Reply-To: <20170616110301.38103-1-jaedon.shin@gmail.com>
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
To: Jaedon Shin <jaedon.shin@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20171107213915.1PNfd2I836z2uF8ew_AHcM_bVFzg7wTD3ivPHpMq-gE@z>

--Z8yxTSU1mh2gsre7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2017 at 08:03:01PM +0900, Jaedon Shin wrote:
> Fixes NULL pointer access in BMIPS3300 RAC flush.
>=20
> Fixes: 738a3f79027b ("MIPS: BMIPS: Add early CPU initialization code")
> Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>

Thanks. Applied for 4.14.

Cheers
James

> ---
>  arch/mips/kernel/smp-bmips.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> index 1b070a76fcdd..5e0d87f4958f 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -589,11 +589,11 @@ void __init bmips_cpu_setup(void)
> =20
>  		/* Flush and enable RAC */
>  		cfg =3D __raw_readl(cbr + BMIPS_RAC_CONFIG);
> -		__raw_writel(cfg | 0x100, BMIPS_RAC_CONFIG);
> +		__raw_writel(cfg | 0x100, cbr + BMIPS_RAC_CONFIG);
>  		__raw_readl(cbr + BMIPS_RAC_CONFIG);
> =20
>  		cfg =3D __raw_readl(cbr + BMIPS_RAC_CONFIG);
> -		__raw_writel(cfg | 0xf, BMIPS_RAC_CONFIG);
> +		__raw_writel(cfg | 0xf, cbr + BMIPS_RAC_CONFIG);
>  		__raw_readl(cbr + BMIPS_RAC_CONFIG);
> =20
>  		cfg =3D __raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
> --=20
> 2.13.1
>=20
>=20

--Z8yxTSU1mh2gsre7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloCJ/wACgkQbAtpk944
dnoMjQ/9EIHPM+IMm/zpYvkKQ7oXmtuzgyBOLM8g8SiHBrJuvZ7zMeDKCeFWBkDY
Uqu+MQK2AGnBsTfjiqSBgiaO7p78oTYKjRYFJ5GbqNBwZYLTMBoWyz4/DUUZ0CXo
2S4AXmmqQf0FnbTtGd5lt6FCZNg0qvyeYvOCUwtuU9RK6QKEVy3nzL/OTAbzdgZp
ArS277LXCzb3aDFQ0TUcg58GPkh03GOzreh+FXs95uy3lZ1m6BbaKPQfzXvEKxhN
+kOvB7lxvqwIS3Z5vuuFHwY2P20G9/OQtz2Mch6dc0GFjxBzWU2ZwdkbkKTxPYWu
s/lM4ktBlU93d6vFD9pgb3afTQoIzxRrA1Jyqxyl02CFC9IX90DPKo2GXVjjEET9
HrG+VvpMA1G+6knwUvWB7Z1fExJ+2hyseXjsPfD3gEtKQeYSpSlbtND58wqalJn9
FZcmE4hml66oTtNcjY92WrFEEhJWrKwgTJTHfk7h07X6NvQRDnrzspFEbi0ud6NI
wwYOJdt/vYMpxHKYl2+yNsRjNjwquM5hyz6KzXxLekXwGrfdF3hi9bTx70fr288d
vi/uzbpv2blDxpOl6/JwQ16go2ZaSwK8L1oumiRp5+uMVHySM1FX/2C7lLvpbDJf
JGonuASwTWxkLczexDagvtC2hSYARThlecHBD4JFsnlM7vw/g/o=
=mMww
-----END PGP SIGNATURE-----

--Z8yxTSU1mh2gsre7--
