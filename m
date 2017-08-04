Received: from mailapp01.imgtec.com ([195.59.15.196]:43995 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23995077AbdHDNm6coaGP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Aug 2017 15:42:58 +0200
Date: Fri, 4 Aug 2017 14:42:52 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] mips: gitignore: ignore generated .c files
Message-ID: <20170804134252.GZ31455@jhogan-linux.le.imgtec.org>
References: <20170802150404.10579-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oRWDw5wXQ3uCJU7V"
Content-Disposition: inline
In-Reply-To: <20170802150404.10579-1-brgl@bgdev.pl>
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
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20170804134252.Xf9K96IApgWjX9DxPN2ch94HJZ7wSjPhKy-KmkL8r_8@z>

--oRWDw5wXQ3uCJU7V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2017 at 05:04:04PM +0200, Bartosz Golaszewski wrote:
> Add ashldi3.c and bswapsi.c to the list of ignored files.
>=20
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> ---
>  arch/mips/boot/compressed/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 arch/mips/boot/compressed/.gitignore
>=20
> diff --git a/arch/mips/boot/compressed/.gitignore b/arch/mips/boot/compre=
ssed/.gitignore
> new file mode 100644
> index 000000000000..ebae133f1d00
> --- /dev/null
> +++ b/arch/mips/boot/compressed/.gitignore
> @@ -0,0 +1,2 @@
> +ashldi3.c
> +bswapsi.c
> --=20
> 2.13.2
>=20
>=20

--oRWDw5wXQ3uCJU7V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlmEedsACgkQbAtpk944
dnoFjBAAhg2DT+T1u5Kdn7Sigapjx7vxFKAqtFxOiwGzupwAEo9iX4L5Eh9Iyrep
3ShQi8wBdgZpwwiAi2pBkrbTlxstAk3+fD41aXRiMMglydcgneQR8BVLtG5rnS+z
tBWgOjF+75XePRCiQU6AL8Jny0PbKiZJu01uUM0Z0qpcXSliR+KC2AUJxqDWwiLn
JJdu6yMdtLHCKF5auaNtXB6X36DE4Md3MuepBYfR3PcqM2yycLmnhNvB8AKvNHki
H5KSd7kffxZHT3OsCoz+/FevEhi0rVsRNjCEiQ9X+UV7AjqjT9eV732PYwPSlc4K
mcNcQYd8ayMzJQM83b9lpDkYM/jP6JQjpe2EwDXpPpsVxhBxM+LDH6yYdZ6o1dbj
43ovqpfVHyzukO0uIEC2yLWauLFFVhYIBW0XJOXKWzSLfdNU9biUGvKfJ8VySl3T
esgmEkUVa+DyiPvyyk+k3Dv2xFg9Bi5RPcGrt+eC4PirKlIaDmL6qvpuIiSSl2jY
s/dTdw5zjgguAyYDQIirVMm8FhhnaiDS7uuoY11tQoCdHfUhVsNlD29qQEF+MdtG
lFlxK7VVekPWPxI92JxxzsarKBja/DZEfqssr1tN4gc7/Da5PY5DwCItarWhucPl
27Z4TgGvQeeUQAPlN2OM0/LlswbCVAQLYq4vLxFkVAY79HteYw8=
=chuk
-----END PGP SIGNATURE-----

--oRWDw5wXQ3uCJU7V--
