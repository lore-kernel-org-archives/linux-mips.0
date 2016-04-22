Received: from mailapp01.imgtec.com ([195.59.15.196]:57000 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27006649AbcDVTXSiRdOU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Apr 2016 21:23:18 +0200
Date: Fri, 22 Apr 2016 20:23:12 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 3/4] MIPS: malta-time: Don't use PIT timer for cevt/csrc
Message-ID: <20160422192312.GM7859@jhogan-linux.le.imgtec.org>
References: <1461345557-2763-1-git-send-email-james.hogan@imgtec.com>
 <1461345557-2763-4-git-send-email-james.hogan@imgtec.com>
 <alpine.DEB.2.00.1604221951290.21846@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/hP/389S7qb5BOej"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1604221951290.21846@tp.orcam.me.uk>
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
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160422192312.uDVMDsjMtXTfnnpf1A2GUp4otQStCjvw9FHplLRgObw@z>

--/hP/389S7qb5BOej
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2016 at 07:57:11PM +0100, Maciej W. Rozycki wrote:
> On Fri, 22 Apr 2016, James Hogan wrote:
>=20
> > The PIT timer is slow, especially under virtualisation, compared with
> > the r4k timer, and doesn't really provide any advantage on Malta since
> > it doesn't support clock scaling (which is where the PIT has an
> > advantage).
>=20
>  I'm not sure I'm able to parse this correctly: are you saying that the=
=20
> i8254-compatible PIT in Malta's southbridge does not support clock scalin=
g=20
> for some reason, unlike the same implementation on other platforms? =20
> What's the reason then, the southbridge is the same as in many x86 PCs?

Sorry, that wasn't written very well. the "it" on 3rd line is referring
to our malta support. I mean something more like this:

The PIT timer is slow under KVM+QEMU virtualisation compared with the
r4k timer, and doesn't really provide any advantage on Malta since we
don't support clock scaling on Malta, which is where the PIT would have
an advantage over the CPU clock based r4k timer.

>=20
> > Drop the use of the PIT timer on Malta so that the r4k or GIC timer will
> > be used in preference.
>=20
>  Not everyone uses virtualisation, so it's a functional regression for=20
> them.  Can't you lower the priority for the timer instead so that it is=
=20
> not selected by default, just as it's done with other platforms providing=
=20
> a choice of timers?

I'll look into that. Looking back at my IRC logs I suspect I meant to
check why the PIT was taking priority before submitting upstream, but
forgot.

Thanks!
James

--/hP/389S7qb5BOej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXGnogAAoJEGwLaZPeOHZ6nfYQAJvtgFeKsvc9lVj5jJuAUWw5
jxd0ud3ls3w7YD3OyTo3JSKWGJ9cxYWxMrJ303CKOuJkKzdWdKJ90vZ6en73Ypdg
AN8kn4KeKxyqEI9l1lsqD3e9IK9WlWEPvxR5wNW/vb0sKo2CrsaedyeEGwKEeK/r
YpR5X1Bp9puyhMfmKYve/O6+ol8oE4KidV/a5AVqIxDGtcsiSwNQxybXjEzylGnI
EiCBaSaFhP2Nr7Z/DI8fe6X6UuFaxmFP/yHb4v/GatqO+k/c7Q2OCptoqavX4yr8
+VEEVSsBbIV8Cypmh4kWeGpwrOndfseMy0YONYsfSjxMVCZicE0TKYwS1X2bU7Ju
932kpauX0+si2RI8jDM3dYgQm9zZ6FeLE8iUYIDOMb4dILAEt0mDhdqUyNOf6QXw
abpdJo+vnLDBy/5Aq5vHZ6PWyb1IWfpz9YwGcRQSHaiKHeI+d/gt6aGLmaXKP237
IZyrfRyPQA+05XYj7DK2aKxp17wqTB7VeJAy+pSURJxaeLJKcRZXqYgrfyXgUdaS
V2uE1NoARii3mfBuDQ3Ox9tU5wQR2O9Dh5NwxeeNq/ZsyxMNTa7I245GzKBs8c6d
BePcR6oDw3vtL3AqdPPBb9c9UyHMTAGwydJwmUywEmq7MQ6w1eKKIzYQBWawh9Cf
MRW55brQ9iKvU7iXBgpn
=KsPE
-----END PGP SIGNATURE-----

--/hP/389S7qb5BOej--
