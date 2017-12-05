Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:56804 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990502AbdLEXvlJ4Abi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 6 Dec 2017 00:51:41 +0100
Date: Tue, 5 Dec 2017 23:49:24 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: undefined reference to `__multi3' when building with gcc 7.x
Message-ID: <20171205234923.GK27409@jhogan-linux.mipstec.com>
References: <20170803225547.6caa602b@windsurf.lan>
 <20171203105631.5232445a@windsurf.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="451BZW+OUuJBCAYj"
Content-Disposition: inline
In-Reply-To: <20171203105631.5232445a@windsurf.lan>
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
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Waldemar Brodkorb <wbx@openadk.org>, Florian Fainelli <florian@openwrt.org>
Message-ID: <20171205234924.i47--CF37dipRvJUpXoKT3IQI-m6RoDeRd8-SDBORjU@z>

--451BZW+OUuJBCAYj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2017 at 10:56:31AM +0100, Thomas Petazzoni wrote:
> Hello,
>=20
> +James Hogan in Cc.
>=20
> On Thu, 3 Aug 2017 22:55:47 +0200, Thomas Petazzoni wrote:
>=20
> > When trying to build the current Linux master with a gcc 7.x toolchain
> > for mips64r6-n32, I'm getting the following build failure:
> >=20
> > crypto/scompress.o: In function `.L31':
> > scompress.c:(.text+0x2a0): undefined reference to `__multi3'
> > drivers/base/component.o: In function `.L97':
> > component.c:(.text+0x4a4): undefined reference to `__multi3'
> > drivers/base/component.o: In function `component_master_add_with_match':
> > component.c:(.text+0x8c4): undefined reference to `__multi3'
> > net/core/ethtool.o: In function `ethtool_set_per_queue_coalesce':
> > ethtool.c:(.text+0x1ab0): undefined reference to `__multi3'
> > Makefile:1000: recipe for target 'vmlinux' failed
> > make[2]: *** [vmlinux] Error 1
>=20
> I'm still facing this problem. There was a lengthy thread about it back
> in August when I reported the problem, but then it calmed down, with no
> real solution proposed.
>=20
> Are there plans to fix this at some point?

I recently fixed a similar issue in 64r6[el]_defconfig, but its not the
same as it applies to all gcc versions on mips64r6. Given Ralf appears
to be busy I'll take a look.

Cheers
James

--451BZW+OUuJBCAYj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlonMHwACgkQbAtpk944
dnoKtxAAsIAlvIbKcp3CQyKr5psshHq2S09fK4MFmaecyT28xsnWR3DFa75kmz/I
bK11vPBtQNEHNLbykZggNZeEwhat138bUyvYt8eaAjPor/1eyBsfRGbM1e+TriH4
lDBoIS2hGa9UYISnb256OW+lfcQA/lssLiSsFnKoYVE9uMXc2eOK2V3yrHOpwBtp
LJYaSag+SSeAgPdDSbsPn1DoblSnY3VUjsNnvUUrmMeGvzmquDN1loYDt+gP54kf
NlcT9hf8EC89gYhkcg7i5k+v09pDubQ01OBKrotnyEgjl9SUaCIQQvDzIzPONW9T
ofMcu7j4HW2KHMl226cPDnmVQgKFr6BcInDGPtgR5YHBkwO3mSakWdFhXtfOb3fk
FNykTqwnCF+mEKG2gtl/7D+NLJ34W/0lqcT/ZaaXshYe/gwXJ3qB8bdgcQCG9aJU
g6lIMaCx8mW/++zE+kdZR2T1QSX+XOPnNlRCYZusQlelqrrFZXVSkf6+21Pqe7y0
KeF+ILPsGn1uPlY0cSBAqlG1qaOqliKD6s5tTeo44sgmU8JJ8f6UiirTEVyrSIdf
dbNugdPzegD9VrMhzNYPbDrGJ/WfYlGI3ja4zdaxEjMABmdSoZGDrm28jSwkD+vE
yX8lSB1iQv/2wLms9EQlXpihGbdBZjLX1JMNHZnx+mMjn85MfTE=
=Ygjm
-----END PGP SIGNATURE-----

--451BZW+OUuJBCAYj--
