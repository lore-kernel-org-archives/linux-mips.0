Received: from [217.156.133.130] ([217.156.133.130]:12494 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-FAIL-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6821191AbaDIJCFJs7lc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Apr 2014 11:02:05 +0200
Message-ID: <53450C85.3030204@imgtec.com>
Date: Wed, 9 Apr 2014 10:01:57 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS: Remove last traces of SMTC Support too?
References: <1397033309.22767.8.camel@x220> <53450BBE.7050501@imgtec.com>
In-Reply-To: <53450BBE.7050501@imgtec.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="ET46Kath3jK405kQlOgXpMagF6sx7rlvv"
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
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20140409090157.bdTf4updiV_ILiiyRNSNnM4tmzKH4FbFGFiwctW5FeQ@z>

--ET46Kath3jK405kQlOgXpMagF6sx7rlvv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/04/14 09:58, Markos Chandras wrote:
> On 04/09/2014 09:48 AM, Paul Bolle wrote:
>> The patch "MIPS: Remove SMTC Support" landed in linux-next (see
>> next-20140409). A quick grep of the tree suggests a follow up is neede=
d
>> (a sort-of-patch is pasted below).
>>
>> Is a similar follow up queued somewhere? If not, should I submit a pat=
ch
>> or should I wait with doing that until "MIPS: Remove SMTC Support" hit=
s
>> mainline?
>>
>>
>> Paul Bolle
>=20
> Hi Paul,
>=20
> I talked to Ralf yesterday. It seems the patch was not applied correctl=
y
> and there are a few traces left. My original patch definitely removes
> the traces listed in your patch.
>=20
> You can compare the original patch
>=20
> https://patchwork.linux-mips.org/patch/6719/
>=20
> with the one currently present in upstream-sfr/mips-for-linux-next bran=
ch
>=20

Note that the cpu-info.h part of Paul's suggested patch is new, due to
code added in b86c2247a20f (MIPS: Add cpu_vpe_id macro).

Cheers
James


--ET46Kath3jK405kQlOgXpMagF6sx7rlvv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAEBAgAGBQJTRQyGAAoJEGwLaZPeOHZ6Q1wP/1SJ/gtluajsl17dPrJZJkOL
oESoNsC/EkBC+YGjcQ63VyqgrLUaAu4iv3rA7V1+puEi2GrD7ok0Q2d4gL35W2Q2
ZbpTeIQrLqDIc5Mz+A22jqoYZQQGqGp6wD9dO3JtGGvWVrPKx4HtT+8jqBTNe7fO
2AxznqRwUpOxsgY9AQV2Jd8+KG6TbMr8WcBqOK9+ZedJezHMP43MZ/ZPGlIGYpcT
o9WLEn8pCG/QKxZU1eiehrtiEtebNfkju8dk7hSUwueUyDXv44OndheYCLPHxzLO
1OxLGeMbruev430vhhOyXiqviETpsLFcgSXkkfKn0KwA0ccY3JvBYqaqx/85J8Lj
P7579mOcOT9FK+Crh1EoJpUa1sg7B2OpAT7MKdjlP2I/XyaTggrvyzlep4VCJuRi
66q7LA/p6CBpAPk5mSFQielDHZNuEGU/gn7j5bJTnoPx7TFuf3jdrWxRmr6EqHlM
HVsmOcyXPfli0BAm421PUyXsIlWYKOBX1Lm0JFLWCbGIb+mNogRYQ+V9t2Y5W50N
GUlsgybe7UALWXS1zgn2JMatIJxXiCqPJRytLNzAuIE3XmLB2rxwn2WO+xGU+aUr
dMAbL1VRLdRQDb+zKWIQQrAlNM4XdH1vX+xCOtHx9SL30YW7iGFO0yTZLC6yptSf
UXUDO4d8K7QJ0kg8PwIw
=SpBs
-----END PGP SIGNATURE-----

--ET46Kath3jK405kQlOgXpMagF6sx7rlvv--
