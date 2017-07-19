Received: from mailapp01.imgtec.com ([195.59.15.196]:43615 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992209AbdGSPRAd0WVN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 19 Jul 2017 17:17:00 +0200
Date: Wed, 19 Jul 2017 16:16:54 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: Octeon: Fix broken EDAC driver.
Message-ID: <20170719151654.GT31455@jhogan-linux.le.imgtec.org>
References: <1496251247-27123-1-git-send-email-steven.hill@cavium.com>
 <20170719093919.GR31455@jhogan-linux.le.imgtec.org>
 <20170719142105.GE5852@linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TJ9V72hR/LoebVea"
Content-Disposition: inline
In-Reply-To: <20170719142105.GE5852@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "Steven J. Hill" <steven.hill@cavium.com>, linux-mips@linux-mips.org
Message-ID: <20170719151654.vxA7EW7MTshu04ROdcE3tQj2DNKEYB1IizZP2gGtncE@z>

--TJ9V72hR/LoebVea
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2017 at 04:21:05PM +0200, Ralf Baechle wrote:
> On Wed, Jul 19, 2017 at 10:39:19AM +0100, James Hogan wrote:
> > I suppose we need this too now that 4.12 is out:
> > Cc: <stable@vger.kernel.org> # 4.12+
> >=20
> > (Maybe Ralf can fix that stuff up when applying?)
>=20
> I think the Cc: to stable is not necessary with the Fixes: tag.

I think the Cc is still advisable:
amalon> gregkh: Does a fixes tag make Cc: stable unnecessary? (I thought no=
t but maybe I'm mistaken)
gregkh> amalon: nope.  I do try to read all patches that do not have a cc: =
stable but just a fixes, but I don't always get to them, and they are _much=
_ lower priority.
gregkh> amalon: so always cc: stable please.

Cheers
James

--TJ9V72hR/LoebVea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAllvd+UACgkQbAtpk944
dnrACxAAo8YEGuGOXeyYYnvB7+dAg+r4PP6TBE6Qnh4uUhJAZmM1fUJ5oL6hPMz0
lk8jA3+91YAIr+cailzK7qpIiDX9tVA+LQeo/1iBkzW0DQcPVRERAJkiRkGo7KUU
J/2iwiyDz8gM/a6mbNeeGPUN5aiis8CWZO4o7BoQdfN3Y+7gjtgv92tfMa/+3/dC
eJ4lbZH+T0jTqJQTugGxHdj6t4tXcx9gS1YO89PTRpmA4VJToo5U0oONJ7Ig4Dyp
txbZGXdgXxvK0Aj+uIXwC3WZMklTxffw9PWBUvx5dctC/eon/E62ZFsmCAiXT/xK
B2lPdGqeYbEqhZjNARAc/sHsOUpNiUDcUpsUrXu/p2l6clRDX8WRlfAqfbfPFyF6
v8hX4suj4s68OcI0ix9l8JCPROUGMubKcN8DKo1zsAIVOvFxVppZd1Eo5QRlsoMV
26pkBJcME8TTsMReM5IsKZvlYlvZGLmWCUl+8f1nFaHf7XztWaxva/jXySudK2Pw
5Ui5/PsQTFQSiUrnYooOEHOq6yyh98hyvgP8zWGUEtBoLewkaSh1EcZDiXUJLwWt
E6hM8MDIb/Ee7cJbtTeTtsLwPfa1IFYRJ57Wh+rJ0edt0+FcKEqfWxt87FWvHqq8
5g5cndUCUQedPrhwd/uQahD70+W0yejBxoxUNMS1qQxtLjenGX4=
=66Y5
-----END PGP SIGNATURE-----

--TJ9V72hR/LoebVea--
