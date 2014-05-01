Received: from [217.156.133.130] ([217.156.133.130]:15783 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-FAIL-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6822081AbaEARpcsXqU8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 1 May 2014 19:45:32 +0200
Date: Thu, 1 May 2014 18:45:26 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 2/2] MIPS: Malta: support powering down
Message-ID: <20140501174526.GH55879@pburton-linux.le.imgtec.org>
References: <1395415232-42288-1-git-send-email-paul.burton@imgtec.com>
 <1395415232-42288-2-git-send-email-paul.burton@imgtec.com>
 <alpine.LFD.2.11.1404191624180.11598@eddie.linux-mips.org>
 <20140422100713.GC42386@pburton-linux.le.imgtec.org>
 <alpine.LFD.2.11.1404221540540.11598@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J/zg8ciPNcraoWb6"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.11.1404221540540.11598@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20140501174526.QQY2OL9BocuBMdbPuGDUSXBLNHSJ42Jmh9eYZo4SMVM@z>

--J/zg8ciPNcraoWb6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2014 at 06:28:26PM +0100, Maciej W. Rozycki wrote:
> > Returning to
> > the monitor/bootloader prompt (which may or may not be YAMON) is not
> > generally possible since the memory it was using has probably been
> > overwritten.
>=20
>  It depends on whether the YAMON memory (first 1MB IIRC) is claimed by th=
e=20
> kernel or not; I don't remember offhand.  Also I don't know if YAMON=20
> reinstalls its exception handlers on application return.  In principle it=
=20
> should be doable.
>=20

The memory used by YAMON is reserved throughout boot (presumably to
allow the amon interface to be used by the old CONFIG_MIPS_CMP SMP
implementation). It's freed at the end of boot though.

> > It may make sense to separate halt & power off though, with
> > halt simply executing an infinite loop as you suggest.
>=20
>  Yes, that would be great if YAMON return turns out infeasible.
>=20

One big issue is that the system may not even be running YAMON. U-boot
runs just fine on a Malta and executes from the end of the first 256MB
of kseg0, rather than from the start of it. It would be possible to
specify some mechanism for the bootloader to tell the kernel what memory
it uses & avoid touching it, then attempt a return if that information
is provided, but I don't really think it would be worthwhile.

> > >  Shouldn't the handle on the device and the resource be requested ear=
ly=20
> > > on, where mips_machine_halt (mips_machine_power_off) is installed as =
the=20
> > > halt (power-off) handler?  Especially requesting the resource here se=
ems=20
> > > to make little sense to me -- we're about to kill the box, so why bot=
her=20
> > > verifying whether it's going to interfere with a random driver?
> >=20
> > Well requesting the I/O region was more about sanity checking that it's
> > present. This could be done earlier I guess, it would just mean keeping
> > around the needed I/O & PCI bus pointers in globals and I don't see the
> > issue with just acquiring them when they're needed.
>=20
>  I have two issues with that:
>=20
> 1. Drivers generally claim resources at initialisation, not at the time=
=20
>    the resources need to be used.  While the power-off driver is very=20
>    simple and single-use only, I see no reason for it to be different. =
=20
>    I find it useful to see what hardware has drivers attached in=20
>    /proc/iomem or /proc/ioports too.
>=20
> 2. Any resource claim error message seen at boot can prompt the system=20
>    operator to take a corrective action.  When it's only issued at system=
=20
>    shutdown, it's likely it'll be too late already.
>=20
> Do you think there's anything wrong with these obervations?
>=20

Nope that's fine, I'll move the request for v2 and implement the hang on
halt behaviour.

Thanks,
    Paul

--J/zg8ciPNcraoWb6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTYog2AAoJEIIg2fppPBxlZSEQAJfBZ4+9BKuuAPOHkD0teIwS
3rgKMLkbad2OU3XAJ2kbxUWn6rYUpD8C89K0Ta4+DFZQ5mZOBVzA4QlcaPNUdM7j
QkgrkleaOem9rqaoJQLJu7O8zuJKAHE/C66Wzy8nKHna+FVMzugub0j6ZV10yVYy
ilgv0r5Lshe+worKz82iUpqZDkrzrs1e/zyxBN/cGfZ8A8t8Q9D3yT3iwh3tnCp2
DAJjL84mYXJPGnVXimCG9eJHpcedb8jb/H9verlkVxN2ILmaNR+0vub1XIReVkDZ
nblN0IqWQ+hGE7tHBC93BY6+01RZaFO+SbgBonh8qNtoh0tlTlKCC3OoVmWKzxSK
An0ntIWg/EKD9z17m0d/56Y2qeYgof3AWI9CYmZPrV9y9PTJ7oRp1wF8m2qCxtN2
YrnP+3DAyysYii8wu9Yas+tbx6w812Fi60HyRbxeoS+1mmGV/VSpRwe6E8QeKbVT
wnTRbPQe9Mlb0J4FUcxnwzMUk7g8nMJMGEHIfiEF/8JATAxaRKbyJqKKxR3KWa2a
6CUt5oe1Lp1GG93bPQ23fwUl0yEb3NMEANsNBxLWSMDdTI1luoHon6mgdgaWpas/
+GliImTLJaA2SBNQZFdF7hoYoLVcGal2OYfJRJJ8b6e7YCj8aYcwDSIOiy3dVBIR
zSsOTmBBziRakcImTcUu
=OqBh
-----END PGP SIGNATURE-----

--J/zg8ciPNcraoWb6--
