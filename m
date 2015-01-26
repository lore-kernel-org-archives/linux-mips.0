Received: from mailapp01.imgtec.com ([195.59.15.196]:25820 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27010935AbbAZLiTV0mEP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 26 Jan 2015 12:38:19 +0100
Message-ID: <54C62724.8080505@imgtec.com>
Date: Mon, 26 Jan 2015 11:38:12 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: HTW: Prevent accidental HTW start due to nested
 htw_{start,stop}
References: <1422265236-29290-1-git-send-email-markos.chandras@imgtec.com> <1422265236-29290-3-git-send-email-markos.chandras@imgtec.com> <54C626CC.2070104@imgtec.com>
In-Reply-To: <54C626CC.2070104@imgtec.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="qPGsrnEXH7HhvKMNm9uO7oTarRHG5us9R"
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
To: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org
Cc: stable@vger.kernel.org
Message-ID: <20150126113812.UxG792Cb9qwSPxVPbWquVEiEGczMKXC7Gy7vcwjU8mM@z>

--qPGsrnEXH7HhvKMNm9uO7oTarRHG5us9R
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 26/01/15 11:36, James Hogan wrote:
>> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/p=
gtable.h
>> index 7f7c558de9fc..d2c7e9e7447e 100644
>> --- a/arch/mips/include/asm/pgtable.h
>> +++ b/arch/mips/include/asm/pgtable.h
>> @@ -99,19 +99,30 @@ extern void paging_init(void);
>> =20
>>  #define htw_stop()							\
>>  do {									\
>> +	unsigned long flags;						\
>> +									\
>>  	if (cpu_has_htw) {						\
>> +		local_irq_save(flags);					\
>=20
> duplicate?

Whoops, ignore that question (it applied to older version of patch).

Cheers
James


--qPGsrnEXH7HhvKMNm9uO7oTarRHG5us9R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUxickAAoJEGwLaZPeOHZ6a2AP/jHg9D2UQ8kOsVDGUTyEfcDz
UHHdTc10KStrbjxhaNcbWL1XF2BnDU1sph9RGjRP/eojkZ3pPW2a7WB8twAUq1n2
PvR8ZYBrm1Hl2sfOqKO6FUg69uTioVaGkE197uffXkZ4jl3cVK4dDHzjmPUOF9pb
rEpjrcyH7aK2p+VuzT0cvkyJ3ANrHcjKbdPh2c3sCLjYRPiu22wUoVNR+49Lb93f
JI4fr+06Gz4beTLO7fs4Ig4wRoM6WFFPQg5cfunlZaprx6+EZSaoDd8RmEJYXsXX
U7S9ABsR4ezNfHFrnOGILbvjz8p2DrGuGi0mE/vk5hauRJFcI2Wws8jEeYMwGxeG
Ls/IeAuh30/CKYi+UV2YQTo1nNbyVtLB12mlII/Wy1Iks3SVr2zn+5nEldpEf2fa
C1ibxHqbRuvhN1puUs4VtP5t1b3xJiZorbz2UVrm4GDw38wjBdvsRgo8lqNWo6v+
dge6d9weEcD0kG4T1HtdrlC/Vk3WUfXkFW+mmUnfCMsxQk7DH63XEcag2t0GAkK2
VInk1/QbDVw/+qv/GmQQPCOaylYOXI12BC74WVsVOQPpN/qng1EYMJ9isdpO8S/C
KgallZOv/5ni7q0AOJBIRjqkZSkCg493FSDdGH1WvYaalZjXGR1Ii3mcUJd+sHFv
2NRNxQU5muNOfyAdDRHU
=dHLs
-----END PGP SIGNATURE-----

--qPGsrnEXH7HhvKMNm9uO7oTarRHG5us9R--
