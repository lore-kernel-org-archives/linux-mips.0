Date: Mon, 24 May 2004 11:13:35 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Socket problem?
Message-ID: <20040524091335.GD1912@lug-owl.de>
References: <20040522160635.GV1912@lug-owl.de> <000501c44168$b4718800$2000a8c0@gillpc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieuopS9JtHMyIYxU"
Content-Disposition: inline
In-Reply-To: <000501c44168$b4718800$2000a8c0@gillpc>
Return-Path: <jbglaw@dvmwest.gt.owl.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040524091335.Ox8ZvN2XEXzkLJ4uXlLLTnsCuK_GRMCHzKCYQXkeuSY@z>


--ieuopS9JtHMyIYxU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-05-24 09:25:43 +0100, Gill <gill.robles@exterity.co.uk>
wrote in message <000501c44168$b4718800$2000a8c0@gillpc>:
> Hi -
>=20
> To clarify, more specifically select() returns a positive value, and a
> subsequent call to FD_ISSET() returns TRUE for one of the sockets the app=
 is
> listening on.  Then, app calls recvfrom() which returns (sometimes) -1.
> Problem occurs sporadically...I'm seeing it every hundred or so packets at
> the moment, but it varies.

That sounds perfectly okay.

From SuS V3:
-------------------------------------------------------------------
A descriptor shall be considered ready for reading when a call to an
input function with O_NONBLOCK clear would not block, whether or not the
function would transfer data successfully. (The function might return
data, an end-of-file indication, or an error other than one indicating
that it is blocked, and in each of these cases the descriptor shall be
considered ready for reading.)
-------------------------------------------------------------------

So everything is perfectly okay, and because you have to do proper error
checking anyways, that shouldn't disturb your application at all.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--ieuopS9JtHMyIYxU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAsby/Hb1edYOZ4bsRAkJ2AJ440la+6H1v814nFOv9iMTGK+y+QACfeKj7
Qlgrmv4WxI9UiVQE5V+DZhU=
=8ZvA
-----END PGP SIGNATURE-----

--ieuopS9JtHMyIYxU--
