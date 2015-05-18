Received: from mailapp01.imgtec.com ([195.59.15.196]:44130 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012839AbbERNuLhS6Uj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 May 2015 15:50:11 +0200
Message-ID: <5559EE0E.5030606@imgtec.com>
Date: Mon, 18 May 2015 14:50:06 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/9] MIPS: dump_tlb: Take global bit into account
References: <1431514255-3030-1-git-send-email-james.hogan@imgtec.com> <1431514255-3030-6-git-send-email-james.hogan@imgtec.com> <alpine.LFD.2.11.1505160137150.4923@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1505160137150.4923@eddie.linux-mips.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="69RVe8c9NgQRHoLkoIkKgiRuxinoiDEBR"
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20150518135006.tHhnVRlDwRvP6QhZGmil55pFt6EEcLgiQ08Phj_qhfE@z>

--69RVe8c9NgQRHoLkoIkKgiRuxinoiDEBR
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

On 16/05/15 01:44, Maciej W. Rozycki wrote:
> On Wed, 13 May 2015, James Hogan wrote:
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
>=20
>  Typo here, s/absense/absence/.

Thanks!

>=20
>> +		if (!(entrylo0 & 1) && (entryhi & 0xff) !=3D asid)
>=20
>  Hmm, it looks like r3k_dump_tlb.c will need a similar update.  I sugge=
st=20

Yes, quite possibly. Would you be happy to test such a patch (assuming
you have r3000 hardware available)? Patch 1 should allow the code to be
easily triggered.

> using _PAGE_GLOBAL and ASID_MASK rather than hardcoded 1 and 0xff.

Yeh, as you mentioned these describe the PTE rather than what goes in
EntryLo. Perhaps it makes sense to have a few more TLB dependent
definitions in mipsregs.h (patch 7 already adds a couple for RI/XI bits).=


Cheers
James


--69RVe8c9NgQRHoLkoIkKgiRuxinoiDEBR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVWe4PAAoJEGwLaZPeOHZ6lSgQAItjkrBFcStqw4DqbXjC16eT
YbkL7GG/C5Y9ofEpqj0PZYQ9lOqv3877AUdgaFWiYA62ZcDLg9L0ARvbsNJXmn6G
AZ2My1bOdz53AE2rGQKHTPD8gwV7w4dCMcworGJYkpnKE5TVKSSfD0vBBnwErEVX
zMAPbSBy3iBCk8wt8FOO/W9agLlSkvhI8ftnpkDVCZm7Jd0bC+5ASdKiVFZsImGS
+PpYbd8FPy/uDTftrBzVoodKwZew3AT69eqmmwuwPpsxmTe9jwzDvhFXa5UuitGE
FqelPokX6Nv6eE+dNPPBVEqzeb/tUv+kL9WprfHHGfrVSNrNzWo+sfLCPQ2TlGxB
eYmuccrdy1lLJJfVdsPXLgkUdZ3VxegOFvN4QkbofIym4QP+2cmy7vuPwHCQmx2D
UtTFIrQbZ07nkUa+0OvpdSchmyhYqmWq486pEjrDscojttHUe+OAHt36e8hW6uUp
G4P22LOD6jWCbwkrYRcKEcJfHV10GK3LlH5jnDbxNyLaGt6MtWZrduvjQGwMplcB
KlcrFnHBdb28pTVSSa4zQhlx/MLxbMdhM8YrH0qKa1gM5g8ZybKr8WDzH7MvOlRm
kgHJCLDcOKhU6tdN5ifKRvhoCjofR376ldgwi7JrwwqmTk7rRDtNevGHr+VNmvWX
J3xlfKQTRmolxKIKIeTg
=W1K9
-----END PGP SIGNATURE-----

--69RVe8c9NgQRHoLkoIkKgiRuxinoiDEBR--
