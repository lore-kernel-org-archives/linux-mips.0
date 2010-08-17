Received: from chilli.pcug.org.au ([203.10.76.44]:44445 "EHLO smtps.tip.net.au"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491195Ab0HQDku (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 Aug 2010 05:40:50 +0200
Date: Tue, 17 Aug 2010 13:40:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Message-ID: <20100817134039.fc1108c7.sfr@canb.auug.org.au>
In-Reply-To: <20100816204211.GA17571@angua.secretlab.ca>
References: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
        <7A9214B0DEB2074FBCA688B30B04400D013FA46D@XMB-RCD-208.cisco.com>
        <20100816204211.GA17571@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Aug_2010_13_40_39_+1000_loXQi+2twtQLFo7/"
Return-Path: <sfr@canb.auug.org.au>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "Dezhong Diao (dediao)" <dediao@cisco.com>, linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org, David Daney <ddaney@caviumnetworks.com>, ralf@linux-mips.org, "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Message-ID: <20100817034039.YMYF6tS8y5WS5FIhZhSFsD9B9MXVadYgrYlwEkQMOcs@z>

--Signature=_Tue__17_Aug_2010_13_40_39_+1000_loXQi+2twtQLFo7/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Mon, 16 Aug 2010 14:42:11 -0600 Grant Likely <grant.likely@secretlab.ca>=
 wrote:
>
> I'll also make sure to start build testing on MIPS.  Ralf, any suggestion=
s on defconfigs I should use?

Linux-next does defconfig, allnoconfig, allmodconfig (which has failed
for a long time) and ip32_defconfig for mips and mipsel.  I am not sure
if all these are still relevant.

(http://kisskb.ellerman.id.au/kisskb/branch/9/)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Aug_2010_13_40_39_+1000_loXQi+2twtQLFo7/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMagS3AAoJEDMEi1NhKgbsNZsH/A5oh++2w0Bdc0dp0+XzlFXI
5grlYLJ5CKPuCxd1VQ2BBLopeuzUR9YzvdyMkILLTONReWu7KJiUoTnNiZC95V/Z
/THxQuHo6gpMxketzgRU+VjfOSe4oVq8Ttk7tzKygIh/2WXbTqbBqI1IHFvWD10+
56hCEiQHyow0n1ME03urhBwlB5Wq0pHFAvnGKQ/HUmcSlVEzjvkNyP+kM6U1xHry
NDUkXk5NEARTWL8VqOT3HR77rg/0bNISmSnIIu6tpDcU4uMz4CkZVG/vgf1Fp75Z
lbJBs/DVWqvmGFbaW54FcYUaiuNMs0yCqgrmRUh2M/pJTHtVHBtBp85m9g8emBE=
=pXMp
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Aug_2010_13_40_39_+1000_loXQi+2twtQLFo7/--
