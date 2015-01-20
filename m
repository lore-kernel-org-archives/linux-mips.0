Received: from mailapp01.imgtec.com ([195.59.15.196]:37758 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011100AbbATJOWVHFTr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Jan 2015 10:14:22 +0100
Date: Tue, 20 Jan 2015 09:14:15 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH RFC v2 27/70] MIPS: kernel: cevt-r4k: Add MIPS R6 to the
 c0_compare_interrupt handler
Message-ID: <20150120091414.GA23188@jhogan-linux.le.imgtec.org>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
 <1421405389-15512-28-git-send-email-markos.chandras@imgtec.com>
 <alpine.LFD.2.11.1501200110040.28301@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.11.1501200110040.28301@eddie.linux-mips.org>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20150120091415.5CRICWT-OKepQ69FeKLHdQ6AzYSF_kTnh1PkS8EwnV4@z>

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

On Tue, Jan 20, 2015 at 01:22:24AM +0000, Maciej W. Rozycki wrote:
> On Fri, 16 Jan 2015, Markos Chandras wrote:
>=20
> > From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> >=20
> > Just like MIPS R2, in MIPS R6 it is possible to determine if a
> > timer interrupt has happened or not.
> >=20
> > Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> > Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> > ---
>=20
>  While a preexisting bug, this is simply not true, there's CP0.Cause.TI t=
o=20
> examine for a timer interrupt pending.  Please fix your change to use=20
> `c0_compare_int_pending' instead and synchronise with stuff posted by=20
> James (cc-ed) at <http://patchwork.linux-mips.org/patch/8900/>.

I'm not sure I follow what you mean. This change makes it treat r6 like
it treats r2 (i.e. there is still a Cause.TI bit), which sounds correct
to me. I'm guessing cpu_has_mips_r6 doesn't imply cpu_has_mips_r2.

Cheers
James

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUvhxmAAoJEGwLaZPeOHZ6M5wQAL2xVd0LYrRgejVtBm0vtWQE
CVWI1ab+ERiMzyVCD4a9vMrvgUnwENDs8qLDRMjw2Swbk3y5EiP8tj0Xd2mlWRIn
YuYHO65xP1z0HtIQ2carhA68WquemUh+K8ZUa3Gj/aBlTxAQailmbtSAlBsbFZ0w
eB/K1CikZRkfOv/3+s2iwTlL0P9To63FA4/ZQvgUPsOj8/hkmPbz1/Abfserfi97
83TH7vt7rjwZMbXdSOsHPzxydQXwQm9evBVQvftPF0UQT5TRKDCNLLJCXHndA3kP
0aTsfH2gPNB06Gn1gecZY5JZhz3ppRB1hMvt69TBGZ+F2WvOoGV/yZ87/KdWqXe3
6j1eUYr8bGQm9YW7fflF9Z7Jx9PqyDbKlpsc8XcW1XTdNW6pwMQcKr9tvQpyNE0A
5fclY1ndkSY5EMYZmKmp4Fm5Zl9elw88FwSzjJz0VtVrPVMo+rieucaIlSBikPre
tHI9dg0rMJmxnh4/1oLYjZ42R0CmsUk2dhLhooa4Iv9VcUuTe0ML74E1lbcf1Q20
Mzoyu69a4I4c9IZGRLIatd7jvcOAlpQcIpqQP5AL6ym8uLnOfveHdmlvwB0QT0Rf
bwgjJyGpmUgOhhroceSw7G6t1nayeSpUEzkgxzR7U9RSvKbDSSYHV8Me6lH4JFC2
Q4Hlg8aS9O3ezA2/us/O
=V5u6
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
