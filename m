Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:44200 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990436AbdK1LGkF3h5- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Nov 2017 12:06:40 +0100
Date: Tue, 28 Nov 2017 11:04:35 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH v3 04/11] MIPS: Octeon: Remove usage of cvmx_wait()
 everywhere.
Message-ID: <20171128110434.GE27409@jhogan-linux.mipstec.com>
References: <1510633827-23548-1-git-send-email-steven.hill@cavium.com>
 <1510633827-23548-5-git-send-email-steven.hill@cavium.com>
 <2f2def3f-e047-1a46-1cd7-ebf4744dc2c3@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline
In-Reply-To: <2f2def3f-e047-1a46-1cd7-ebf4744dc2c3@caviumnetworks.com>
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
To: David Daney <ddaney@caviumnetworks.com>
Cc: "Steven J. Hill" <steven.hill@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20171128110435.t9QUl6DOiv2POk9UXHRmeIlYYjbTSSXSB4Wx9Dh3NhE@z>

--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Nov 27, 2017 at 10:56:33AM -0800, David Daney wrote:
> On 11/13/2017 08:30 PM, Steven J. Hill wrote:
> > From: "Steven J. Hill" <Steven.Hill@cavium.com>
> >=20
> > Signed-off-by: Steven J. Hill <steven.hill@cavium.com>
> > Acked-by: David Daney <david.daney@cavium.com>
> > ---
> >   arch/mips/cavium-octeon/executive/cvmx-helper.c |  2 +-
> >   arch/mips/cavium-octeon/executive/cvmx-spi.c    | 10 +++++-----
> >   arch/mips/include/asm/octeon/cvmx-fpa.h         |  4 +++-
> >   arch/mips/include/asm/octeon/cvmx.h             | 15 ++-------------
> >   arch/mips/pci/pcie-octeon.c                     | 12 ++++++------
> >   5 files changed, 17 insertions(+), 26 deletions(-)
> >=20
>=20
> WTF:
>=20
> drivers/staging/octeon-usb/octeon-hcd.c: In function 'cvmx_fifo_setup':
> drivers/staging/octeon-usb/octeon-hcd.c:636:2: error: implicit=20
> declaration of function 'cvmx_wait' [-Werror=3Dimplicit-function-declarat=
ion]
> cc1: some warnings being treated as errors
>=20
> Why was this patch submitted and merged without running git-grep on=20
> cvmx_wait?

I guess I put too much store by your ack ;-)

Lesson learned, I'll grep next time.

>=20
> Steven, send a patch to fix the breakage.

See this patch & thread which you were Cc'd on:
https://lkml.kernel.org/r/20171117075010.24131-1-aaro.koskinen@iki.fi

Cheers
James

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlodQrYACgkQbAtpk944
dnpVuQ//aPI6eMHm89UPCnApI/jS2kfAuhC5cZVnN2QXrnZGYsxOyBKdSzHPY+7F
I7ZTjOI9Gz0XZtKtY/3+utY1eiNKQLCJbAeS95tHGNaF72kl+V6e6rxzDiWC/04U
eVXyxq+Y8fmqAqCV6EP7g2RQHsCsUXjGwBGsJFLFDtIuNg1oyl7Kts6qC490sIak
gFxqnq9nevrJSspbM3cienaKeRdp774DpWdm9dVu3Nbe/0wG9+dCJlgbzXS4jQLB
sUY7/DKhbJtyQ28ic+NP2xmCjcDNbrA0MehpRV8ZhfFvsXqD0F3DsUVak3zgO4Ko
mr+Px33UhqKjvoLXZfrKcawyzBKHG0faEdtYWgKPtBZZBLNkWfKQ8zO0k6Qo3H3d
LFlU46MjFUz2feyeNlA+NXDAxMgA0r5Akp8TSgHQw0ufDurqv2gdfUKwG4a4D8y6
A1O9DDwSM6ZTnjzSsQrZWaNAdzxudrbRB6q/sizn54P4jsNiGQMUieGcuPQw6eNH
UKbx6svGXJ7+kZzyew9YarZtE9RFC2BclNJWCmdAV/zjvjQUZYMAMVSgO0v2kY3W
tyFlX1zRu9N3wrNgcBs9B7zKNbCLSgGDMrexiT0YfA/7VGXSfEIIInCEKxTFytnx
d2Xbnnrt5BFWGehce+1eWv1nS5bOde4pPM4qnLYuL1JrrOq1fmY=
=YckL
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
