Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:51364 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990409AbdK0OOrLFShb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Nov 2017 15:14:47 +0100
Date: Mon, 27 Nov 2017 14:13:00 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: WTF: patch "[PATCH] MIPS: pci: Remove KERN_WARN instance inside
 the mt7620 driver" was seriously submitted to be applied to the 4.9-stable
 tree?
Message-ID: <20171127141300.GB11276@jhogan-linux.mipstec.com>
References: <1511786146225230@kroah.com>
 <20171127124036.GA11276@jhogan-linux.mipstec.com>
 <20171127125649.GA13615@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <20171127125649.GA13615@kroah.com>
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
To: Greg KH <gregkh@linuxfoundation.org>
Cc: john@phrozen.org, ralf@linux-mips.org, stable@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20171127141300.hRP-uiOl_iGKnBELdHY_XBSSzZdmTW5sFMYHvG4YY5Y@z>

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 01:56:49PM +0100, Greg KH wrote:
> On Mon, Nov 27, 2017 at 12:40:36PM +0000, James Hogan wrote:
> > Hi Greg,
> >=20
> > On Mon, Nov 27, 2017 at 01:35:46PM +0100, gregkh@linuxfoundation.org wr=
ote:
> > > The patch below was submitted to be applied to the 4.9-stable tree.
> > >=20
> > > I fail to see how this patch meets the stable kernel rules as found at
> > > Documentation/process/stable-kernel-rules.rst.
> > >=20
> > > I could be totally wrong, and if so, please respond to=20
> > > <stable@vger.kernel.org> and let me know why this patch should be
> > > applied.  Otherwise, it is now dropped from my patch queues, never to=
 be
> > > seen again.
> >=20
> > I should have adjusted the commit message. KERN_WARN doesn't exist so it
> > actually fixes a build error as well as switching to pr_warn().
>=20
> What build error?  I have not heard of this breaking the build on 4.9
> for the past year, is it in some config that no one uses?  :)

The LEDE project has been carrying the patch [1] since February when
they added 4.9 support (their 4.4 support had a slightly earlier version
of the driver added with just a plain printk, no KERN_WARN).

They have both CONFIG_SOC_MT7620 and CONFIG_PCI=3Dy in their ralink mt7620
config [2], and they are keeping up to date with stable releases [3], so
I have no doubt they would appreciate having the patch applied to
upstream stable to reduce their delta.

The only defconfigs in mainline which enable this platform
(CONFIG_SOC_MT7620) are omega2p_defconfig and vocore2_defconfig, which
were added in August by Harvey to help widen our internal continuous
build & boot test coverage. Neither defconfig enables CONFIG_PCI yet
which is required to see the build failure below, but regardless it is a
valid configuration which LEDE is actively using.

arch/mips/pci/pci-mt7620.c: In function =E2=80=98wait_pciephy_busy=E2=80=99:
arch/mips/pci/pci-mt7620.c:123:11: error: =E2=80=98KERN_WARN=E2=80=99 undec=
lared (first use in this function)
    printk(KERN_WARN "PCIE-PHY retry failed.\n");
           ^~~~~~~~~

John: I'm not familiar with the hardware, but would it be appropriate to
add CONFIG_PCI=3Dy to either of those 2 defconfigs (omega2p_defconfig and
vocore2_defconfig) so this driver gets some upstream build[/boot]
testing?

Anyway, hopefully that helps allay stable backport concerns.

Thanks
James

[1] https://github.com/lede-project/source/blob/master/target/linux/ramips/=
patches-4.9/0099-pci-mt7620.patch
[2] https://github.com/lede-project/source/blob/master/target/linux/ramips/=
mt7620/config-4.9
[3] https://github.com/lede-project/source/commit/9fe59abef8bde3b7f32868873=
c4e1f76e9222d46

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAlocHU4ACgkQbAtpk944
dnrnTw//RS1c1UR4VRgca0k2C21P8SZUUY1Iyq47hqGstHCQL9p2++KtAN+KXtLo
8JSb9kCsvmCkS5BD5D4aDUdfq9F47RxsNU+N8Lm7zht4MTe7F1Ch1utbdJEjwVvK
f7ozhtxTZLbO9lmiDFZXxLgunRPb3UojO07jtU9ZLUMdZk5MNj/cvZL30z89eb5v
DwIYqgHKhShyiqS32+7U8l2rY7e7t0YHv7FzjjYeiiEOimYf50kQRbpbXFoDlVGO
xzKbytL4a4UBIBjjRwULJEy2pNPnrWCcIdMIWIdMu4g9FB8fGtbu8yPvnLH9kM+w
6blF81StZ+5s8QNEpzppk8DiSENaztntmFda33UzR6TDPPz8GLeypfM29xRvj6v8
XTwGlD8EaM+3M6XGBC6z+qWqnpCGkF6GBgR9eNWn1G5JvI58wDhHQZ6MwB7DWC++
5b51XfzyxyVx5ymGwPPaJAK7dp1kie0O4jcArO1eGKrkOH+Nj9gtccUHRjMBLohq
fg8hxJw9nNRN3kKgwP//gXl1bFz+W8SEc/MuoY7kOB58rx7+8xp/Vfeek3j+vGM2
ScksNexhsWZ502Yiu6AiDAH+nvUcc/MeF/wl8lmyzTdSVLsdYHcsGTG9iNRWbfVE
c0mEX1/Yv5jFADf6ud32GXUlnK0LM6uWf5Jb8DUhmEzc3m3M8QI=
=fN65
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
