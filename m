Date: Wed, 22 Dec 2004 11:44:57 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Problem registering interrupt
Message-ID: <20041222104457.GR2460@lug-owl.de>
References: <41C947CC.20709@innova-card.com> <20041222101906.27137.qmail@web25109.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1GSL5ZULXUIqbbH1"
Content-Disposition: inline
In-Reply-To: <20041222101906.27137.qmail@web25109.mail.ukl.yahoo.com>
Return-Path: <jbglaw@lug-owl.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041222104457.7TtM9Mz0t-Yje3MUhqikIqIsxm_PX5z-FidNq9BNk1I@z>


--1GSL5ZULXUIqbbH1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-12-22 11:19:06 +0100, moreau francis <francis_moreau2000@yahoo=
=2Efr>
wrote in message <20041222101906.27137.qmail@web25109.mail.ukl.yahoo.com>:
>=20
> > CPU 0 Unable to handle kernel paging request at
> > virtual address 00000004, epc =3D4
>=20
> Well it suggests me that your driver is trying to=20
> access a really nasty pointer: 0x00000004...
> How did you get this address ? From user space ?

Accesses to nearly NULL are normally structure accesses where a pointer
to a given struct was supplied as a NULL pointer.

So an access to 0x00000004 is most probably an access to the second
element of a struct, given/expected that all fields are usually 4-byte
aligned.

From looking at ./kernel/irq/manage.c:setup_irq(), I guess that you
supply NULL as the "struct irqaction *", which is the 2nd argument of
setup_irq(). It's 2nd structure element is "flags" then... This is the
first thing accessed by the "new" pointer in setup_irq().

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--1GSL5ZULXUIqbbH1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFByVApHb1edYOZ4bsRAnPQAJkBqac21e+DHjv+ubDV2Lt2CDl65QCcDL0j
qZgPbkeXlXZw5n05nOSnbpU=
=rVaL
-----END PGP SIGNATURE-----

--1GSL5ZULXUIqbbH1--
