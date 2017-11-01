Received: from 19pmail.ess.barracuda.com ([64.235.150.245]:43080 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993016AbdKAWZe3r-ye (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 1 Nov 2017 23:25:34 +0100
Date: Wed, 1 Nov 2017 22:25:26 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MAINTAINERS: Update Pistachio platform maintainers
Message-ID: <20171101222526.GF15260@jhogan-linux>
References: <1507745492-13349-1-git-send-email-james.hartley@sondrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline
In-Reply-To: <1507745492-13349-1-git-send-email-james.hartley@sondrel.com>
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
To: James Hartley <james.hartley@sondrel.com>
Cc: davem@davemloft.net, linux-mips@linux-mips.org, James Hartley <james.hartley@imgtec.com>
Message-ID: <20171101222526.aU1m04XzpQDg2YyHFdSHU581ruvC1-PbJt2l5zfCllw@z>

--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Wed, Oct 11, 2017 at 07:11:32PM +0100, James Hartley wrote:
> From: James Hartley <james.hartley@imgtec.com>
>=20
> Neither of the current maintainers works for Imagination any more.
>=20
> Removed both imgtec email addresses and added back mine for
> occasional reviews, also changed from Maintained to Odd Fixes to
> reflect the time that I will be able to spend on it.
>=20
> Signed-off-by: James Hartley <james.hartley@sondrel.com>

The author (@imgtec.com) doesn't match the sign off (@sondrel.com). If
you don't mind I'll change the authorship to your sondrel.com address
when applying this.

Thanks
James

> ---
>  MAINTAINERS | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccc5181..5ccf3b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10731,10 +10731,9 @@ S:	Maintained
>  F:	drivers/pinctrl/spear/
> =20
>  PISTACHIO SOC SUPPORT
> -M:	James Hartley <james.hartley@imgtec.com>
> -M:	Ionela Voinescu <ionela.voinescu@imgtec.com>
> +M:	James Hartley <james.hartley@sondrel.com>
>  L:	linux-mips@linux-mips.org
> -S:	Maintained
> +S:	Odd Fixes
>  F:	arch/mips/pistachio/
>  F:	arch/mips/include/asm/mach-pistachio/
>  F:	arch/mips/boot/dts/img/pistachio*
> --=20
> 2.7.4
>=20
>=20

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAln6SdUACgkQbAtpk944
dnogYxAAtSdKIS+0esiLhveptTZTpC6PM23S7dSirsxKnXzT1yKu2u9qdWc22dGm
ubaHMU0hDUyYOz/RNJ7urPVBnw7DA3zFjmQOdwqxJ60NwS8+TJxdQk+YXVVPWQ/d
YBpTQXSifxqhcDfazYli+IqYkyLz7eMnul4yInShRw7elkTiN/h0U+i/hARj4Gr6
fMJy+NGA67+fFPBttG6moufquWR1OVq6ureSaOqhUKcIWkQ5WntXFHLgKJqNbyrN
14Nm3M4jVyS78LEAwKwS4mFBnZKTRrdRzA+huYGTiBBZNdi+1y9CevMXy36Rvweb
OYFSeWLBjLLvutdJmQKOhJaoxwtoGMCI7kQXp5GMQ/GCFJk//Kun6E0gzKzKcgwG
88nAm+OxC5FGtmsnVsP3j7Wb9vq3aKSFVjPLXvjwdogOerhjwkI20SgZcaVLa8Jm
d7WhCTEH/8Ig6e6GGDUSX8M3TwXkvzTmHd2QB1+ptcYbA64gCAxFEPY7EBaN7/jL
wIbhKaCf8Ru6T7lDkEFSAwI1Hh2aHNC+VtyzdCLR4s1mBpT25yn/sSVX9ld9lcaR
VRIksZbeS0m6rZgAdRDpL+KBteNgvVNUgjAYAoH8bh3eYNR5CRlfODcj39CVXNb4
/aBxiod8AkEe2HWKDHCf4bH2vRkY1H6n4qXCWl2gtyR7YuKKf6Q=
=1+xI
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
