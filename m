Received: from mailapp01.imgtec.com ([195.59.15.196]:61857 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27010822AbbA3KWbgpfcu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 11:22:31 +0100
Message-ID: <54CB5B59.5050203@imgtec.com>
Date: Fri, 30 Jan 2015 10:22:17 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] MIPS: fix kernel lockup or crash after CPU offline/online
References: <1421355719-17576-1-git-send-email-aaro.koskinen@iki.fi> <1421355719-17576-2-git-send-email-aaro.koskinen@iki.fi> <alpine.LFD.2.11.1501300347170.28301@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1501300347170.28301@eddie.linux-mips.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="uXRBadiiSiMPOrLi05Xvga7qvTWIcgmhn"
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>, Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Hemmo Nieminen <hemmo.nieminen@iki.fi>, stable@vger.kernel.org
Message-ID: <20150130102217.novCAnuF7cVPNmnmnYqfqrXReryKy0c_0fAXU7B0fCE@z>

--uXRBadiiSiMPOrLi05Xvga7qvTWIcgmhn
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

On 30/01/15 09:25, Maciej W. Rozycki wrote:
> On Thu, 15 Jan 2015, Aaro Koskinen wrote:
>=20
>> As printk() invocation can cause e.g. a TLB miss, printk() cannot be
>> called before the exception handlers have been properly initialized.
>> This can happen e.g. when netconsole has been loaded as a kernel modul=
e
>> and the TLB table has been cleared when a CPU was offline.
>=20
>  Hmm, why can a call to `printk' cause a TLB miss, what's so special ab=
out=20
> this function?  Does it use kernel mapped addresses for any purpose suc=
h=20
> as `vmalloc'?

It would be the fact netconsole (or whatever other console is in use) is
built as a kernel module, memory for which is allocated from the vmalloc
area.

Cheers
James


--uXRBadiiSiMPOrLi05Xvga7qvTWIcgmhn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUy1tgAAoJEGwLaZPeOHZ6FAwQAIn3Ps8ZEZykJZDzwaHyxEhv
3pDoz7S4ZKGvOrXLSN+Ne578xtTPec2BeQgtZRqFjMPJ+xabbNz5bpL1qdrU/Zg6
/B8DHHtAFhk2FK44QuaUECOGUcONPVdgUquKjTxkMWYIKZroix/tfoC5OzgqBTHp
cGy6UMG1WDU/4OJT81cjPHbzanA5x5fEjvypVwwMkr+vnMmg92LxVO3cDMAEAH00
1PpdmBOjiKI2TX10fYpwOsIDHMShmCgaCTQ8s25dSZvOl2NSgBrITEyWIDBw0XAY
F9lRKmk5nscO1BriWuFj6VF6O3nIxywRgwnYxyUYiK5fyCAdiXYR5+R3g00b+mhN
cy30H4r8iV5n0KAeW3TApwGGEVAaf23L+V2ixN94qwt0MDVqOPaRMw4bu/hOlFfy
gmzNFemD60PK6bXlkZUZmHwzT548urN+z1O8i6tn76x4xgS8zIrSmj3/3wXqbDT3
Edzrcr43AESfdGMZXoMDFuQjPObqNarY6TCP5jDHPjiAoV6Bp3ci11SEdLvfGCEn
f5wfjZ07ZJLZhaQ9wsXrEM4j8rZEb2Ajmtv4XPQ9T0n83qwQeGRktYPVh/et03RQ
46Z7LJHy8Ch9QLsBlNp7AUP+gfkg5+wk5jO042UzQfQ/uemP04m11oOIW+NUQSVU
j1++B65AFHsCsC5w1B+z
=n1YL
-----END PGP SIGNATURE-----

--uXRBadiiSiMPOrLi05Xvga7qvTWIcgmhn--
