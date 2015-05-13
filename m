Received: from mailapp01.imgtec.com ([195.59.15.196]:9553 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012138AbbEMWUBCunRL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 14 May 2015 00:20:01 +0200
Date: Wed, 13 May 2015 23:19:56 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 1/2] MIPS: malta-time: Don't switch RTC to BCD mode
Message-ID: <20150513221956.GE7723@jhogan-linux.le.imgtec.org>
References: <1431519473-24049-1-git-send-email-james.hogan@imgtec.com>
 <1431519473-24049-2-git-send-email-james.hogan@imgtec.com>
 <alpine.LFD.2.11.1505131829580.1538@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.11.1505131829580.1538@eddie.linux-mips.org>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150513221956.JpnjuJWZqcZmEkGsJFiDwd8Pd76lR1Q2RvJXKCWh2cI@z>

--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

On Wed, May 13, 2015 at 07:03:51PM +0100, Maciej W. Rozycki wrote:
> On Wed, 13 May 2015, James Hogan wrote:
>=20
> > On Malta, the RTC is forced into binary coded decimal (BCD) mode during
> > init, even if the bootloader put it into binary mode (as YAMON does).
> > This can result in the RTC seconds being an invalid BCD (e.g.
> > 0x1a..0x1f) for up to 6 seconds.
>=20
>  Sigh.  No sooner I had fixed the breakage (with 636221b8 and a fat=20
> comment) it got put back (with a87ea88d).  Even though it's easily=20
> spotted as it breaks the system time (all the fields, including the date=
=20
> too, not only the seconds!) across a reboot due to YAMON eagerly=20
> switching the mode back.  And that'd be the first item I'd check when=20
> validating a change touching the RTC.

Indeed, a quick bit of experimentation confirms a discrepancy before
this patch is applied before YAMON's "date" command and the RTC clock as
read by Linux (with year, day of month, hour & minute all going 22 -> 16
(22 =3D=3D 0x16), and presumably different rates of time depending on which
mode its in. After this patch it appears to work again as it should.

>  Is there an actual need to reinitialise the RTC at all?  The RTC=20
> registers are readable, so the current configuration can be obtained,=20
> the RTC driver copes with any valid arrangement, so can any other code=20
> using the clock as a reference.
>=20
>  YAMON OTOH is not as flexible, its clock management commands expect the=
=20
> format the monitor itself set the chip to, so I think the kernel has to=
=20
> respect that (just as it doesn't randomly flip bits in the RTC on x86=20
> PCs for example).
>=20
>  So unless proven otherwise I'll ask for `init_rtc' to be dropped=20
> altogether

I suspect it comes down to what U-Boot does with RTC (possibly very
little), but I'll leave that to you and Paul to discuss.

> and any changes required made to `estimate_frequencies'=20
> instead.  Which I believe you already did with 2/2.

As long as the mode doesn't get changed, my change to
estimate_frequencies() should be happy enough. Before patch 2/2 it only
reads UIP flag to try to time a single second, so it shouldn't have
cared about such details as the RTC mode.

Cheers
James

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVU84MAAoJEGwLaZPeOHZ6RHsP/jQ7nADtTW2poxrxlXpyyYRl
5c6efRwbHJwtyF7lb5uYU+0S72mDBP/0RZ4mpb8k8GX5wFfYSXAbrAah8cP1NQKo
LM6Pc9nfdl23uC7MKocRZcUi7FFkmMrbCOiDX7Og6CPRlfktFkUmis/HMBte9MOO
hXDLEdNasYF8CsLT9qiiGZuRN4/18+0JKyBt8nAr8DB7mIg/Y7MsQh3SECa6BVZJ
UtT4cXyPWnV7EAHRuDhDtB6rwdCKObCxZDwkWtQO5/m4P3kRhlSsmNSyE2WDkXQP
ic9r39h+Ti0rEZyd+3UEGrN1WO+AG5EzGVITtEDxTdIut+AkyYFM5imOPZmlsNQ3
dSSgQC07X/Io1oPhWZaBRUDVwIqlJLGf+kWk0duRYz4Dsn+FvmZy2wkE1+d4oEdO
cZxn6WHLlBa2znarGw/LTeQcg8d9LVEn1eEi7hfmwlx/q1AjQxZFIcgmSnhfGDOj
2FlXPLkHLRBYg1Akn8AMMrf8LAYsKWq0zyYpCyEEtCjzeDkKsFpTixe7MuZvxn6l
zq0PgvxtdjBTfeqf+brvghwd7LjRG1V+XkCoYvYW40zcmsbrVEIn4+KiEvlQuFdN
9xV0lXAloj0SZSm+Dg19NR27h64xUzhR/o/+BA4GoAK6fqsba9q2AwdX0Z6arb0U
PCH95HNorZfZXKifYWpY
=JvN4
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
