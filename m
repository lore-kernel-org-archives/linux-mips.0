Received: from mailapp01.imgtec.com ([195.59.15.196]:21179 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27006997AbbEZH04vJoJt (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 May 2015 09:26:56 +0200
Date: Tue, 26 May 2015 08:25:48 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v5 36/37] MIPS: ingenic: initial JZ4780 support
Message-ID: <20150526072548.GS13811@NP-P-BURTON>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
 <1432480307-23789-37-git-send-email-paul.burton@imgtec.com>
 <5563019A.2050702@hauke-m.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ISKrrfpKsPiF35CV"
Content-Disposition: inline
In-Reply-To: <5563019A.2050702@hauke-m.de>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mips@linux-mips.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Joshua Kinard <kumba@gentoo.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Message-ID: <20150526072548.LyKbDsnS_fvbyUYmh2JHynokqGJOYGqLMOW6NeFcw-4@z>

--ISKrrfpKsPiF35CV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2015 at 01:03:54PM +0200, Hauke Mehrtens wrote:
> > diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
> > index 1bed3cb..510fc0d 100644
> > --- a/arch/mips/jz4740/setup.c
> > +++ b/arch/mips/jz4740/setup.c
> > @@ -83,6 +83,9 @@ arch_initcall(populate_machine);
> > =20
> >  const char *get_system_type(void)
> >  {
> > +	if (config_enabled(CONFIG_MACH_JZ4780))
> > +		return "JZ4780";
> > +
> >  	return "JZ4740";
> >  }
>=20
> Shouldn't this be provided by device tree, now it depends on your kernel
> config.

At some point, when the kernel is generic enough that one binary works
across multiple SoCs, yes definitely. Even better might be to detect it
at runtime. The kernel can currently only be built for a single SoC
though, so the code as-is works just fine & gets things working on the
CI20 without making an already lengthy patchset longer than it needs to
be.

> > diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
> > index 9172553..7ab47fe 100644
> > --- a/arch/mips/jz4740/time.c
> > +++ b/arch/mips/jz4740/time.c
> > @@ -102,7 +102,12 @@ static struct clock_event_device jz4740_clockevent=
 =3D {
> >  	.set_next_event =3D jz4740_clockevent_set_next,
> >  	.set_mode =3D jz4740_clockevent_set_mode,
> >  	.rating =3D 200,
> > +#ifdef CONFIG_MACH_JZ4740
> >  	.irq =3D JZ4740_IRQ_TCU0,
> > +#endif
> > +#ifdef CONFIG_MACH_JZ4780
> > +	.irq =3D JZ4780_IRQ_TCU2,
> > +#endif
> >  };
>=20
> same here.

Same response :)

Thanks,
    Paul

--ISKrrfpKsPiF35CV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZB/3AAoJENzvn0paErs5TjQP/3jxzdlliT7qvgmEycMweXzh
h706mxyUxYhg2PzAzH7XMqFXGUShi/vy6RZkp0Sj1b8A4nnvpISQWXpC+V8mooAJ
xyxVuZFvVRdDMLcKD/Rw9a4k2kgsOdwkIaLSmqLUN+HAMbjCl5kzpvTGBrQh8Rwi
dwMl/hB/9rHf4dX4YbMXwgy2e3iBHoeNzfkCC5To5NC5yiDnO0dZRskMOlKS4LE2
lwgxMJcO7aMGs6Q/nRE8TocVYi+4GLRl9dnPSu4hag8PZokd91yF+ZmAuuXwa97u
stW5SHIcdABgPPbdsyXSUlbw4mguohY1ZQYXvKXrE11Acpl3FpWn74LUvx+I1qtg
2NNbIsj4Iklm0KltwouNdZuFMBM1AZweJ7vNmOaOWP3KV0fNA7WtxdBVGYCOtLvv
qsCJ3Y6t8i8s9JKJ1/7C4HKlDnSercgYG81nMprnPr16dcUtAyHchj/uPB0BBPgW
RInzipmWTMO8K7+0VrvU3gModh290VkuMgFtl9iIVT+wMhdqb+Y/BKThZTYC69OB
GxyIwVqB2xN2qVT1n6ZKRbSBL8JvQRhWxIANabpHR21IH9buzuRobjOrqq8pugtT
Z5nRoKDGG3iZoZbPLVA5JGZSmj1n+vQ4v3woI+084FVIVCa92eHRbLYDeFilCT5h
A6l+tI8FbTYEsnO+t7Sn
=Huf8
-----END PGP SIGNATURE-----

--ISKrrfpKsPiF35CV--
