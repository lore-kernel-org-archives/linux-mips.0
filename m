Received: from 19pmail.ess.barracuda.com ([64.235.154.230]:32836 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990921AbdKINAhRmfDH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Nov 2017 14:00:37 +0100
Date: Thu, 9 Nov 2017 13:00:17 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH 0/2] MIPS: Xilfpga: Switch to generic kernel
Message-ID: <20171109130016.GV15260@jhogan-linux>
References: <20170331090042.29168-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ma2pZxZcUUd0eybH"
Content-Disposition: inline
In-Reply-To: <20170331090042.29168-1-Zubair.Kakakhel@imgtec.com>
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
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@mips.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20171109130017.mf3P4GenLTuDcBLSl2P1yjZfjXGaEIJifjBWmeNCi3w@z>

--Ma2pZxZcUUd0eybH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2017 at 10:00:40AM +0100, Zubair Lutfullah Kakakhel wrote:
> Hi,
>=20
> Couple of patches that convert the MIPSfpga platform to using
> the generic kernels
>=20
> Based on v4.11-rc4.

Thanks, Applied for 4.15.

Tweaks to fix conflicts:
- Use separate board-xilfpga.its.S.
- Add 32r2 and little endian requires to board-xilfpga.config
- Update arch/mips/Makefile snippet and move to end

Cheers
James


>=20
> Regards,
> ZubairLK
>=20
> Zubair Lutfullah Kakakhel (2):
>   MIPS: generic: Add support for MIPSfpga
>   MIPS: Xilfpga: Switch to using generic defconfigs
>=20
>  arch/mips/Kbuild.platforms                     |  1 -
>  arch/mips/Kconfig                              | 24 ---------
>  arch/mips/Makefile                             |  4 ++
>  arch/mips/boot/dts/xilfpga/Makefile            |  2 +-
>  arch/mips/boot/dts/xilfpga/nexys4ddr.dts       |  8 +++
>  arch/mips/configs/generic/board-xilfpga.config | 19 +++++++
>  arch/mips/configs/xilfpga_defconfig            | 75 --------------------=
------
>  arch/mips/generic/Kconfig                      |  6 +++
>  arch/mips/generic/vmlinux.its.S                | 25 +++++++++
>  arch/mips/xilfpga/Kconfig                      |  9 ----
>  arch/mips/xilfpga/Makefile                     |  7 ---
>  arch/mips/xilfpga/Platform                     |  3 --
>  arch/mips/xilfpga/init.c                       | 44 ---------------
>  arch/mips/xilfpga/intc.c                       | 22 --------
>  arch/mips/xilfpga/time.c                       | 41 --------------
>  15 files changed, 63 insertions(+), 227 deletions(-)
>  create mode 100644 arch/mips/configs/generic/board-xilfpga.config
>  delete mode 100644 arch/mips/configs/xilfpga_defconfig
>  delete mode 100644 arch/mips/xilfpga/Kconfig
>  delete mode 100644 arch/mips/xilfpga/Makefile
>  delete mode 100644 arch/mips/xilfpga/Platform
>  delete mode 100644 arch/mips/xilfpga/init.c
>  delete mode 100644 arch/mips/xilfpga/intc.c
>  delete mode 100644 arch/mips/xilfpga/time.c
>=20
> --=20
> 2.10.2
>=20
>=20

--Ma2pZxZcUUd0eybH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloEUWAACgkQbAtpk944
dnq8Bw/+JUaLqrT2zbpzBOGS5mSROV0NnwwjW2Y4RquWJ5WgJawD79MrJk0Vs4lW
rAnu0H/8sfm8qUKiw+jRV2rkrk8c1ay8JD+pUZT8bIbojQiOwenWzPaqnuQIZ0iO
X9FPN2utEuUAQJf9bTn5AYdoS3KSMQ2Y1e/Sjad26DFZ4IwrxRhK9WKHDPoLVofd
0/8sME42T5FI04YPk1o/Eu/kyIfdC1Z8///jMLt+ew8JeVZGqZztRlGZ3yVTi6/1
rmj84Ky11JjwdppNza5IkAqcEdJ46gcN8pDngsmf3YouLlwUa9RHPxNzvnqQCZMw
El4z6BCzDViiAcHy+IgBBvzJZ3ZqZkKrQurEcNMh3sY53xURsJ/5W+xa6sTbhzSI
ARZrun5pBQl0CTFiWhg4FEewa6BwvSLEHAKf/19hclaJQE4lzzAwZ+PgbZmds0UL
ysRm6Ns5FHGZo3rwErJ27lJDbxE2CAV0M1m2MLMUK7VIa/V2Y0GlWgHZ59FAHVFR
0jxtG+l1opEP9AVJtu8jldVH5XBNEldJblw72ZBUT/y/QkykMjyV6x05LyP5ZK2g
z/g0lqy2AZB9s6L58Gg/MuwRuQ3dniWYl7pxB3VB1CI+7kgr5UrJ7mCXzofL5FeW
1zNEtew0C8tfQIeZ/QgKmJA6/raaNy50PYEjiQ0DjGx/2lzBwLc=
=aawT
-----END PGP SIGNATURE-----

--Ma2pZxZcUUd0eybH--
