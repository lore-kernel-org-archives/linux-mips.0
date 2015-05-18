Received: from mailapp01.imgtec.com ([195.59.15.196]:26108 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012839AbbERNhMfgY6O (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 May 2015 15:37:12 +0200
Message-ID: <5559EB04.2000007@imgtec.com>
Date: Mon, 18 May 2015 14:37:08 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/9] MIPS: dump_tlb: Take global bit into account
References: <1431514255-3030-1-git-send-email-james.hogan@imgtec.com> <1431514255-3030-6-git-send-email-james.hogan@imgtec.com> <20150515153800.GD2322@linux-mips.org>
In-Reply-To: <20150515153800.GD2322@linux-mips.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="ALH7S3QTVv0DjiEQSp8i9uiTxD99nOVGH"
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
Cc: linux-mips@linux-mips.org
Message-ID: <20150518133708._jST12Tl6wCE0DPjsMg835SE8nfcvUGke5_1ECY-N58@z>

--ALH7S3QTVv0DjiEQSp8i9uiTxD99nOVGH
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 15/05/15 16:38, Ralf Baechle wrote:
> On Wed, May 13, 2015 at 11:50:51AM +0100, James Hogan wrote:
>=20
>> The TLB only matches the ASID when the global bit isn't set, so
>> dump_tlb() shouldn't really be skipping global entries just because th=
e
>> ASID doesn't match. Fix the condition to read the TLB entry's global b=
it
>> from EntryLo0. Note that after a TLB read the global bits in both
>> EntryLo registers reflect the same global bit in the TLB entry.
>>
>> Signed-off-by: James Hogan <james.hogan@imgtec.com>
>> Cc: Ralf Baechle <ralf@linux-mips.org>
>> Cc: linux-mips@linux-mips.org
>> ---
>>  arch/mips/lib/dump_tlb.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
>> index 17d05caa776d..70e0a6bdb322 100644
>> --- a/arch/mips/lib/dump_tlb.c
>> +++ b/arch/mips/lib/dump_tlb.c
>> @@ -73,7 +73,8 @@ static void dump_tlb(int first, int last)
>>  		 */
>>  		if ((entryhi & ~0x1ffffUL) =3D=3D CKSEG0)
>>  			continue;
>> -		if ((entryhi & 0xff) !=3D asid)
>> +		/* ASID takes effect in absense of global bit */
>> +		if (!(entrylo0 & 1) && (entryhi & 0xff) !=3D asid)
>>  			continue;
>=20
> Note the architecture mandates that there only is one global bit per
> TLB entry and its written as the logic and of the two global bits in
> the entrylo0 and entrylo1 registers.  On TLB read the G bits of both
> entrylo registers will return the same value.
>=20
> In reality some implementations differ in hardware, for example the
> SB1 core where the TLB entries both have their separate G bit.  Both
> will be written with the logic and of the G bits of the entrylo registe=
rs
> so the existence of multiple G bits per TLB entry should never become
> visible.
>=20
> Except when writing a duplicate TLB entry where certain revisions will
> write the entrylo0 half of the TLB entry, then take the machine check
> exception leaving the entrylo1 half of the TLB entry unchanged.  At
> this point one may end up with architecturally undefined TLB entries
> with one G bit set and one clear.
>=20
> There may be other CPUs where such invalid TLB entries are possible
> therfore think we should check for entries with mismatching global
> bits and print those anyway.

Okay, makes sense. If either global bit is set I'll make it skip the
ASID check.

Thanks for the information.

Cheers
James


--ALH7S3QTVv0DjiEQSp8i9uiTxD99nOVGH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVWesEAAoJEGwLaZPeOHZ6OfsQAJwm7QbcY9c/ZNmktAYwg2Dh
J9JXreqkjTPQwTZmAFNI2MY6ioeF3iWOzrq4kkenofA8VAO5DGkrR97iVQYRoCSc
KmlueiyEkOgPrPkLuvdPcBtJzDTFTw0z8RMNFcydpsFNvmCwx8Lpuza/UO6AL1K+
ijrQVxwrWrBmGNL+Srt6sE9C7NlCccANkP2VDFL4huDb4GVxc1Q7KF/Jrri+WEiI
jVb3guydhb7E3nu3xdWLNZ9gXfdkMQCf5BnJtzadK5CxX+EilpakXaa4ZIldT9k2
XV3vfjS2RpcoIEQW6lCi5GsOI4lUgp+pU9ZkxAEcGO4HoTUcHdg61VjVie+Lg4xP
dBf+MiV0CNKDcF3xo/rPGNtJAdIKQi1N2RDlFhjYoQztVucEUoBLZLO+5BPM3vhv
yyGW/T6ZVhBbuaJoQdtYL5TRpDRxtPkC4aaD3XtJilrtU2N3Qljf9znU58pnH2bP
oNuvBbr4od3fPDXdt51JrWjALVeuc/3TicqS/myuTDnA1dpUKKj5IIaawvnkPDmS
FMA9bnTVIUcqXeWa41oPxOqYDSocN2UZl5Oi+BX0HB4YybVBg5LOawxTDS4O+GTB
DbBMCm8sBxReLCHduMg9jHTtevIdJnmSHTCDZnCGaZz1WZ7NnlNQEGH4lLvB+E8m
bPg1Xwpnj/LxeMn3uZ37
=ZBlJ
-----END PGP SIGNATURE-----

--ALH7S3QTVv0DjiEQSp8i9uiTxD99nOVGH--
