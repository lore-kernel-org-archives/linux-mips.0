Received: from mailapp01.imgtec.com ([195.59.15.196]:46584 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011431AbbAZMD4nsVcx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Jan 2015 13:03:56 +0100
Message-ID: <54C62D26.80907@imgtec.com>
Date: Mon, 26 Jan 2015 12:03:50 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: HTW: Prevent accidental HTW start due to nested
 htw_{start,stop}
References: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com> <1422265236-29290-3-git-send-email-markos.chandras@imgtec.com> <54C626CC.2070104@imgtec.com> <54C62941.6060604@imgtec.com>
In-Reply-To: <54C62941.6060604@imgtec.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="Jt7gEVxwkSQUx4S35WPSWRjALHGLAfKGK"
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
To: Markos Chandras <Markos.Chandras@imgtec.com>, linux-mips@linux-mips.org
Cc: stable@vger.kernel.org
Message-ID: <20150126120350.ct0cd7GgD1QIW1ju86zQlg-uGW-KT3HZwuXByXZAq18@z>

--Jt7gEVxwkSQUx4S35WPSWRjALHGLAfKGK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 26/01/15 11:47, Markos Chandras wrote:
> On 01/26/2015 11:36 AM, James Hogan wrote:
>=20
>>
>>> +		raw_current_cpu_data.htw_seq++;				\
>>
>> not "if (!raw_current_cpu_data.htw_seq++)) {"?
> Why?
>=20
> on _stop() calls you just increment it. The _start() will do the right
> thing then.
>=20
> I think what you suggest it to move the if() condition from the _start(=
)
> to _stop().

I just mean you only need to disable htw the first time its called. I
guess the extra branch every time could be worse than the extra disable
and ehb when nesting does occur, so its probably premature optimisation.

Up to you.

Cheers
James


--Jt7gEVxwkSQUx4S35WPSWRjALHGLAfKGK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUxi0mAAoJEGwLaZPeOHZ6LikP/2VfrnBHGTDfCK3TABp//uoT
ba3T/RY6CAQqouGGHRoQVlZ86RZhQQ8i/dmI8zlJDNQS/CbX9HybNK0DCM51i1XQ
KnEZZjQiICRdc50Do8fb0m+nTd68AXfvMRkGutQCiaDPS3p2K1EHPGBmUA7Edk3o
64uqtzoNS8fSlH9wcRW4sUj9a1DsFroJQMuK/O9Ecch4s6mDfVz7/PP9xol+p8sG
V3TJ19r684efT057dxRtiX/k4b00zAvZ10v6+tDWJap+2rTyJPYHmWP3juYyDfnw
xagu28RvKTWrwpJgkY3cRhIXI5ZjaBQMymxmAaXQ/asv9UrjXQiXfd6JB8VTb8eH
Zsx4YbGVBayd0K6gCdJnVAaoziRX2Z2tdRiy0Y/yGHaYZjYw7UiibMmg1l1hcrsZ
zQUQ8M6KqwiH5sO4v9fz7RrnPdigskoQKY/OSgGhTaLARHXy4qxHoSnILJVaqUb3
X7+U8fRor6WJL0GNeXkV41U8oEHaSM+LHgqaHQXrmY7uGGv6duFtNFEHP2ojKM2O
cpYspgCS0wh711BnuFEqLnYUmwaQMdDbMVY6xBEK4/dwc3jSrMM9YIovEsVbWssE
Sous417YfJIB6kFGwpzJe9Mz4ofvoBKi4riInqOS9SuAWaEQDaK9kgqTpDb9AWBp
lKU673ETaQI1y1LAhaza
=DU8u
-----END PGP SIGNATURE-----

--Jt7gEVxwkSQUx4S35WPSWRjALHGLAfKGK--
