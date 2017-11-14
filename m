Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:39602 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990765AbdKNVp16U0ov (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 22:45:27 +0100
Date: Tue, 14 Nov 2017 21:43:59 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [net-next,1/3] netem: convert to qdisc_watchdog_schedule_ns
Message-ID: <20171114214359.GI15235@jhogan-linux>
References: <1510088376-5527-2-git-send-email-dave.taht@gmail.com>
 <20171114211112.GA28794@jhogan-linux.mipstec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yQrIXZbGokyKU1X6"
Content-Disposition: inline
In-Reply-To: <20171114211112.GA28794@jhogan-linux.mipstec.com>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171114214359.VSRWKirl54YsvOcvz56lbbPESV_GS2qgUAMfv3hUN-4@z>

--yQrIXZbGokyKU1X6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 09:11:12PM +0000, James Hogan wrote:
> On Tue, Nov 07, 2017 at 12:59:34PM -0800, Dave Taht wrote:
> > diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
> > index db0228a..443a75d 100644
> > --- a/net/sched/sch_netem.c
> > +++ b/net/sched/sch_netem.c
>=20
> ...
>=20
> > @@ -305,11 +305,11 @@ static bool loss_event(struct netem_sched_data *q)
> >   * std deviation sigma.  Uses table lookup to approximate the desired
> >   * distribution, and a uniformly-distributed pseudo-random source.
> >   */
> > -static psched_tdiff_t tabledist(psched_tdiff_t mu, psched_tdiff_t sigm=
a,
> > -				struct crndstate *state,
> > -				const struct disttable *dist)
> > +static s64 tabledist(s64 mu, s64 sigma,
>=20
> sigma is used in a modulo operation in this function, which results in
> this error on a bunch of MIPS configs once it is made 64-bits wide:
>=20
> net/sched/sch_netem.o In function `tabledist':
> net/sched/sch_netem.c:330: undefined reference to `__moddi3'
>=20
> Should that code not be using <linux/math64.h>, i.e. div_s64_rem() now
> that it is 64bit?

For the record, Dave has kindly pointed me at:
https://patchwork.ozlabs.org/project/netdev/list/?series=3D13554

which fixes the MIPS builds.

Cheers
James

--yQrIXZbGokyKU1X6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloLY54ACgkQbAtpk944
dnq0QRAAkHn5lPXmd6rYgKNJteDly4FsWam1JD8LsCZ433WAjDs4D7T/2vO6kAS2
F3slScj5FuIe61pQEGRMSPEqjF6FaE6gHnhKB0dpAzyYwDAS+pp76cldzJYu0xXU
Uyapaw4C+eaMSYT9/XVTaFBfke1O2GbXzYwTaCcM549fvqQ2ZRB4AIwoukuCyya6
+0Cmkeq0R0zfE5IpIvxC8QAVVVAPb5rSDzBRCsQrxYVQKiZtzKdz0xv43WMnmD1R
Ge4XX4nh1GpAM5G9ZR5lc898dRS+7Swfo/zbaCVcXWs1IoNrW/Q4KmNC8zB4Yq6z
BJ/QGzjzi3jCj0d7V4rwVbmSa9BWz3P6CCmYvt6fWn+/AEWhgUoRszEaaLJo3yY6
r0z8tXMxBlzBH/ObhSzqPo7pfeUyCx/UOKxlHPSQDtZXFkN88xcnJ9W88BntVE0a
S583Y5jM+LPZnJ3R4i1ivZ48L9hFjxcrSqCLd0EUFlCPbkGzyroZRunjLmfPgY+j
lo2MVnTeLh09NBxPoYsLVa7E6aYdl5NNx2xIb1nYbRlEJhUK9sLqJsfUppsDprLY
vO6HYyIlxP6GieMxfC99vcXwbN1QMGliGmpv8F1syIWZZJ9hwJFoOngtaIgkStCj
Bx9OKtBv6fwcdZ/FQoh+v6ENhMiCIv+GBlEXqHxX481QxJh4aXk=
=lRir
-----END PGP SIGNATURE-----

--yQrIXZbGokyKU1X6--
