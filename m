Received: from mailapp01.imgtec.com ([195.59.15.196]:23934 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992160AbcIVVPdYB6-T (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Sep 2016 23:15:33 +0200
Date: Thu, 22 Sep 2016 22:15:27 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 7/9] MIPS: uprobes: Flush icache via kernel address
Message-ID: <20160922211527.GB7352@jhogan-linux.le.imgtec.org>
References: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com>
 <0d915756776de050b8a92b5bb5d4e7ffbe784d66.1472747205.git-series.james.hogan@imgtec.com>
 <20160921132656.GF14137@linux-mips.org>
 <57E2CE5B.8020406@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <57E2CE5B.8020406@imgtec.com>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160922211527.rH1BTbxC4JH0nXFOQrXwYGI00uYbgkSXddIOcHdB0g4@z>

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 11:15:55AM -0700, Leonid Yegoshin wrote:
> On 09/21/2016 06:26 AM, Ralf Baechle wrote:
> > On Thu, Sep 01, 2016 at 05:30:13PM +0100, James Hogan wrote:
> >
> >> Update arch_uprobe_copy_ixol() to use the kmap_atomic() based kernel
> >> address to flush the icache with flush_icache_range(), rather than the
> >> user mapping. We have the kernel mapping available anyway and this
> >> avoids having to switch to using the new __flush_icache_user_range() f=
or
> >> the sake of Enhanced Virtual Addressing (EVA) where flush_icache_range=
()
> >> will become ineffective on user addresses.
> >>
> >> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> >> Cc: Ralf Baechle <ralf@linux-mips.org>
> >> Cc: Leonid Yegoshin <leonid.yegoshin@imgtec.com>
> >> Cc: linux-mips@linux-mips.org
> >> ---
> >>   arch/mips/kernel/uprobes.c | 13 ++++---------
> >>   1 file changed, 4 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
> >> index 8452d933a645..9a507ab1ea38 100644
> >> --- a/arch/mips/kernel/uprobes.c
> >> +++ b/arch/mips/kernel/uprobes.c
> >> @@ -301,19 +301,14 @@ int set_orig_insn(struct arch_uprobe *auprobe, s=
truct mm_struct *mm,
> >>   void __weak arch_uprobe_copy_ixol(struct page *page, unsigned long v=
addr,
> >>   				  void *src, unsigned long len)
> >>   {
> >> -	void *kaddr;
> >> +	void *kaddr, kstart;
> >>  =20
> >>   	/* Initialize the slot */
> >>   	kaddr =3D kmap_atomic(page);
> >> -	memcpy(kaddr + (vaddr & ~PAGE_MASK), src, len);
> >> +	kstart =3D kaddr + (vaddr & ~PAGE_MASK);
> >> +	memcpy(kstart, src, len);
> >> +	flush_icache_range(kstart, kstart + len);
> >>   	kunmap_atomic(kaddr);
> >> -
> >> -	/*
> >> -	 * The MIPS version of flush_icache_range will operate safely on
> >> -	 * user space addresses and more importantly, it doesn't require a
> >> -	 * VMA argument.
> >> -	 */
> >> -	flush_icache_range(vaddr, vaddr + len);
> > I can't convince myself this is right wrt. to cache aliases ...
> >
> >    Ralf
> >
> It is incorrect if there is I-cache aliasing (very rare) and there is no=
=20
> HIGHMEM cache aliasing fix (not fixed). But top tree Linux doesn't work=
=20
> with I-cache aliasing either.

Well its pretty trivial to just use the newly introduced
__flush_icache_user_range() on the user address instead of using
flush_icache_range().

Cheers
James

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX5EnvAAoJEGwLaZPeOHZ6ZBYP/3CgYpCJhmWrVaokcucmAI8I
WWKVJDyWJaxLLL8iR9p7D28+Dx2vlG4H72CNNbkySNdbjh7kC83CGOw0hwb5pHON
4rcSBhOj+CtJDJQRQ9NK746Zv68f++npnow9Y07fT2/3UedQVrlbxZgWJWYYwr9r
YDY+OWKO1ocwGQYbU9sjhU9RHBviLvMYvUGYQU7MZbrMLKWZHh1kBmgPIxqLbsvk
CiCMht0jPvLWY+1HIt9qRrYi32CdhmL4VaAxLtcQnXDLju7V68DwF+knqXfDFrF3
yrtzj9wMxDYOgkaoGU71sBmXjw9g5D6Jlo5RFKjxCvpmI3VHdi75soqfrxMWIhcC
ZSMMXYLpNlXKf3aW6uAt3E8NVwCGgNK3B0Kbd1aFIAFzg6IiNjQKbTt5gDPD5rKs
jhVxlBeU1jtOzFHT4reUuZ811yto5GWNvm2flxQDPbcJeqSS4MAbhAuut/cZDP96
AjvITsLCnEX00S3CQs+yhmuJ9g6XZG44mo0GMOaV12w5u2HwLLmecD5HkOWAfnCY
akujGe4PuwCy9Of/uUfvBI1VeTI9/o4Jeqx5MtmSv01ngKUO0LpZlefYX8wRr2eY
RGNwc0xS16iPZmeD08XSW5rxcbUnYblKFCiXFB7M+eyctDe6GGZ3dd1CHd7E5VfF
fk7cWoHFFY+4/c7yns/q
=v/1L
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
