Received: from mailapp01.imgtec.com ([195.59.15.196]:25311 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993920AbdGFOJSNgFhn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Jul 2017 16:09:18 +0200
Date: Thu, 6 Jul 2017 15:09:12 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v2 2/4] MIPS: VDSO: Add implementation of clock_gettime()
 fallback
Message-ID: <20170706140911.GG6973@jhogan-linux.le.imgtec.org>
References: <1498665337-28845-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1498665337-28845-3-git-send-email-aleksandar.markovic@rt-rk.com>
 <alpine.DEB.2.00.1707060055470.3339@tp.orcam.me.uk>
 <20170706090553.GO31455@jhogan-linux.le.imgtec.org>
 <alpine.DEB.2.00.1707061405410.3339@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Xv6Km4yt4judTFSp"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1707061405410.3339@tp.orcam.me.uk>
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, linux-mips@linux-mips.org, Goran Ferenc <goran.ferenc@imgtec.com>, Miodrag Dinic <miodrag.dinic@imgtec.com>, Aleksandar Markovic <aleksandar.markovic@imgtec.com>, Douglas Leung <douglas.leung@imgtec.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Petar Jovanovic <petar.jovanovic@imgtec.com>, Raghu Gandham <raghu.gandham@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170706140912.xg6DbFfTbR0s6qSATkiV93bIQGdlKUZeAIoVRSOYQho@z>

--Xv6Km4yt4judTFSp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2017 at 02:12:37PM +0100, Maciej W. Rozycki wrote:
> On Thu, 6 Jul 2017, James Hogan wrote:
> > > (and would have to forcibly use the 32-bit encoding in the microMIPS
> > > case)?
> >=20
> > I don't believe there is a 16-bit SYSCALL encoding in microMIPS, at
> > least I can't see one in the 5.04 manual.
>=20
>  I referred to the preceding instruction, presumably LI, that does have a=
=20
> 16-bit variant in the microMIPS instruction set.

Ah yes, I see what you mean.

Hopefully microMIPS support is new enough for that not to matter.

It appears that the restart behaviour was improved in v2.6.36 in commit
8f5a00eb422e ("MIPS: Sanitize restart logics"), whereas first mentions
of micromips are in v3.9, in commit f8fa4811dbb2 ("MIPS: Add support for
the M14KEc core.").

Cheers
James

--Xv6Km4yt4judTFSp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlleRHsACgkQbAtpk944
dnr5YA/+NYnq2IOaUfnAk8+buZjf3Z1yYRGYKiiB3bygfEBpxge9mb++d5J2olOM
tA15j9aNiqyZ8RRoV8sVwkbXQliwjMbiRdnc+zCMVJZGTIfkq4nLY/Eh4aG0Hg7D
lx1UGBDixpB9/RcuOsKbDwms8jnaRKgFsCQ+JEKotAmdrYcYN7K4kesnIPxWTpYy
o4J4/pVLUIF5s46okSNYQf2pPH7IV8JYbqt5ls9seKwzVcReb99BpaNF1uhE2vEE
8IxOntJkbUjk7QtF7cRm4Ao/LWc4fVh+c/ZkDpa2TMRkJw1I4QEYCY3n5RAi7IAe
YG7xq9RsjAG1ec/CYklAguXw3Rz8QJM+vF4zmVOBhCBecKMEu0jXJVR+R5nmj+oM
/W0lppuRbWhYti3Nub5f6WPKQHvpnRCYZ9/h5uo4Hws4QKrxEOWPwjXVpO3/LbJR
Y3sYN5yU4F8BjXSZeBpj4DChK2MGkZ5f+w19yDBEpxARr2wnuIOQ7sF9dF6k5fL2
KC+zJhOD0vueWmvI5fIpgSCRZSZKyHTs8iAFr1EZFSGR9Sf87kazfcC180Mc1DKh
ZN1ts1Vb5e2g5lGdamNRkEEelScRUR2gjSXedw80zBdrIBM+HyuA2zdMX+MvXTli
IT6FyXxrZiyShYQCApW/OkBiA5r1I/Bcrchfxe5eMt9pu0MFZbo=
=qOWk
-----END PGP SIGNATURE-----

--Xv6Km4yt4judTFSp--
