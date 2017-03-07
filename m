Received: from mailapp01.imgtec.com ([195.59.15.196]:37546 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990720AbdCGJi41mSjH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 7 Mar 2017 10:38:56 +0100
Date: Tue, 7 Mar 2017 09:38:50 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v3] MIPS: Fix build breakage caused by header file changes
Message-ID: <20170307093850.GD996@jhogan-linux.le.imgtec.org>
References: <1488827635-7708-1-git-send-email-linux@roeck-us.net>
 <20170306232019.GG2878@jhogan-linux.le.imgtec.org>
 <20170307073805.GB15693@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J9fO++IT6debZ01Z"
Content-Disposition: inline
In-Reply-To: <20170307073805.GB15693@gmail.com>
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
To: Ingo Molnar <mingo@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Ralf Baechle <ralf@linux-mips.org>, Herbert Xu <herbert@gondor.apana.org.au>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20170307093850.epaXk_sKY_-quEv-WRP2SEae6C1ht6TQB8kvx_a9npM@z>

--J9fO++IT6debZ01Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, Mar 07, 2017 at 08:38:05AM +0100, Ingo Molnar wrote:
> Just a quick question: is your MIPS build fix going to be merged and sent=
 to=20
> Linus? I can apply it too, and send it to Linus later today, together wit=
h a few=20
> other sched.h header related build fixes.

One for Ralf...

> Assuming it's all properly tested - my limited MIPS defconfig builds work=
ed fine -=20
> but MIPS has a lot of build variations.

If you have a branch with other generic fixes I'm happy to push it to
our MIPS buildbot too to double check.

Cheers
James

--J9fO++IT6debZ01Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYvn+qAAoJEGwLaZPeOHZ6jhYQAIazmb5KUyKwsPHaUuCEm5vr
WIkKsp/4qUBHEpeJguEv38g9BPfbboUP8Z/xx6eIGGY+zktFOaS9ur5z4kSEETHR
cLdu09CRTT2QJoI3vbh7r5HofYMctN+vx/mBEHB/WsMlLEQFB0+PxH2+fZ5ixaUk
HOuVCSs/dCWJpxZ4mbIHPcNFP8ugCgrdPF30xN91eMGaYF5juMRbzUxScReWjERY
nqhnp+PriaBPXJ3zTIIf462lX1SdvmzLF6fHC7VeCZZpKcuS9XP2UENg4QFwXgjW
UhYdrkuJ65Sg1tvvIN+4asp5cPiFpTxrAotIbcI9w4aDcKW6bGHcaYfrzwOKJRgI
Pe6zh04FVPek6gnCjVAZrhnGuCgDdp7csloz9AvCTDCARqCQ/4OUG5nzofsbN0d4
lUjS/AS3giBXOTH/ce05i82dnfJuli4ZVgEYDqt6XxMhVO6fVXNjgcjS8UNoeHme
JpRP67p4i17Lhfcr6FC5vFsfP6U3PrlmWeM7ik/bl1D4P8kCCHm9hbt5DrekQHRv
AUnmjFm4xZeQW7qmIF2dcdJ+zyPgUMMRYl9N4bilKZHtblpxHEe6HLsTMH+gWMox
sax6f9uDWQzvc6G4VEd7SXFo1bUxLaBVcmu/bLcu4q6yefD6a6CXICgHCvyV8Jn9
P3z1CCYJ0FeJZa6K2brY
=8YSQ
-----END PGP SIGNATURE-----

--J9fO++IT6debZ01Z--
