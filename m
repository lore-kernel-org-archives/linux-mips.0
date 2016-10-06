Received: from mailapp01.imgtec.com ([195.59.15.196]:28937 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992212AbcJFWubCSdYm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Oct 2016 00:50:31 +0200
Date: Thu, 6 Oct 2016 23:50:24 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 1/9] MIPS: traps: 64bit kernels should read CP0_EBase
 64bit
Message-ID: <20161006225024.GJ19354@jhogan-linux.le.imgtec.org>
References: <e826225b15736539cd96a1b6b2a99e2bb2b4eb87.1472747205.git-series.james.hogan@imgtec.com>
 <20160921130852.GA10899@linux-mips.org>
 <73eede89-af68-eb17-b0b3-2537084da819@imgtec.com>
 <alpine.LFD.2.20.1610021038190.25303@eddie.linux-mips.org>
 <20161005155653.GG15578@jhogan-linux.le.imgtec.org>
 <alpine.LFD.2.20.1610061709400.1794@eddie.linux-mips.org>
 <20161006180525.GG19354@jhogan-linux.le.imgtec.org>
 <alpine.LFD.2.20.1610062054500.1794@eddie.linux-mips.org>
 <20161006201943.GI19354@jhogan-linux.le.imgtec.org>
 <alpine.LFD.2.20.1610062335410.1794@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1610062335410.1794@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20161006225024.-HeLzo2JwhiK6S4EiShORUDg3m3eGdz3FZ-FJUz5qZY@z>

--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2016 at 11:41:40PM +0100, Maciej W. Rozycki wrote:
> On Thu, 6 Oct 2016, James Hogan wrote:
>=20
> > >  How can we install a handler then when we don't know what the upper =
32=20
> > > bits of EBase are?
> >=20
> > Right now its assumed the default upper 32 bits are sign extension of
> > bit 31 in that case (i.e. thats what upper 32bits are clobbered to). I
> > think the only case where that might not be true would be where WG is
> > implemented and the bootloader has changed them to e.g. somewhere in
> > XKPhys, and then cleared WG. We could catch that most of the time by
> > detecting changed bits 31:30 (as I think you suggested before), but it
> > still isn't watertight (e.g. xkphys+0x80000000), so if in doubt we
> > should probably be sure to allocate our own exception vector instead of
> > guessing at the boot one. What a mess :-(.
>=20
>  Does it really matter in reality though?

Good question. The whole thing is based on paranoia really.

>=20
>  By keeping EBase unchanged we try to install exception handlers in memor=
y=20
> assigned by the firmware.  This may not necessarily be safe.  I think we=
=20
> actually ought to set EBase ourselves, perhaps on a CPU by CPU basis in a=
n=20
> MP system, pointing to memory we know we can use at will.  If this is=20
> going to consume say a page of memory per CPU, then still I don't think=
=20
> it's a huge waste, and any firmware memory safe to reclaim after boostrap=
=20
> we can use for other purposes.
>=20
>  Have I missed anything?

I don't particularly object to always allocating our own vector when
EBase is present. It'd probably break KVM, but that's KVM's fault for
not emulating EBase properly yet.

I suppose there is also an advantage to keeping the bootloader exception
vector as alive as possible at least until Linux has set up its own one,
as it allows early bugs to be caught by the bootloader, which can dump
registers etc and even return to the bootloader prompt.

Cheers
James

--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9tUwAAoJEGwLaZPeOHZ6or8P/RvE4rk+AnYYeCAafvqNbsmj
7N/aFCOwuhffhYnY0+nXD/cz9VAqqs8Rg88K8vfYCE/Rm1hVA8cTOTCYvuRv3Xet
KWxO/I7vm1ofBrdSqRYTmtU6YTv86+3zbMP83KTfXcWrmgi7wXoIVmv0J9027A7W
66br00ZMd2x/QdqpLzRSn6TtuxyoPjXiy5DQxAm+bmJgBXiWsmB83KIRjbUfod4n
znBasWOKkiCbdUlSDX9BnpR2clkr550S0FawAGLSGA/mOlkW6lsaFn1bXkt0O0no
rSTCj7aLzbY6px12A6fq45a9SVacozQZznR2D+YdBOhoki4eeC6xQAdLbpwpJ/zF
E6ZG3kglsgENxgMGfZGDisH2tr77LVHyx7OZcyes9Gk7KgOPz6oxzqy1XkzVi5Tc
R593G8VsjirdIAas6S1RY24Bhmb51VKCfEjhOfEmhqTQqYzqv3/f+dICYswjjT+E
qeNgajscec8Z61lXGF+oio+VvHlnQ+GSx7pPqJank3Rv/ZdaKLDF8uXmZ0yE90Lg
CibqyZ/erSsXGbpxTHnvISB5Jy6R5Fx5wRbH+YkWLabKAQPoLG9r04MJQ6MPgVHV
PuJ98GudTnC5EaBDtyaly4jYflQSe/Z5XHXiW77zqDiDNO5N0muuyTDaMcTtso6w
h7Rny6jrEKFMni20mf1C
=9D92
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--
