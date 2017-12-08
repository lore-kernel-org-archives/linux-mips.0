Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:34977 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990431AbdLHHwzxHM4p (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 Dec 2017 08:52:55 +0100
Date: Fri, 8 Dec 2017 07:51:35 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH 0/1] About MIPS/Loongson maintainance
Message-ID: <20171208075134.GP5027@jhogan-linux.mipstec.com>
References: <1512628268-18357-1-git-send-email-chenhc@lemote.com>
 <20171207065759.GC19722@kroah.com>
 <20171207110549.GM27409@jhogan-linux.mipstec.com>
 <1512652210.13996.10.camel@flygoat.com>
 <20171207141829.GN27409@jhogan-linux.mipstec.com>
 <1512705706.1756.12.camel@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f6M9UaX53EEZorp0"
Content-Disposition: inline
In-Reply-To: <1512705706.1756.12.camel@flygoat.com>
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
Message-ID: <20171208075135.KPXikGYSSz_dSBOcKMB3xJq-yXCkky0J5AtRB0THntU@z>

--f6M9UaX53EEZorp0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2017 at 12:01:46PM +0800, Jiaxun Yang wrote:
> Also we're going to separate code between
> Loongson2 and Loongson3 since they are becoming more and more
> identical.

Do you mean you want to combine them?

> But It will cause a lot of changes under march of loongson64
>  that currently maintaining by linux-mips community. Send plenty of
> patches to mailing list would not be a wise way to do that. So we can
> PR these changes to linux-next directly and PR to linux-mips before
> merge window.

For the avoidance of doubt, a pull request would not excempt you from
needing your patches properly reviewed on the mailing lists first.

And quoting Stephen's boilerplate response to linux-next additions:
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window.
>=20
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and
>      * destined for the current or next Linux merge window.
>=20
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Cheers
James

--f6M9UaX53EEZorp0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloqRHIACgkQbAtpk944
dnrU8xAAqTDR2+6cqkK6KwIyBfqaqrBm4A7SY5j2UA86HNzVDjEFO3Xs2vrjyinr
n+xmqGDp8rrL+hEq6u3I3D/VhBwZIoZHnzG8Rn4wrraF8Wpsu50ggiqqLfKve61g
WmInTkYX/L+duu5BM98Tc9h8HgDMekjonvJSQZlitVQKl4Alw9r9LuL+Hj6Vu5X0
1iiAroPsQ69qz5ebIEmSRsURRN1ZoxlIWDNEjasNR5on0u5gFZAdYOL5rEAHrwaF
zInK/S5SVdO2ucBi5HkIfM2qSfxpTY05OxzReZTunqMxeE8hMEnMwSREzfPDHf3+
WBWLr25ecCGey1oeqDVNj7atZfDSw4JQ9qaqTl7FvZdmYcOH1uOITghvAjiQuBPs
7hnhXa/yEBFOhqU9WOsH6mgxeaYFlyarKm8x6xP7I9XpvBTh8ZWDImJ6Si1BjAkp
Bwo1cEPuUhaQKoKIST3HZT4fXYUt57YItFcAGmmBub+KSqaNp/IaaLmW9fcZB8mP
CuZl9nmdzWQQeVdITw/vqHwRGIgDczzK6YZpX44GLfkKsJfQQrAJ74yXZ4ECrhQS
gdSah8O0dXLyllRrmb7ukseRZb+Feor1nvELUm/nHwLZGUMhcOT2i7unCMlI0y8U
vK8HakzU7XWrqYzSzTcXeE7arePtHRcwwytD59k6xQeG7chHfto=
=8aNB
-----END PGP SIGNATURE-----

--f6M9UaX53EEZorp0--
