Received: from sauhun.de ([89.238.76.85]:57132 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27007119AbbBXOQt5kDMg (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 24 Feb 2015 15:16:49 +0100
Date: Tue, 24 Feb 2015 15:16:44 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC 02/11] i2c: add quirk checks to core
Message-ID: <20150224141644.GA18301@katana>
References: <1420824103-24169-1-git-send-email-wsa@the-dreams.de>
 <1420824103-24169-3-git-send-email-wsa@the-dreams.de>
 <CABuKBe++yut6ZfhPrsWXGA4fZRvum6WOuRxHucM0gBJCGuou5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <CABuKBe++yut6ZfhPrsWXGA4fZRvum6WOuRxHucM0gBJCGuou5A@mail.gmail.com>
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
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-mips@linux-mips.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linuxppc-dev@lists.ozlabs.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20150224141644.8h1wJXYwSG0ucLVQoBOynNzYnvrKrTAegth2I5PL1ug@z>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +               if (msgs[i].flags & I2C_M_RD) {
> > +                       if (i2c_quirk_exceeded(len, max_read))
> > +                               return i2c_quirk_error(adap, &msgs[i], =
"msg too long");
> > +               } else {
> > +                       if (i2c_quirk_exceeded(len, max_write))
> > +                               return i2c_quirk_error(adap, &msgs[i], =
"msg too long");
> > +               }
>=20
> What about being more verbose in the error message, specifying if it
> was a read or a write message that failed?

Yes, done now. Thanks!


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU7IfLAAoJEBQN5MwUoCm2eM4P+wQZaq6QCo0vjXPKuf28kwn7
pE8alO7Mref/hDPDtJr/f7wFWnZkhQm0frwFxkMjkk7AXU/423Hr+WaynTn2muPU
JsQCTXbHJ7FRk9I/k0ZlRyxDhOYM5pAX4y/M+L5rA9HvNFWDcchOaiq4ep3BpyDB
xRRdXwMJHDylJJnbq/HEuXbNBXOex4qvCrAhXemdR9XYLCVenhMnBjztvkB48XDQ
PXCBuf43NtjY3C0P7fbFnnGUP+t+Zhdzup9JYJKaroJKd8XgrViSCv9qog6xgUO2
n5QzR5RwQCy4dQ8fhNteNJ5xJpTEQfV0qrTpGqqOBOtyZLtj+hjeEk8tBI4c+DJ2
24Z4rVc3q0QfyL8o2T4IbIg7kRxlk+8M2RzEVy2tRpNmUlKtW8hLVrRADTJGyLR/
XntU9Afl+qBnRwaP8IodZDE2xD5wTCwyo8L/4+/+q3Bo6mYxKkpOl43yDbDwJX6S
c5c9K+ueyWxILGkmJ+dgHMNySI5G0uDq8BG5dLpbx5iDUZfZBZ/TZtrpnrl5PiR5
kYkWJQ2L/P9CIer+v2Ia0e2XrYu8sVP/Cm38MsDRCiFHYj2qXREPMH6wY5Rf/wpH
0hvntc8pvr1YkMMD4aOaeQAdsSXe63P/4Q4pjaWbqupdW5cWgzelSUJoLVc3Lhil
2bx8Bd80/Y1UvyJBIbgi
=ERJg
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
