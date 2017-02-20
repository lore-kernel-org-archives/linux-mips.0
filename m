Received: from mailapp01.imgtec.com ([195.59.15.196]:48146 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992289AbdBTLxhuGQuH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 20 Feb 2017 12:53:37 +0100
Date: Mon, 20 Feb 2017 11:53:31 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS:wrong usage of l_exc_copy in octeon-memcpy.S
Message-ID: <20170220115331.GA24226@jhogan-linux.le.imgtec.org>
References: <1487562178-2901-1-git-send-email-jianchao.wan9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CxIGHgfcyU0Ip7+W"
Content-Disposition: inline
In-Reply-To: <1487562178-2901-1-git-send-email-jianchao.wan9@gmail.com>
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
To: "jianchao.wang" <jianchao.wan9@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20170220115331.9eZqL901AQlnBYY9iY3bONmXJcDt8OuOL7pUI-QrGN0@z>

--CxIGHgfcyU0Ip7+W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 20, 2017 at 11:42:58AM +0800, jianchao.wang wrote:
> l_exc_copy() is usually to be used like this:
> 1 EXC(	LOAD	t0, UNIT(0)(src),	l_exc)
> 2 EXC(	LOAD	t1, UNIT(1)(src),	l_exc_copy)
> 3 EXC(	LOAD	t2, UNIT(2)(src),	l_exc_copy)
> 4 EXC(	LOAD	t3, UNIT(3)(src),	l_exc_copy)
> When the fault occurs on row 4, l_exc_copy will get the bad
> addr through THREAD_BUADDR(), complete the copy of row
> 1,2 and 3, and then return the len that has not been copied.
> l_exc_copy assumes the src is smaller thann the bad addr.It will
> increase src by 1 until reach the bad addr.
>=20
> octeon-memcpy.S use the l_exc_copy with wrong way which make src
> could be greater than bad addr. We will fix it in this patch.
> We add the max offset of LOAD to 15 here to fix the issue without
> adding new commands . Howerver, the side effect is that, when LOAD
> fails in few case, l_exc_copy has to copy more.

Is this trying to fix the same issue as the following patch?

https://patchwork.linux-mips.org/patch/14978/

Thanks
James

--CxIGHgfcyU0Ip7+W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYqti0AAoJEGwLaZPeOHZ6EdAQAJtpCNK4tdtcFrEOzJ7B59WV
9s+xxGGxJAYm6XwtybxX8AAFwnOmUaFX+rA8Tec+GO7q8Km4vgbiC4UMMFd4vV3O
bwn/iQgYLr9vJOhUlUybCMXezCT1vcB9bg22oDWHJkw27vz7f9/x3c1jZvOloPdb
XhKK7x5NYA9HpnLHNx3zeS6mcBEhp1nDHGXAeq23ZVK++K1on1Nic9N385DnzlHP
HIi9/zNF4LjR2dAcrBl2YyV2KAjRyEbDDqmexml1e1rwRlZNr1sEXALti29IHngZ
nB3ame+Yxmi8fQpu0Y5GQKTe1WhO9MIYd1G0KReIq7gSXp9/mRGP3OrOQ+y5g3YO
TSA1SN45u35uK+qXwsvsEC6pyke4p7Zueo8VDZ/je7aEAm+1wOBRkOUTweINTIR1
K75tFtcyNvSRaYK5fOsd+D2LZtCFnIvhuUszajNigBeNOHVrGP9SFYsdRcLz+SEG
PZXJRiwhMMDCjd+C8dkrdVGw5wU/TqyrJFoOzLxirUkaIRCX99m59nIRLOpQ091v
noIeBIZeApZWUmE5876OGLLc4I9uzb8ejQ/MuiBDOH9MAd/YkrXcGt9yuEqIFgX/
NxOaUOqHn03n7H2iyUMYc61Vrv/zyudaB8WWZJ91GXrOZ/AaaEUa693Gxz/XAlU0
E83mVvIeGYz45AayIQxL
=ys3w
-----END PGP SIGNATURE-----

--CxIGHgfcyU0Ip7+W--
