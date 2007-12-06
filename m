Received: from tool.snarl.nl ([82.95.241.19]:29706 "EHLO tool.snarl.nl")
	by ftp.linux-mips.org with ESMTP id S20026868AbXLFQvG (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 6 Dec 2007 16:51:06 +0000
Date: Thu, 6 Dec 2007 17:51:00 +0100
From: Freddy Spierenburg <freddy@dusktilldawn.nl>
Subject: Re: Bug in Au1x00 UART or USB drivers for 2.6 kernels?
Message-ID: <20071206165100.GP2391@dusktilldawn.nl>
References: <BLU127-W10543A7CB1FFFC1CCC77918A6F0@phx.gbl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iSEM+tA/SPO43KHM"
Content-Disposition: inline
In-Reply-To: <BLU127-W10543A7CB1FFFC1CCC77918A6F0@phx.gbl>
Return-Path: <freddy@dusktilldawn.nl>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Nathan Eggan <nathan_eggan@live.com>
Cc: linux-mips mailing list <linux-mips@linux-mips.org>


--iSEM+tA/SPO43KHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Thu, Dec 06, 2007 at 04:41:23PM +0000, Nathan Eggan wrote:
> Can anyone see this?

Yes, your message came through clearly.

And to reply a little bit more on topic. I had also some strange
serial trouble with 2.6.16, but it dissapeared when I used
2.6.23.9. The trouble I had was using 115200bps and for some strange
reason bytes would be missing on one of the interfaces. I had no
trouble on ttyS2, but ttyS0 would. Strange, but using 2.6.23.9 I
did not experience the same problems. I did not investigate the
real cause, but just wanted to let you know.


--=20
$ cat ~/.signature
Freddy Spierenburg <freddy@dusktilldawn.nl>  http://freddy.snarl.nl/
GnuPG: 0x7941D1E1=3DC948 5851 26D2 FA5C 39F1  E588 6F17 FD5D 7941 D1E1
$ # Please read http://www.ietf.org/rfc/rfc2015.txt before complain!

--iSEM+tA/SPO43KHM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHWChzbxf9XXlB0eERAmXpAJwPAy0TD8UbO0O9W3q3dJpYem6btgCfT7Of
dMdSa+9/guIra+nPJKBu7as=
=ris/
-----END PGP SIGNATURE-----

--iSEM+tA/SPO43KHM--
