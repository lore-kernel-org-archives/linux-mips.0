Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:35235 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992692AbeABNkNCBsT2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jan 2018 14:40:13 +0100
Date: Tue, 2 Jan 2018 13:39:45 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: Loongson64: Drop 32-bit support for Loongson 2E/2F
 devices
Message-ID: <20180102133944.GO5027@jhogan-linux.mipstec.com>
References: <20171226042138.13227-1-jiaxun.yang@flygoat.com>
 <20180102084759.GL5027@jhogan-linux.mipstec.com>
 <1514899786.1694.6.camel@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l4IMblsHEWQg+b+m"
Content-Disposition: inline
In-Reply-To: <1514899786.1694.6.camel@flygoat.com>
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
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Huacai CHen <chenhc@lemote.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180102133945.JQb5bfu8wsBqUZUTUN4atgXEfM4t3dAPh-Er2Nf9NcY@z>

--l4IMblsHEWQg+b+m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2018 at 09:29:46PM +0800, Jiaxun Yang wrote:
> On 2018-01-02 Tue 08:48 +0000=EF=BC=8CJames Hogan Wrote=EF=BC=9A
> > On Tue, Dec 26, 2017 at 12:21:38PM +0800, Jiaxun Yang wrote:
> > > Make loongson64 a pure 64-bit mach.
> >=20
> > Please expand to provide some rationale behind the change. Was 32-bit
> > support broken at runtime, or broken at build time, or are we simply
> > no
>=20
> The 32-bit support was broken at runtime, it doesn't boot anymore,
> witch is hard to debug because even early printk isn't working, also
> there are some build warnings. Some newer bootloader may not support
> 32-bit ELF. So we decide to drop 32-bit support.

Okay, please put that in the commit message so that somebody digging
through the history later (perhaps summarising what is new in the next
release) can understand the *why* as well as the what.

Cheers
James

--l4IMblsHEWQg+b+m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlpLi6AACgkQbAtpk944
dnoeMw/6A3VTDVgKw0mKGZeyhJl82QQZ3eE+n06u4iRDNxB+bEoluGpbmm9NEv75
U9EB9GymoOCA0dZLlX5qI4aStZuMgHKzZo+QQQX1ADHOJfpfncG+Y8nwlPTENLPh
Fk0wYylBUgFoRq7DaC3yOF/LqM5z9pjo9WSq7qK4nixedtGzjkXhh+hOwXhSfUEh
/Ufsu5Yg7KMcmoUG6Z3KIOV6ZwqhnLw2bKLez9Hw7L29oSPECww5LgChaY3NftLR
brJlYqMQNabnPLUM9kAtNhhdbDvoEt+25C9XuNFX6ED8XxMRmo2bU2OY94cQ6tDw
HXTvsY5EoRUShVUwiGiSQpMC+QrKqcaPQv0le7J2YPB5Poe5s3aIsWz9AKSF9W7S
i06vVum23fTcj34EYay3Rbr2z+hRqIqmA753EU/NvVzGGzWtSH26oMS3mSb8YqmN
ecj9Mak1SW4RbYn7UxpoNfdfciQPdcYFqPeEEftG0hWU4pn/Qa0VXmHsBinCEt2v
j77nJjoogBxNbCvOh4btyVSPDwM3HXOXQYoApWP4GtbBSbO927J2nxeG91WI/PMt
prG92AFRJwAg+yk1HUoxETLB0XBf+CABOZ/2FeqMA/Tuura3NylDxeWWJODZdTzE
oFn9ahwaaNPt6RahBlTATjjdRpPJQAyJBz6IB4F5RqeiUgiawUs=
=l6v8
-----END PGP SIGNATURE-----

--l4IMblsHEWQg+b+m--
