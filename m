Received: from mailapp01.imgtec.com ([195.59.15.196]:63235 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011856AbbD2JSDRkYVA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Apr 2015 11:18:03 +0200
Message-ID: <5540A1BF.7060408@imgtec.com>
Date: Wed, 29 Apr 2015 10:17:51 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS64: R6: R2 emulation bugfix
References: <20150428195335.11229.4516.stgit@ubuntu-yegoshin>
In-Reply-To: <20150428195335.11229.4516.stgit@ubuntu-yegoshin>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="jlhnoPVHrTmPgiB8jsF4kIC0QHldAfuCp"
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, macro@linux-mips.org, markos.chandras@imgtec.com, ralf@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150429091751.295YJOZCb8KEOD4xiPq2hZcras5Bv2u1ijktoR4H-wY@z>

--jlhnoPVHrTmPgiB8jsF4kIC0QHldAfuCp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Leonid,

On 28/04/15 20:53, Leonid Yegoshin wrote:
> Error recovery pointers for fixups was improperly set as ".word"
> which is unsuitable for MIPS64.
>=20
> Replaced by __stringify(PTR)

Every other case of this sort of thing uses STR(PTR) (or __UA_ADDR in
uaccess.h). Can we stick to STR(PTR) for consistency please?

With that change made:
Reviewed-by: James Hogan <james.hogan@imgtec.com>

Please also add these tags:

Fixes: b0a668fb2038 ("MIPS: kernel: mips-r2-to-r6-emul: Add R2 emulator f=
or MIPS R6")
Cc: <stable@vger.kernel.org> # 4.0+

Thanks
James

>=20
> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> ---
>  arch/mips/kernel/mips-r2-to-r6-emul.c |  104 +++++++++++++++++--------=
--------
>  1 file changed, 52 insertions(+), 52 deletions(-)
>=20
> diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/m=
ips-r2-to-r6-emul.c
> index f2977f00911b..c6f079f8f3dc 100644
> --- a/arch/mips/kernel/mips-r2-to-r6-emul.c
> +++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
> @@ -1250,10 +1250,10 @@ fpu_emul:
>  			"	j	10b\n"
>  			"	.previous\n"
>  			"	.section	__ex_table,\"a\"\n"
> -			"	.word	1b,8b\n"
> -			"	.word	2b,8b\n"
> -			"	.word	3b,8b\n"
> -			"	.word	4b,8b\n"
> +			__stringify(PTR) " 1b,8b\n"
> +			__stringify(PTR) " 2b,8b\n"
> +			__stringify(PTR) " 3b,8b\n"
> +			__stringify(PTR) " 4b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=3D&r"(rs),
> @@ -1325,10 +1325,10 @@ fpu_emul:
>  			"	j	10b\n"
>  			"       .previous\n"
>  			"	.section	__ex_table,\"a\"\n"
> -			"	.word	1b,8b\n"
> -			"	.word	2b,8b\n"
> -			"	.word	3b,8b\n"
> -			"	.word	4b,8b\n"
> +			__stringify(PTR) " 1b,8b\n"
> +			__stringify(PTR) " 2b,8b\n"
> +			__stringify(PTR) " 3b,8b\n"
> +			__stringify(PTR) " 4b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=3D&r"(rs),
> @@ -1396,10 +1396,10 @@ fpu_emul:
>  			"	j	9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			"	.word	1b,8b\n"
> -			"	.word	2b,8b\n"
> -			"	.word	3b,8b\n"
> -			"	.word	4b,8b\n"
> +			__stringify(PTR) " 1b,8b\n"
> +			__stringify(PTR) " 2b,8b\n"
> +			__stringify(PTR) " 3b,8b\n"
> +			__stringify(PTR) " 4b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=3D&r"(rs),
> @@ -1466,10 +1466,10 @@ fpu_emul:
>  			"	j	9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			"	.word	1b,8b\n"
> -			"	.word	2b,8b\n"
> -			"	.word	3b,8b\n"
> -			"	.word	4b,8b\n"
> +			__stringify(PTR) " 1b,8b\n"
> +			__stringify(PTR) " 2b,8b\n"
> +			__stringify(PTR) " 3b,8b\n"
> +			__stringify(PTR) " 4b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=3D&r"(rs),
> @@ -1581,14 +1581,14 @@ fpu_emul:
>  			"	j	9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			"	.word	1b,8b\n"
> -			"	.word	2b,8b\n"
> -			"	.word	3b,8b\n"
> -			"	.word	4b,8b\n"
> -			"	.word	5b,8b\n"
> -			"	.word	6b,8b\n"
> -			"	.word	7b,8b\n"
> -			"	.word	0b,8b\n"
> +			__stringify(PTR) " 1b,8b\n"
> +			__stringify(PTR) " 2b,8b\n"
> +			__stringify(PTR) " 3b,8b\n"
> +			__stringify(PTR) " 4b,8b\n"
> +			__stringify(PTR) " 5b,8b\n"
> +			__stringify(PTR) " 6b,8b\n"
> +			__stringify(PTR) " 7b,8b\n"
> +			__stringify(PTR) " 0b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=3D&r"(rs),
> @@ -1700,14 +1700,14 @@ fpu_emul:
>  			"	j      9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			"	.word  1b,8b\n"
> -			"	.word  2b,8b\n"
> -			"	.word  3b,8b\n"
> -			"	.word  4b,8b\n"
> -			"	.word  5b,8b\n"
> -			"	.word  6b,8b\n"
> -			"	.word  7b,8b\n"
> -			"	.word  0b,8b\n"
> +			__stringify(PTR) " 1b,8b\n"
> +			__stringify(PTR) " 2b,8b\n"
> +			__stringify(PTR) " 3b,8b\n"
> +			__stringify(PTR) " 4b,8b\n"
> +			__stringify(PTR) " 5b,8b\n"
> +			__stringify(PTR) " 6b,8b\n"
> +			__stringify(PTR) " 7b,8b\n"
> +			__stringify(PTR) " 0b,8b\n"
>  			"	.previous\n"
>  			"	.set    pop\n"
>  			: "+&r"(rt), "=3D&r"(rs),
> @@ -1819,14 +1819,14 @@ fpu_emul:
>  			"	j	9b\n"
>  			"	.previous\n"
>  			"	.section        __ex_table,\"a\"\n"
> -			"	.word	1b,8b\n"
> -			"	.word	2b,8b\n"
> -			"	.word	3b,8b\n"
> -			"	.word	4b,8b\n"
> -			"	.word	5b,8b\n"
> -			"	.word	6b,8b\n"
> -			"	.word	7b,8b\n"
> -			"	.word	0b,8b\n"
> +			__stringify(PTR) " 1b,8b\n"
> +			__stringify(PTR) " 2b,8b\n"
> +			__stringify(PTR) " 3b,8b\n"
> +			__stringify(PTR) " 4b,8b\n"
> +			__stringify(PTR) " 5b,8b\n"
> +			__stringify(PTR) " 6b,8b\n"
> +			__stringify(PTR) " 7b,8b\n"
> +			__stringify(PTR) " 0b,8b\n"
>  			"	.previous\n"
>  			"	.set	pop\n"
>  			: "+&r"(rt), "=3D&r"(rs),
> @@ -1937,14 +1937,14 @@ fpu_emul:
>  			"       j	9b\n"
>  			"       .previous\n"
>  			"       .section        __ex_table,\"a\"\n"
> -			"       .word	1b,8b\n"
> -			"       .word	2b,8b\n"
> -			"       .word	3b,8b\n"
> -			"       .word	4b,8b\n"
> -			"       .word	5b,8b\n"
> -			"       .word	6b,8b\n"
> -			"       .word	7b,8b\n"
> -			"       .word	0b,8b\n"
> +			__stringify(PTR) " 1b,8b\n"
> +			__stringify(PTR) " 2b,8b\n"
> +			__stringify(PTR) " 3b,8b\n"
> +			__stringify(PTR) " 4b,8b\n"
> +			__stringify(PTR) " 5b,8b\n"
> +			__stringify(PTR) " 6b,8b\n"
> +			__stringify(PTR) " 7b,8b\n"
> +			__stringify(PTR) " 0b,8b\n"
>  			"       .previous\n"
>  			"       .set	pop\n"
>  			: "+&r"(rt), "=3D&r"(rs),
> @@ -1999,7 +1999,7 @@ fpu_emul:
>  			"j	2b\n"
>  			".previous\n"
>  			".section        __ex_table,\"a\"\n"
> -			".word  1b, 3b\n"
> +			__stringify(PTR) " 1b,3b\n"
>  			".previous\n"
>  			: "=3D&r"(res), "+&r"(err)
>  			: "r"(vaddr), "i"(SIGSEGV)
> @@ -2057,7 +2057,7 @@ fpu_emul:
>  			"j	2b\n"
>  			".previous\n"
>  			".section        __ex_table,\"a\"\n"
> -			".word	1b, 3b\n"
> +			__stringify(PTR) " 1b,3b\n"
>  			".previous\n"
>  			: "+&r"(res), "+&r"(err)
>  			: "r"(vaddr), "i"(SIGSEGV));
> @@ -2118,7 +2118,7 @@ fpu_emul:
>  			"j	2b\n"
>  			".previous\n"
>  			".section        __ex_table,\"a\"\n"
> -			".word  1b, 3b\n"
> +			__stringify(PTR) " 1b,3b\n"
>  			".previous\n"
>  			: "=3D&r"(res), "+&r"(err)
>  			: "r"(vaddr), "i"(SIGSEGV)
> @@ -2181,7 +2181,7 @@ fpu_emul:
>  			"j	2b\n"
>  			".previous\n"
>  			".section        __ex_table,\"a\"\n"
> -			".word	1b, 3b\n"
> +			__stringify(PTR) " 1b,3b\n"
>  			".previous\n"
>  			: "+&r"(res), "+&r"(err)
>  			: "r"(vaddr), "i"(SIGSEGV));
>=20
>=20


--jlhnoPVHrTmPgiB8jsF4kIC0QHldAfuCp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVQKHGAAoJEGwLaZPeOHZ6oKcP/2oG1jZDKpGiKYd2aBQNDkuk
XEU23dFuhYCMem7cWBJnBCVisizpNCapM9GhbAPmNO3ldT2MhW9QyXPyVc4RVMY8
SWJOwwLPasG//IofOCmvtZXt2S8NK4YDT5nMhu9Z8DwBxJ16PaTukWLCnJsr4yC3
TAqsudmRcJ/CCaxCi1ti+4T9rJRGeEod0xFPTgaHKY0bwDyWPdiX1UdLLSu6Tkuk
ScyTqEQfYcFF+ego21on9FM5uvVKS7HhDgHhftr7HrYeMcX+TsSkHl8zYWq3dS/S
sCJvFu4fhzE/5P4V16gfL7mjg9S/OK3XzsyHCwU2GSL3/0eF+h0crvnYtRpi8TMC
p0Ch/e80KEw62SlE14hCE7xEkXYBq1OTU2ZEKGMis5AL6puicQMlqeR6LzVasSWV
ROTWB0HvsCORp2Zk/MEJpsY3hvquUyQJtLHWqruKTNBBNZ+/jbm47x6nW/3LFhRT
wydjW2PIMxJR2iC4GsnABoExb+309x0ISm0PmZH8rMdt8UTRzdytX94RrDzQ3Grc
cmlhmR5TggoDkqcFPs4zbAZDpAN0/4axxLvBG7N9ZxGbVxBf+48JcrT6s9j6P0dC
hDAglQ96UJVOwDrKIYXijZJrcTuFAtnhNnBSp2NJaq26K3kASPbMOge+wrtjtDIT
MP6/9fFeJhpTJkVnkBYr
=o65l
-----END PGP SIGNATURE-----

--jlhnoPVHrTmPgiB8jsF4kIC0QHldAfuCp--
