Received: from sauhun.de ([88.99.104.3]:53005 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23991412AbdIMUzu5RD1i (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 13 Sep 2017 22:55:50 +0200
Date: Wed, 13 Sep 2017 22:55:44 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/5] i2c: gpio: Convert to use descriptors
Message-ID: <20170913205544.iatsjsb3ffohruwi@ninjato>
References: <20170910214424.14945-1-linus.walleij@linaro.org>
 <20170910214424.14945-2-linus.walleij@linaro.org>
 <CAMuHMdXabvax2Wru8j+MC4X5F+z5hoUo1tEbX+zn2AUW6QENVA@mail.gmail.com>
 <CACRpkdb4LQAqyWpRAWGRxUOcTbWVksNc3FTWdPnYNE-AUHtfgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rpjnafryku246gtn"
Content-Disposition: inline
In-Reply-To: <CACRpkdb4LQAqyWpRAWGRxUOcTbWVksNc3FTWdPnYNE-AUHtfgg@mail.gmail.com>
Return-Path: <wsa@the-dreams.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux I2C <linux-i2c@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Steven Miao <realmz6@gmail.com>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Ralf Baechle <ralf@linux-mips.org>, "arm@kernel.org" <arm@kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20170913205544.jzRpFGi-TLD8Q9cn5INiyy1NeYmsD40rMudiwuhuwmM@z>


--rpjnafryku246gtn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If Wolfram likes this series, I volunteer to rebase your patch
> (oh well rewrite patch 2 from scratch, haha) on top of it as well
> so he can apply the whole thing.

Yes, I like Geert's series. Merging the two series sounds great to me
and is probably easiest, but I'll leave it to you guys how to upstream
it.


--rpjnafryku246gtn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlm5m1AACgkQFA3kzBSg
Kba9IBAAn7uOLxskwT8kgRTLzPXBB74aK9mmLaD1FQwvVLF0EcVoFYod987Zg3WA
1QecZTUcKAqDFjc4HHUbHrzX8C/QrsKl2Bj+u8lt+iFkn5hlwpmE+mwjtcyT8OZF
Lb8tMzKH3fLxBN9aSjMzt7klbhl9y1CFxOlKVueNEuY0ienwMG4NZAsBhWEoJwe+
BCoeWK75P9Us1WFH4SbWqcxa5CMPfSfTTu0Rc8p1DFFrbo+ibjOAIcNNv/ac1RTT
b1fdMo+8NEJjW1rnyB8l50IbevhgtWpPRrYsCl0dRWUZeKdbu5crT006V/28CCpV
cc25Q+VGyBtGmTdtMtFIJBeRLrl6p3P1QS6d+/KBgZdYkbp5FKsjoXxGa1pQh7Lw
ssPm9LLwPJ8uGvP1gjZnOWgOEjdpWO53QqrUKS2fXuJEsQQDwdMmK4V4MHY95wk9
DDOnJ1YgeX6MbcfjS6j6lu6pwdji0g6IRIOYL1gCirTkDX/OpCAftRnbTVYwpuqR
FwU3xhNXz1p4eDy43DlTNmiCmugkkkYWx3DQLymCIoHjWbXP3/mVNzenF65eKUBr
wOgco1nJwC/1ktq7JEbZJ6jFce/TP5zGk/q69SCFZ3+mKhd/b07i/QIcr2yA0Vya
4jjqwNmJxWTYRyf3Dcsjb9ybA95VgL5SNkW3e7w88kA25QdmwdU=
=v60d
-----END PGP SIGNATURE-----

--rpjnafryku246gtn--
