Received: from mailapp01.imgtec.com ([195.59.15.196]:39303 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23991061AbdGSJltT-I8- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 19 Jul 2017 11:41:49 +0200
Date: Wed, 19 Jul 2017 10:41:43 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: OCTEON: Fix USB platform code breakage.
Message-ID: <20170719094143.GS31455@jhogan-linux.le.imgtec.org>
References: <1496250830-26716-1-git-send-email-steven.hill@cavium.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6pbY/KU4ayLo+qis"
Content-Disposition: inline
In-Reply-To: <1496250830-26716-1-git-send-email-steven.hill@cavium.com>
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
To: "Steven J. Hill" <steven.hill@cavium.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170719094143.Alzd9vIcdFue95Elcod38t-4RS8ccl6sw_QHANSWpNg@z>

--6pbY/KU4ayLo+qis
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2017 at 12:13:50PM -0500, Steven J. Hill wrote:
> From: "Steven J. Hill" <Steven.Hill@cavium.com>
>=20
> Fix build error which appears in latest 4.12 series. Also remove
> redundant header include.

Is this already fixed in some other way or is it some unusual
configuration? I couldn't reproduce any failure on 4.12 and you haven't
quoted the build error or explained what was missing that required io.h
to be included.

Cheers
James

>=20
> Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
> ---
>  arch/mips/cavium-octeon/octeon-usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octe=
on/octeon-usb.c
> index 542be1c..bfdfaf3 100644
> --- a/arch/mips/cavium-octeon/octeon-usb.c
> +++ b/arch/mips/cavium-octeon/octeon-usb.c
> @@ -13,9 +13,9 @@
>  #include <linux/mutex.h>
>  #include <linux/delay.h>
>  #include <linux/of_platform.h>
> +#include <linux/io.h>
> =20
>  #include <asm/octeon/octeon.h>
> -#include <asm/octeon/cvmx-gpio-defs.h>
> =20
>  /* USB Control Register */
>  union cvm_usbdrd_uctl_ctl {
> --=20
> 2.1.4
>=20
>=20

--6pbY/KU4ayLo+qis
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAllvKVYACgkQbAtpk944
dnpx6Q//cZfq+rbPyDkC3yfwIEVM+gPQ/4ZZHo5WE3VDVTtJf1nQHB3jRQq5ZNad
KzSJPF0rpYUZMMHCkdeWs1ess9BiqzHTzmlQKClbsNkuWwxWrAaoG69PTGN300rB
5ZhpbNaJAWnCiIsFeKDl317ysHdgW5AvX0eYiXJyHW/CJUBzF6l+cUnMBBVNWLIc
grJcO/ELEYMT/lWMFQxR6RedLVmCSVBTFsxs2T+6maQIHPXnCTl3zpwK6R02ciP/
bMask8SE1U4NJ9xxZps5T66kmw6n/ZvuUhJ8Kdzayi/4hoC1d620azRdy0cr5nOD
pjjxf8msWFKXqI54t8tbsB8NAs7OGeogag9AlvnCD7HDSbxgV7y0+FLpIqovDcFe
EXN5Q3Rw8akGbz3dojWXwoJSgG3X7uWVCpGPZdL59zl1sebL+dHBVn2T16ywpEku
ecR3X059gkAFaP+yUBFhhM6ozholeyFfzhblsbiDVHvylGiHEGhX6xwIU/Z9ypk1
F+c8UzgzI52Nuy7qDbXGY1ebQvQxsJRv8NfVuqfrCm24tG6blc1FHmUlOjm6CoIX
BF85nehpU5Lar+M5d+DoZ3vRsNYaPHGqBtTxX2VPFBsEhB8vutKow2n4nqPSlP4u
+gxUae4Brg+Lxm5mFvhJj3rC1b3JjD2csJcKfADqN5V17oTZsj4=
=zPCt
-----END PGP SIGNATURE-----

--6pbY/KU4ayLo+qis--
