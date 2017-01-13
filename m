Received: from mailapp01.imgtec.com ([195.59.15.196]:41298 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992078AbdAMJtpa-0iM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Jan 2017 10:49:45 +0100
Date: Fri, 13 Jan 2017 09:49:39 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v3 0/5] MIPS: Add per-cpu IRQ stack
Message-ID: <20170113094939.GI10569@jhogan-linux.le.imgtec.org>
References: <1482157260-18730-1-git-send-email-matt.redfearn@imgtec.com>
 <CAHmME9pRnCW5875vL=mr_D0Lq8nPZ69L-7gVaaHuO7EMTBp6Ew@mail.gmail.com>
 <CAHmME9ogK=NsWgks2Uarty5AeWSZuYmujjBovQO6FWAAXKsopQ@mail.gmail.com>
 <20170111012032.GE31072@linux-mips.org>
 <CAHmME9qXeO=qFvWXenVO6gVAftk1M2vdQt7nwABRDqvDcV3dPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HkfZ6fDZyisrdUtK"
Content-Disposition: inline
In-Reply-To: <CAHmME9qXeO=qFvWXenVO6gVAftk1M2vdQt7nwABRDqvDcV3dPg@mail.gmail.com>
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
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Matt Redfearn <matt.redfearn@imgtec.com>, linux-mips@linux-mips.org, Thomas Gleixner <tglx@linutronix.de>, Paolo Bonzini <pbonzini@redhat.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Chris Metcalf <cmetcalf@mellanox.com>, Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>, Adam Buchbinder <adam.buchbinder@gmail.com>, Paul Burton <paul.burton@imgtec.com>, Jiri Slaby <jslaby@suse.cz>, "Maciej W. Rozycki" <macro@imgtec.com>, Aaron Tomlin <atomlin@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20170113094939.DSU8DOsNOxoePPEOh_9bqoaxrUMHJaYxIZ-ThlThWU8@z>

--HkfZ6fDZyisrdUtK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2017 at 12:32:52AM +0100, Jason A. Donenfeld wrote:
> On Wed, Jan 11, 2017 at 2:20 AM, Ralf Baechle <ralf@linux-mips.org> wrote:
> > On Wed, Jan 11, 2017 at 12:32:38AM +0100, Jason A. Donenfeld wrote:
> >
> >> Was this ever picked up for 4.10 or 4.11?
> >
> > Still sitting in -next as commit 3cc3434fd630 and its four parent commi=
ts.
>=20
> Oh, good, so it's progressing normally. I just didn't see any
> acknowledgement on this thread so I was worried.
>=20
> Can this propagate to stable? A few OpenWRT MIPS people are
> complaining to me about sporadic crashes when stacking too many
> virtual network drivers (batman over gre over ppp over ...), which is
> solved by this patchset.
>=20
> Jason

Its quite a significant change/feature, especially in terms of potential
for further breakage. I don't think its really stable material to be
honest.

The actual stable kernel rules are here though:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docume=
ntation/process/stable-kernel-rules.rst

Do the OpenWRT issues affect mainline kernels? (if its due to excessive
stack frame sizes in out of tree code, then that should be fixed out of
tree). It sounds bad if the kernel stack requirement can be made
arbitrarily large by stacking too many drivers.

Is there a simpler fix/workaround for the issue that would satisfy
stable kernel users until they can upgrade to a kernel with irqstacks?

Cheers
James

--HkfZ6fDZyisrdUtK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYeKKeAAoJEGwLaZPeOHZ6UxAP/2R/TOh5d017b02J/480VvMH
qkJIUFpW1d7GvniS2ruUDUQchtZkqoGIHHI3oXiWjvIAWnXPha1jzL3QVPFQCwpd
+yWhG3mQbhhyTkEVDbk4ISsLUixIzxJRjBuqecnIkZfOXUrLNI5QyJ4E4ysHepYQ
ALoPK6V3wOBqStut7dMYWCk/Py2iMpmgdyUxekHNimp6k+nrb3LMsJGnFmCsATet
sNwsvLNlEgiLOkAauGgJAjWbHNtX7yD77Yjo5eJ+1hmViuhsOu4XIy/yAtYskdwl
EGxhlS9xd+5xHuNEIZX7+CXgQh0UMZneKV6YMM63aByhKpkIIrLke/IH28xSgi/w
ZfCuSu7MpPZFXLIhohc2dfhhtjN4e6Ti6XwhTFj2TmatKtU8AKK77HupXCSQI4Ic
y/54c+NMkMVq/lBLYXPNxoM9SYDsAjBrgJaDaZPECvX0WCn6LUokFkh7dh/9DNwR
f1ipw/cl9wex3MN6K9OXSLXObRdShZrzdarX08DtlK5tWkZb2OS1acQfbndjpxq+
94C/lbudwrIHw5kr8J3xnfxOqdVv7R+AYuUwbkD80pHyLek3TQ1TAn1/COk3UD96
aMMnPt7KL+dSaoD1NulEOtOftxs79BZ2iJarL4wMfJYwqaXelU4DuOGHGYzKibRq
X+lIXy3xXe+qIkMrNAk0
=PhbQ
-----END PGP SIGNATURE-----

--HkfZ6fDZyisrdUtK--
