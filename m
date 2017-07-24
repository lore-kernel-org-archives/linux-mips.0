Received: from mailapp01.imgtec.com ([195.59.15.196]:50378 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992366AbdGXXdw47gUt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 25 Jul 2017 01:33:52 +0200
Date: Tue, 25 Jul 2017 00:33:46 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: OCTEON: Fix USB platform code breakage.
Message-ID: <20170724233346.GV31455@jhogan-linux.le.imgtec.org>
References: <1496250830-26716-1-git-send-email-steven.hill@cavium.com>
 <20170719094143.GS31455@jhogan-linux.le.imgtec.org>
 <d8c33b8e-e57c-f109-7747-fdddbcc7bd0e@cavium.com>
 <bce34cc9-38a2-1fce-3569-65742dc068ad@imgtec.com>
 <bca7ce4c-efb0-968e-2570-f759398b75d1@cavium.com>
 <7fae6b84-ee63-072d-9c2d-9fc5a2816e6f@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="v7CWsE/Dy737oYst"
Content-Disposition: inline
In-Reply-To: <7fae6b84-ee63-072d-9c2d-9fc5a2816e6f@imgtec.com>
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
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: "Steven J. Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170724233346.rx2JpMN8CvnIuOctEex028U2L3AgS2SHxTF4n6ALkW0@z>

--v7CWsE/Dy737oYst
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 08:47:55AM +0100, Matt Redfearn wrote:
> Hi Steven,
>=20
>=20
> On 21/07/17 20:05, Steven J. Hill wrote:
> > On 07/21/2017 11:10 AM, Matt Redfearn wrote:
> >> This is indeed still broken in v4.13-rc1 with some configurations:
> >>
> >> CC      arch/mips/cavium-octeon/octeon-usb.o arch/mips/cavium-octeon/o=
cteon-usb.c: In function =E2=80=98dwc3_octeon_device_init=E2=80=99: arch/mi=
ps/cavium-octeon/octeon-usb.c:540:4: error: implicit declaration of functio=
n =E2=80=98devm_iounmap=E2=80=99 [-Werror=3Dimplicit-function-declaration] =
devm_iounmap(&pdev->dev, base); ^ cc1: some warnings being treated as error=
s scripts/Makefile.build:302: recipe for target 'arch/mips/cavium-octeon/oc=
teon-usb.o' failed
> >>
> > With "some" configurations? If I take a clean v4.13-rc1 tag and
> > use the default 'arch/mips/configs/cavium_octeon_defconfig' file
> > and revert the thin-AR patch, the kernel builds and links without
> > any errors. If I go a step further and enable USB DesignWare 3
> > support the kernel still builds without errors. I have attached
> > this config file for reference. I cannot reproduce your errors
> > with a stock v4.13-rc1 kernel.
>=20
> I have bisected it for you. The Kconfig that causes the issue is SMP.=20
> Steps to reproduce:
> $ make cavium_octeon_defconfig
> $ make menuconfig - Turn off CONFIG_SMP.
> $ make clean arch/mips/cavium-octeon/octeon-usb.o
> <snip>
> CC [M]  arch/mips/cavium-octeon/octeon-usb.o
> arch/mips/cavium-octeon/octeon-usb.c: In function =E2=80=98dwc3_octeon_de=
vice_init=E2=80=99:
> arch/mips/cavium-octeon/octeon-usb.c:540:4: error: implicit declaration=
=20
> of function =E2=80=98devm_iounmap=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
>      devm_iounmap(&pdev->dev, base);
>      ^
> cc1: some warnings being treated as errors
> scripts/Makefile.build:308: recipe for target=20
> 'arch/mips/cavium-octeon/octeon-usb.o' failed
> make[1]: *** [arch/mips/cavium-octeon/octeon-usb.o] Error 1
> Makefile:1662: recipe for target 'arch/mips/cavium-octeon/octeon-usb.o'=
=20
> failed
> make: *** [arch/mips/cavium-octeon/octeon-usb.o] Error 2
>=20
> Applying this patch fixes the build.
>=20
> Tested-by: Matt Redfearn <matt.redfearn@imgtec.com>

Thanks Matt,

As for the original patch, with an improved commit message:
Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

--v7CWsE/Dy737oYst
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAll2g9AACgkQbAtpk944
dnpffRAAuci5JCNxNQSZ7GwxlhN7qnJnXwF1SFM++t+UwYIAKBJGNT90bgqz/s0x
czf3xXJVRQ9b6+sLN9P1CTEHJCmW0+/nsIqqHHHiHccM4GDwzmk6nHUEugMn1ext
4yzX/qU4qTyWSMtYZNP6x0R5Ky7/sN83ozdKcy15ZHU0iqdWQRPiAfWjjXKMS+YQ
8Ai3As8wIkrRFEwcwD7/GU4v3qvZoRSYQVcM2OLrBbsKHCvEagv7VcI83yALk9Xj
xNQvrotGgQgg19hHm6KDHvhN1Fz4NrRI5ytz59UrL9xrx+w0e8mVqd4LJG3y4ZwK
mx50vzhsN/zecNOURfjcURD1rsKR/v6aaZoBPv0QobzE+/tRyScNppBHJquoo3si
7fnWEuSFYlTolhk71PqH6TKnjnZUkqObevS7i7F39s24q43Rux6xlXg7XcbIC2OF
2N9bCXVJe9N3QdDHJ3spaLpzHmJi262QvEhifhSSHBo6JSH4mBSVfYRwxGrwEjP7
1vZey2OGRYykf9Y+MqlhHBKxI+wRNfTdnw7bGgMgl52VZQu2FeVJcYjf3EwLH3eb
70M0g4orJ14h4+fRznZcXSxdHvfCyuD4v1LGtC3n8hwQxTDIZRudkku4leTvnUex
c8HeHGxH9KcY2+sifTD/zQe/d+eb2D7k41f0O33jdmBjszHArh8=
=/wwg
-----END PGP SIGNATURE-----

--v7CWsE/Dy737oYst--
