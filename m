Received: from mailapp01.imgtec.com ([195.59.15.196]:10738 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011396AbbAULkleo4e7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jan 2015 12:40:41 +0100
Message-ID: <54BF9032.7000605@imgtec.com>
Date: Wed, 21 Jan 2015 11:40:34 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC v2 28/70] MIPS: kernel: cpu-probe.c: Add support for
 MIPS R6
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com> <1421405389-15512-29-git-send-email-markos.chandras@imgtec.com> <alpine.LFD.2.11.1501202227140.28301@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1501202227140.28301@eddie.linux-mips.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="Kw3vxawpNdan7QuPLNjvJfWFQlrDwQ90J"
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>, Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "David Daney (Cavium)" <david.daney@cavium.com>
Message-ID: <20150121114034._7ukVLiu2qO7yAfvd5yZgdtwxdc2cyPUy9ZTD9ZE9w8@z>

--Kw3vxawpNdan7QuPLNjvJfWFQlrDwQ90J
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

On 20/01/15 23:32, Maciej W. Rozycki wrote:
>  As a side note I can see that as from a96102be, ISA flags are inclusiv=
e,=20
> so the macros in <asm/cpu-features.h> can and I think should be rearran=
ged=20
> and simplified.  E.g. (indentation adjusted, we can afford it now):
>=20
> #define cpu_has_mips_2_3_4_5	cpu_has_mips_2
> #define cpu_has_mips_3_4_5	cpu_has_mips_3
>=20
> #define cpu_has_mips_2_3_4_5_r	cpu_has_mips_2
>=20
> #define cpu_has_mips32		cpu_has_mips32r1
> #define cpu_has_mips64		cpu_has_mips64r1
>=20
> #define cpu_has_mips_r		cpu_has_mips32r1

this isn't always the case. Although set_isa will do the right thing,
some platforms override these in exclusive ways, e.g.:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch=
/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h#n49

David on Cc in case he'd like to justify that. IMO it seems wrong.

Cheers
James


--Kw3vxawpNdan7QuPLNjvJfWFQlrDwQ90J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUv5AyAAoJEGwLaZPeOHZ6TtwQAKQHzCKmaFZ5+c6U4CzeVW9w
jJKPmZPkXDpH0WtZtL1Dylhn0I6RQb6x4F341aRAob8X9P4scnKrvuk2vS9Dsba4
tfSoFi7L/KscLNFpxLS7XPy23iWDIWKTlugoLuZGkE15MZaowKPoZz4+21RvvNlM
l5vM08MleOWlrLous+kNywhe1E0ZUbyu9p0epW5aBxk07rehVtEuauHCU6dY3eu/
7jjIcY4yMG3F3wl5lhjjFEojpmi1RO2kmEl1jB5udTITDQY/CHuYuHPkbgeBksUW
TJIOzncYKDBo9wKCfvDvPaqvfc+tlW7ATGGi6RaNeRqXh9sIatI8Lp5anhh8LsS2
NQxKRwTRPqFH2Lxw+REuZXojHqceGQrTGT8lbw2noR42RU7bjiPPFu25LNzl1MZz
rzkGAzJMkB3snn1y56g/XUw1QxMLTPzmAqoCWYPM76DrQ7KBb75vjqEOyYPdRapr
f9MV+jELJ4oXwW/iW6aRQ8HTWeTiQNIh403G4C7sUe2Lel2gVd4fIkuDSkf1bEb9
+MHurPxfamM58d6RyQz1LIQJJOy9LzG++cZuk76GT6PACC3ZIgHYyOjmNhEdhgi7
Umm3bnlnENgY22B6IFSlTX0JCm4WceqRlZLMccV9UuZ4uI6wmPZZ/dWRFRS/Qlpj
lg1GtvoyCE3evZULIoFo
=rlIN
-----END PGP SIGNATURE-----

--Kw3vxawpNdan7QuPLNjvJfWFQlrDwQ90J--
