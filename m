Received: from mail-pf0-x241.google.com ([IPv6:2607:f8b0:400e:c00::241]:55172
        "EHLO mail-pf0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990901AbdKNWt1e7TM1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Nov 2017 23:49:27 +0100
Received: by mail-pf0-x241.google.com with SMTP id n89so15513542pfk.11
        for <linux-mips@linux-mips.org>; Tue, 14 Nov 2017 14:49:27 -0800 (PST)
Date: Tue, 14 Nov 2017 14:49:17 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [net-next,1/3] netem: convert to qdisc_watchdog_schedule_ns
Message-ID: <20171114144917.66f0047c@xeon-e3>
In-Reply-To: <20171114211112.GA28794@jhogan-linux.mipstec.com>
References: <1510088376-5527-2-git-send-email-dave.taht@gmail.com>
        <20171114211112.GA28794@jhogan-linux.mipstec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.mqhecnEQbKr_PrIAjZI4vC"; protocol="application/pgp-signature"
Return-Path: <stephen@networkplumber.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@mips.com>
Cc: Dave Taht <dave.taht@gmail.com>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171114224917.0IjQYSxJdKxhPtmz9yKxRleBcIxuAY53j4p6-2kFPrE@z>

--Sig_/.mqhecnEQbKr_PrIAjZI4vC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Nov 2017 21:11:13 +0000
James Hogan <james.hogan@mips.com> wrote:

> On Tue, Nov 07, 2017 at 12:59:34PM -0800, Dave Taht wrote:
> > diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
> > index db0228a..443a75d 100644
> > --- a/net/sched/sch_netem.c
> > +++ b/net/sched/sch_netem.c =20
>=20
> ...
>=20
> > @@ -305,11 +305,11 @@ static bool loss_event(struct netem_sched_data *q)
> >   * std deviation sigma.  Uses table lookup to approximate the desired
> >   * distribution, and a uniformly-distributed pseudo-random source.
> >   */
> > -static psched_tdiff_t tabledist(psched_tdiff_t mu, psched_tdiff_t sigm=
a,
> > -				struct crndstate *state,
> > -				const struct disttable *dist)
> > +static s64 tabledist(s64 mu, s64 sigma, =20
>=20
> sigma is used in a modulo operation in this function, which results in
> this error on a bunch of MIPS configs once it is made 64-bits wide:
>=20
> net/sched/sch_netem.o In function `tabledist':
> net/sched/sch_netem.c:330: undefined reference to `__moddi3'
>=20
> Should that code not be using <linux/math64.h>, i.e. div_s64_rem() now
> that it is 64bit?
>=20
> Thanks
> James

Not really since random is only 32 bit, the sigma value being 64 bit makes
no sense really.

--Sig_/.mqhecnEQbKr_PrIAjZI4vC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn2/DRbBb5+dmuDyPgKd/YJXN5H4FAloLcu0ACgkQgKd/YJXN
5H6Gew/6A/eZ8FnXQLRCZzlYMeJqz3Bl4b0C4HuUYsEZhSZMyu+TTIJyjhpk4tau
D+VkwNtaOc0J6GmKbvWkb20n08RjN1xAZuNWxL+ohjdLE9SrvMIPzrs+PFiqow8d
ApL8cOsZFnbuha/ncPyXELf5z8xbDPWIJLM0dh07esNy93ZVMKq6slqjAScinJwE
/3iW3Ad5XYuC0PxpeodwtswDVxnXhy5zZqZDz26kxQ93eWk1+8biO6vLOTEKuk3J
jZ0l2r2Lc3npDYO7V6uE/ZRRlyTHULuF28KnrWCKUDuv1FkH2ITNoFeu90BuTT3y
wzMbqp3e3Z9A0fN6etffh6qPN8gmV3KwiIhzeYd6t6CMwQLH6XVDOxp2W8mic4UK
UsItxhRDSTv2mRV/PnJmfF6V27MO47XpnD48X0H0iWyxaBmmwgewrpuOlkXlDHxa
IHxdRfGaglS2U/jxus34T24zFJpyvt6+fjohpMrwq+LW78OLZJm/Y8nzMQ/T1yem
Y7JD+E20evAjRiZB9hk5RgfqtLfwNf4vXgh8vK72e5CVZIKUCQpZV51bx7ZC9Ob4
teBfuyJ4s4iv+4uvXG/PeYYxHDgC0WPVuo7+Gxz+/76ghQvL7F4VY97YlhQCGiat
EEEfDHtrDrAJJQ/NMUUCsD9T8cSAHr41YdSGbBqKwpEzSEZunos=
=oJr8
-----END PGP SIGNATURE-----

--Sig_/.mqhecnEQbKr_PrIAjZI4vC--
