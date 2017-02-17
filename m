Received: from mailapp01.imgtec.com ([195.59.15.196]:5656 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990552AbdBQKEAvcdC4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 17 Feb 2017 11:04:00 +0100
Date: Fri, 17 Feb 2017 10:03:54 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: DTS: add img directory to Makefile
Message-ID: <20170217100354.GC9246@jhogan-linux.le.imgtec.org>
References: <1487248410-9493-1-git-send-email-Ian.Pozella@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+RqgOR8y65RRYhVY"
Content-Disposition: inline
In-Reply-To: <1487248410-9493-1-git-send-email-Ian.Pozella@imgtec.com>
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
To: Ian Pozella <Ian.Pozella@imgtec.com>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org

--+RqgOR8y65RRYhVY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 12:33:30PM +0000, Ian Pozella wrote:
> An img directory exists for the Pistchio Soc but the directory
> itself isn't in the dts Makefile meaning the dtbs never get built.
>=20
> Signed-off-by: Ian Pozella <Ian.Pozella@imgtec.com>

Applied

Thanks
James

> ---
>  arch/mips/boot/dts/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index fc7a0a9..b9db492 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  dts-dirs	+=3D brcm
>  dts-dirs	+=3D cavium-octeon
> +dts-dirs	+=3D img
>  dts-dirs	+=3D ingenic
>  dts-dirs	+=3D lantiq
>  dts-dirs	+=3D mti
> --=20
> 2.7.4
>=20

--+RqgOR8y65RRYhVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpsqKAAoJEGwLaZPeOHZ6zy8P/1nUZ39rgFSf3nBsDvpBae/E
A03mTU22+LoGD5y2WiBD0EWZYgeEg2oyLzWsSR5k5BvmhP7kX41sTXW7PemJ8ldo
HLGMYHujk/Wm7ldMEOTXtUQ/doskdhYua9eRH4sFOQRhyENkaulSs+hOgGWBqFJX
ya9L2gVTr2VNZMc2iqWowuPjKYGf9V/bFi0qRlr0OWXN3ka7qIJ96yS0SMh2sCJE
BgsorfQuhG6bjCb5Pfp52GsTXzOnenZgFlEbArG1xX4a8K3/QcGA+lgdE6VmyFMK
mDiwpF1Tl/lPn0Q5WCVQbkQo9yuA1yWB2d1EqdeznnuQPV04C14VWhIuHdoCv6OB
/BfOjk1DO/kCj2c3CL80bdvGK+8S9GXVYttbqoHVLSl/du7nGJKArtz60bHSP1xy
kzVH51W+kFXiqTNkgkr+9Pu2r3Yoo9dKT06G0zg0V+KTykejEDQPIwaDlqYxaguu
QWo0F60Kxdhta8LeVq45fwuqtky7BJ31SHh9jBfz+qE4kBJT18tj87dBllYPo6tE
kGqFrQ8eB4h0jK5Ny2+CjgOy9POfWj7dLisrUCeI6bx7oTBnixbdvP1jBoCDctb0
ETBR35w9zGn1Qajk1aAwarcceYGrl760RRX38USrNUTvaWNA9CYFlia60fuTWV+v
L9dFtGw1hMBhhfveC1UL
=BaRP
-----END PGP SIGNATURE-----

--+RqgOR8y65RRYhVY--
