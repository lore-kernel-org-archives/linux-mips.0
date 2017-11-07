Received: from 19pmail.ess.barracuda.com ([64.235.154.230]:37396 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992910AbdKGWvMeeTsC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 7 Nov 2017 23:51:12 +0100
Date: Tue, 7 Nov 2017 22:49:26 +0000
From: James Hogan <james.hogan@mips.com>
Subject: Re: [PATCH] MIPS: Standardize DTS files, status "ok" -> "okay"
Message-ID: <20171107224926.GL15260@jhogan-linux>
References: <alpine.LFD.2.21.1709020307150.11468@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J2pR2RtFp0tAjF3C"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1709020307150.11468@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: linux-mips@linux-mips.org
Message-ID: <20171107224926.GRWjuhcbR4oP-QEbYJY3O-ADTW_KJxTkgPh6a6_xyY4@z>

--J2pR2RtFp0tAjF3C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 02, 2017 at 03:09:06AM -0400, Robert P. J. Day wrote:
>=20
> While the current kernel code in drivers/of/ allows developers to be
> sloppy and use the status value "ok", the current DTSpec 0.1 makes it
> clear that the only officially proper spelling is "okay", so adjust
> the very small number of DTS files under arch/mips/.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Thanks, Applied for 4.15.

Cheers
James

--J2pR2RtFp0tAjF3C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAloCOG8ACgkQbAtpk944
dno+0RAAqD/tj1qqeQwXU/NdDiQUhVJ/S8EsFZNCJ0J0x0kAKS8WmKcPwWhgfHC4
7a5bvqeIeXew6paHCw87IfIduVldFVt2pjHoCfJoOC3YVrdWd7p9N/sem5xaCX8M
3pCQrRMWpUMHPDrQtsZ+PoVyPYkq2JQUz8+OyLZcweGGcNy0dB/+LyWgd8byqqkL
oafioFJqMq6Mci2L4b4dOncO4NI5IxazbZ8OfN+qo5WGFAM83IfA553RHs6fm+AZ
MUCPNp8YVhOvvWOXznmXrWZV7thN5TKaS9bdm3PR8SA198poZyictsFlMxG8TUdD
laTnAGQqKN6Q+VW2lWSlASy+EtWXtG84cCVyRSKnpf7vlqs3UjcCgL8R/GRXHwRr
NlzcDHxF3WGCkDdiHDyImmGhFuJS28WHFbEtw2+vQXU7jOxbhvc2yHlFrX+FGbBs
0HimaM2ewpNsBzRYPYYs8EgyGXI5hRmzKKvLbNmQYIZy393BVvmW9yA8w3K82V5V
L6/kiDHDOlh5EAmOq3uyze0xd56GNrm8ifw+zhsFf0LV3dONqNsBCgcCe8f3u9Ue
Mk0L6IvS2dS3w9wK0N2YbdFgSkUQN7La02oszfO+wdLQf6lttKAqrCYpfZ7vVqsz
nCt+RgH3RkwWO5MOrHBySj9DqE8XSu5/Y6GEu+LOHvKeRTmH/pI=
=J1qy
-----END PGP SIGNATURE-----

--J2pR2RtFp0tAjF3C--
