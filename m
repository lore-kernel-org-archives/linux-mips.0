Received: from mailapp01.imgtec.com ([195.59.15.196]:47225 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992366AbdC3PzcrxoN0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 30 Mar 2017 17:55:32 +0200
Date: Thu, 30 Mar 2017 16:55:26 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] MIPS: KGDB: Use kernel context for sleeping threads
Message-ID: <20170330155526.GA21492@jhogan-linux.le.imgtec.org>
References: <c34c16db9efabb09ca200d5b2b14ad0e870a0b1c.1490876180.git-series.james.hogan@imgtec.com>
 <b8d4921a-2a88-c69d-1272-5589a0bfbbe9@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <b8d4921a-2a88-c69d-1272-5589a0bfbbe9@cogentembedded.com>
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Jason Wessel <jason.wessel@windriver.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20170330155526.uogQMLGs8sKkDP4i4tUGPf3N2meuhuWd8wino87FdOI@z>

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sergei,

On Thu, Mar 30, 2017 at 06:42:08PM +0300, Sergei Shtylyov wrote:
> On 03/30/2017 06:06 PM, James Hogan wrote:
> > @@ -254,25 +251,46 @@ void sleeping_thread_to_gdb_regs(unsigned long *g=
db_regs, struct task_struct *p)
> >  #endif
> >
> >  	for (reg =3D 0; reg < 16; reg++)
> > -		*(ptr++) =3D regs->regs[reg];
> > +		*(ptr++) =3D 0;
>=20
>     Parens are not really necessary, you can get rid of them, while at it.

While not technically required, I disagree that we should get rid of
them, simply because after coding in C for almost 20 years I still had
to look at an operator precedence table to check which of post++ and
dereference operators take precedence.

Cheers
James

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY3SpuAAoJEGwLaZPeOHZ6OXgP/3Ez7yXtEuk9Q5jzVbps096S
nqdc14AX2gI8GJgK4HezcBnrU9aoycOCAT02Co7+xVpMil2ZyMP7IrwE36AsgbBT
l/ZoorvMEN6trDM08mrbIigX/xKiaJurjihGcn+StWc+O4gDCE647DTKqRA4rZKZ
BP2U2HvBD3AhLAtJEQfb3X88n5OFxIYzhMhB3/oAZai1+oKvjiOdtZYY2lU6u+sx
z6S/EUmGZSAxXgAoQS9y0AVIA5nhvvaX9jqO7Lo3kkbJRkGj+30JIfKtXHgc2wok
nVtY85oBrMlKLZO33Kzcnng7o4B/hlRU/d104mCHgAk6X82z2HOFTZSdp+5YKt6/
Q61P59Gm3CiDiCxpy3fVWHYKAvRpfTG4op/p5NWqUU37fQLWmLz2qtx1+UC8A3u7
mVP2kr1di+VY/QL/QieRghWiGRtlc88kurbpp9PRYwxiv1YEQcGLbjZ3GMyZ/yWX
lnFlXE63+Hy8yffFBkP1a+1Vz6pM3RV+YoBsoB6YqILsFTGmUhyHmVZA+GeEbIc/
GRNiOsdHG7ZyHr8kIHg8t2StQ7AE+GrMhdDtkCMysKH9MzedvB6o5tbz4bs2Ca5R
q1w+c451NWk21dakBi0SjAOFiRVrKET8WjsiqUcIpkwAeU5f1ZoRC1C4CTetVJ11
zCBJ7xDfc88RFkZjl0L6
=pGZD
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
