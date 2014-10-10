Received: from devils.ext.ti.com ([198.47.26.153]:53115 "EHLO
        devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011086AbaJJPQmuFP47 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Oct 2014 17:16:42 +0200
Date: Fri, 10 Oct 2014 10:16:33 -0500
From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] USB: phy: add ralink SoC driver
Message-ID: <20141010151633.GF31348@saruman>
Reply-To: <balbi@ti.com>
References: <1412936401-57511-1-git-send-email-blogic@openwrt.org>
 <20141010135826.GC31348@saruman>
 <5437F4DC.2070509@openwrt.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Content-Disposition: inline
In-Reply-To: <5437F4DC.2070509@openwrt.org>
Return-Path: <balbi@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <blogic@openwrt.org>
Cc: balbi@ti.com, linux-usb@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20141010151633.p3HXZ5x7Gmiifyl7VeaqU4Q9oE1E1kGbO-jFaNLjiPQ@z>

--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2014 at 05:01:48PM +0200, John Crispin wrote:
>=20
> On 10/10/2014 15:58, Felipe Balbi wrote:
> > On Fri, Oct 10, 2014 at 12:20:01PM +0200, John Crispin wrote:
> >> RT3352, RT5350 and the MT762x SoCs all have a usb phy that we need to =
setup.
> >>
> >> Signed-off-by: John Crispin <blogic@openwrt.org>
> > new PHY drivers only on drivers/phy ;-)
> >
> i that hope i am not the first to get it wrong. I will prepare/send a
> fixed version.

of course not, happens all the time :-) We're still transitioning things
over.

Thanks

--=20
balbi

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUN/hRAAoJEIaOsuA1yqREFSQP/jDoFErtYeiHf4meVNWrwST3
BpqktvAGq6kM3kmKvo2YTAO9DulDABrK49gHKo2Hn7bSsHezmNfGVOgJG1lUbGdZ
8/EcueKM0Cl4psAwt6inmR8iwDKnDbWwGOhxV9wrJvNUhr9NBiZ1Da6i0n1AUX/C
y6HAYkjC/WeOfGIG1hdMHyNJhi9fo7g8D0SeA5q5BMKhxSoigAZUE8AeCrLX8M7x
2Ci0/phjSgwDIbSienf6IhnRCjPMtIju+PpXwpgQZPbEd3g4JUAZchHUAoyayH82
GCfiS/oMy1GjIQszT3SQZyrIRM0F+Y4MjeL1BYpF88O5hp7ZCyKyBk1pLMWo8Ax6
xmSqtoOmaTLi15WVVkZsR1odpFKNC2ulm8v4tJIr0mfpED1Q91VW2O1CCuJ3GyGW
Wg08geZZCLpgEdbWgfQbvoZQ9hrQe0CWNLmXDbzUvec6A6cHCZbMFShajKnkuou7
SvzlfYWmq0I6cafETIjP8lEg9ahjZ/vhuy00+HTxT+o0iWUPO1I9VMT0D5tTbSXD
BauOD/DJBH9yqirCNruHaBUkdxsLs607TpNzfpYnEKBAs710DJe95ZkFCWyDCtvi
rs5uYMWQBmCRJmRGhpC2Vi8JvrBNPq6/o7qJZiC/iJ8rZjnnrqxbY2EBk8Kwsjxn
7xUv+sy5cuiCWz+SJi5t
=hZIu
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
