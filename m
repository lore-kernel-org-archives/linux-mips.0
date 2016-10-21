Received: from mailapp01.imgtec.com ([195.59.15.196]:55875 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23990513AbcJUHp7BKa-F (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 21 Oct 2016 09:45:59 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 0/6] MIPS: Use thin archives & dead code elimination
Date: Fri, 21 Oct 2016 08:45:47 +0100
Message-ID: <1724594.nvOo2qz5cT@np-p-burton>
In-Reply-To: <20161021115147.0f6eea51@roar.ozlabs.ibm.com>
References: <20161020202705.3783-1-paul.burton@imgtec.com> <20161021115147.0f6eea51@roar.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23477701.SVBATBIGA1";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161021074547.058hhoItN7rJQVtuvUxq4NHB9yIoWYE6SUMG14Cdhao@z>

--nextPart23477701.SVBATBIGA1
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nick,

On Friday, 21 October 2016 11:51:47 BST Nicholas Piggin wrote:
> Paul Burton <paul.burton@imgtec.com> wrote:
> > This series fixes a few issues with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> > and then enables it, along with CONFIG_THIN_ARCHIVES, for MIPS. This
> > 
> > leads to a typical generic kernel build becoming ~5% smaller:
> >   add/remove: 0/3028 grow/shrink: 1/14 up/down: 18/-457362 (-457344)
> >   ...
> >   Total: Before=9001030, After=8543686, chg -5.08%
> > 
> > Applies atop v4.9-rc1.
> 
> Very nice, and thanks for the kbuild fixes, I think they all look sane.
> 
> Let's try to get those kbuild fixes in through the kbuild tree first
> (which has some other fixes required for 4.9). I can take them and send
> them to kbuild maintainer if you like.

That sounds great :)

> On powerpc we'll likely provide an option to select these manually for
> 4.9 because there has been the odd toolchain issue come up, so that's
> something to consider.

I imagine the MIPS bits will probably be v4.10 material, but hopefully Ralf 
can get them into -next as soon as possible after the kbuild bits are in, 
which should give us some time to discover any toolchain issues.

> For your linker script, you may consider putting the function sections
> into the same input as other text. TEXT_TEXT does not include .text.*,
> so mips's .text.* below it will catch those.
> 
> You may just open-code your TEXT_TEXT, and have:
> 
> *(.text.hot .text .text.fixup .text.unlikely .text.[0-9a-zA-Z_]*)
> 
> or similar.

Ah, so are you saying that would give the linker more scope for discarding 
things?

Thanks,
    Paul
--nextPart23477701.SVBATBIGA1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYCcerAAoJEIIg2fppPBxllhwQAKYrjCJtJSRdaGlUIHyVAcu8
CFLgqlpez68qcjQtxYTzaraZv/hhm0R+fLl8A+dbdVeyS4fcLQhE2tfIU0DD7Sjk
MdwhgWpXmmfZP0FfpOfkpnXCHooKLK2Y1kUJclIzhzkrM9V5bBBwjuDvoDv7hUpm
uDS1hxeGxksiwZMLJWWszLeO4RPdfdtw11AVYkOos9Jjx9OEtEeNtXME4rTmFq1/
aI6zq1kJY0PKX0z9+Io34fM4abp5Mr+8yJy/XY6uJyn+mG2OZcsvw+LAnJgcnoDZ
P+CpX/L9EVlZesM6MbZ4N4YokLcnz0mATookzeOu2jsh5lAur64yEt9xPgN9GoDA
cwWJlqt2vD2SqQdrxwtknzCsRLb5utyRidCfgRmJ7zgdXlJyAA8o9cxxfzETPVV5
G6Dn4JI3q2szjhWCRjtPQzdrc+sqBaxA7JJ8t/zgj7YaUgqq05FMMu04X2+fzsPB
Nvn0Z8gQ+fBaQP8gxI41ALD5sMgMfdt8ylO2407g7SqQbO45VS9VShf4IBDA1idj
jCI+MTWswItld/f+F9dU6HgeVtt4XPC9ck+Nge3DIeVnLPXk9AJofKPnyOeUM/P9
BzH3r4g7ZkJr/ZkQq5AZRCH2RzsgXLCz//EVkq37vxWK5RFnb/gAfj2FYKsrbQl/
rtAvXFiH5dP/jOdlblBG
=5Yuz
-----END PGP SIGNATURE-----

--nextPart23477701.SVBATBIGA1--
