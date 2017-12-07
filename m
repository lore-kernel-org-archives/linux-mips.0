Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:48587 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990510AbdLGOU01H1Us (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 7 Dec 2017 15:20:26 +0100
Date: Thu, 7 Dec 2017 14:18:29 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH 0/1] About MIPS/Loongson maintainance
Message-ID: <20171207141829.GN27409@jhogan-linux.mipstec.com>
References: <1512628268-18357-1-git-send-email-chenhc@lemote.com>
 <20171207065759.GC19722@kroah.com>
 <20171207110549.GM27409@jhogan-linux.mipstec.com>
 <1512652210.13996.10.camel@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jB+02Y6wHc2pEa2x"
Content-Disposition: inline
In-Reply-To: <1512652210.13996.10.camel@flygoat.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huacai Chen <chenhc@lemote.com>, Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Ralf Baechle <ralf@linux-mips.org>, Rui Wang <wangr@lemote.com>, Binbin Zhou <zhoubb@lemote.com>, Ce Sun <sunc@lemote.com>, Yao Wang <wangyao@lemote.com>, Liangliang Huang <huangll@lemote.com>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, r@hev.cc, zhoubb.aaron@gmail.com, huanglllzu@163.com, 513434146@qq.com, 1393699660@qq.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20171207141829.N76mANzyPD5KbiFQ4Y48Ppfu8rwGJesU6D9LQr7JiAU@z>

--jB+02Y6wHc2pEa2x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2017 at 09:10:10PM +0800, Jiaxun Yang wrote:
> On 2017-12-07 Thu 11:05 +0000=EF=BC=8CJames Hogan Wrote=EF=BC=9A
> > On Thu, Dec 07, 2017 at 07:57:59AM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Dec 07, 2017 at 02:31:07PM +0800, Huacai Chen wrote:
> > > > Hi, Linus, Stephen, Greg, Ralf and James,
> > > >=20
> > > > We are kernel developers from Lemote Inc. and Loongson community.
> > > > We
> > > > have already made some contributions in Linux kernel, but we hope
> > > > we
> > > > can do more works.
> > > >=20
> > > > Of course Loongson is a sub-arch in MIPS, but linux-mips
> > > > community is
> > > > so inactive (Maybe maintainers are too busy?) that too many
> > > > patches (
> > > > Not only for Loongson, but also for other sub-archs) were delayed
> > > > for
> > > > a long time. So we are seeking a more efficient way to make
> > > > Loongson
> > > > patches be merged in upstream.
> > > >=20
> > > > Now we have a github organization for collaboration:
> > > > https://github.com/linux-loongson/linux-loongson.git
> > >=20
> > > Ick, why not get a kernel.org account for your git tree?
> > >=20
> > > > We don't want to replace linux-mips, we just want to find a way
> > > > to co-
> > > > operate with linux-mips. So we will still use the maillist and
> > > > patchwork
> > > > of linux-mips, but we hope we can send pull requests from our
> > > > github to
> > > > linux-next and linux-mainline by ourselves (if there is no
> > > > objections
> > > > to our patches from linux-mips community).
> > >=20
> > > What does the mips maintainers think about this?
> > >=20
> > > Odds are a linux-next tree is fine, but they probably want to merge
> > > the
> > > trees into their larger mips one for the pulls to Linus, much like
> > > the
> > > arm-core tree works, right?
> >=20
> > I'm not officially a MIPS maintainer but I have donned the hat
> > unofficially a few times lately, so FWIW I think the Loongson stuff
> > should go through the MIPS tree, since it so often touches core
> > architecture code.
> Yes we are always touching architecture code. For that part, we'll
> still submit our patches to linux-mips tree. But we're also maintaining
> many platform code under /arch/mips/loongson64 and also platform
> drivers such as hwmon, cpufreq and YeeLoong Laptop driver I'm trying to
> submit recently.

The drivers at least can always go in via the relevant driver subsystem
anyway, though of course if they're tightly bound to arch headers that
could still be painful, as I found out here when trying to fix some
build errors there:
https://lkml.kernel.org/r/20171115211755.25102-1-james.hogan@mips.com

Cheers
James

> For that part, make a pull request might be more
> efficient than apply patches to linux-mips for many times. Just as what
> arm architecture did.

--jB+02Y6wHc2pEa2x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlopTa4ACgkQbAtpk944
dnqLdhAAm2RnarI9DU2tMP0m/B3V5JUgxKdbiIDmLHt3bz3sKSSXH6OS9QGZx5wn
iryJk3EdLVMAnZUPT+x6kU6hlkpEg0AKGYwDgMeD4f8xj1r98Gx1pouw+2DiOI94
eed5HB1P1WhceVbUnG4DA+tAArxEK+zuu14xyoeEPolGbnXQkv1GJVysN6U6nqe6
uXrbadH4pOjtmMbNHIhJbyEy0We9oyJYuX8mYI1xeaPZQCTwM8nXwqRvHJESxWUv
YtVVxm6iUV3apzPpuy5BuLNwf/zjmoPuuoKWVgq4kZ5d248one3uB1WndgoPQdTb
99UtgebxI8JseFqKHiabW3kUYPC8ZRR7+5E5ySPVABsyuLcfuGOxXYBffztLw9W7
rlC8kSSSo4/YFS69vJAIPN4YYorg6PFNOOWSHrcAE1uHlskjPxNqTuCmfhnuZgQ1
f72xJ4YM5y5nkWs3SjGtbrRtqm0hX/elfY2eVI35dcOOylZfuFEZUbWFck4FNeQb
QPf/eQFes6MLI6hdhw/3Bt6xZIUYf6mw2NVS0SAWXHSzP7DdtjQVWAjm5KwBp5lk
BYwzZDFz9SdtUkdRYrGUTOTuyQvMxpug6uAGNMDIDzRS9YJ7CqJmX47apMj/7a8T
OFNDL8nU90V9z1ZkD4T/GHdQ5XOugr0hbMJ/9Dfg41tqllLcUcw=
=VhHH
-----END PGP SIGNATURE-----

--jB+02Y6wHc2pEa2x--
