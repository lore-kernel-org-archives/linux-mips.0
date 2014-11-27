Received: from mailapp01.imgtec.com ([195.59.15.196]:49370 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27007342AbaK0LmHBsOn6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 27 Nov 2014 12:42:07 +0100
Message-ID: <54770E08.9040309@imgtec.com>
Date: Thu, 27 Nov 2014 11:42:00 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: mm: tlbex: Fix potential HTW race on TLBL/M/S handlers
References: <1417086788-15654-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1417086788-15654-1-git-send-email-markos.chandras@imgtec.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="sNm2gItsaHDcGTdXphJtQPq3F4BMwBT5v"
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, stable@vger.kernel.org
Message-ID: <20141127114200.p7We_pXDnxMqIvHk8-i9LPCYDotepU7C_xQYVUsj5c4@z>

--sNm2gItsaHDcGTdXphJtQPq3F4BMwBT5v
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 27/11/14 11:13, Markos Chandras wrote:
> From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>=20
> There is a potential race when probing the TLB in TLBL/M/S exception
> handlers for a matching entry. Between the time we hit a TLBL/S/M
> exception and the time we get to execute the TLBP instruction, the

More specifically it is between the exception being triggered and the
actual start of exception handling. HTW is disabled while at exception
level so it isn't a problem after the handler has actually started.

> HTW may have killed the TLB entry we are interested in hence the TLB

maybe s/killed/replaced/

Sorry to be picky, but I think it's worth getting that wording as
specific as possible for future reference.

> probe may fail. However, in the existing handlers, we never checked the=

> status of the TLBP (ie check the result in the C0/Index register). We
> fix this by adding such a check when the core implements the HTW. If
> we couldn't find a matching entry, we return back and try again.
>=20
> Cc: <stable@vger.kernel.org> # v3.17+
> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  arch/mips/mm/tlbex.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> index 7994368f96c4..3978a3d81366 100644
> --- a/arch/mips/mm/tlbex.c
> +++ b/arch/mips/mm/tlbex.c
> @@ -1872,8 +1872,16 @@ build_r4000_tlbchange_handler_head(u32 **p, stru=
ct uasm_label **l,
>  	uasm_l_smp_pgtable_change(l, *p);
>  #endif
>  	iPTE_LW(p, wr.r1, wr.r2); /* get even pte */
> -	if (!m4kc_tlbp_war())
> +	if (!m4kc_tlbp_war()) {
>  		build_tlb_probe_entry(p);
> +		if (cpu_has_htw) {
> +			/* race condition happens, leaving */

How about expanding this comment a bit for people trying to figure out
the code.

Technically though:
Reviewed-by: James Hogan <james.hogan@imgtec.com>

Thanks
James

> +			uasm_i_ehb(p);
> +			uasm_i_mfc0(p, wr.r3, C0_INDEX);
> +			uasm_il_bltz(p, r, wr.r3, label_leave);
> +			uasm_i_nop(p);
> +		}
> +	}
>  	return wr;
>  }
> =20
>=20


--sNm2gItsaHDcGTdXphJtQPq3F4BMwBT5v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUdw4IAAoJEGwLaZPeOHZ6NboP/RctzNE9fxJCwKWuv/pj/1cU
81b+Db8yvSEDrDwJRAUczYbES4E2Np/Kd+npg7z6oFD0Ti9GojLau7hRy1diw967
/UaodwyBJibassrQlxuYg3aKAt3QcedQqX5GG+dfpjIrICweRNxYMNFWO928IfYL
5lxuRkx/DImaIHFqMWBZOnxCXMn3xvdo8U84qCVMItGDYOoch+0NorgBjw2UgeX2
6VLXFMY9FtDBasZrdUPVkxG/AcpoNaA7oTMlvbpJll4v4NFRdlGgLdmkQXYe3Fp/
NmAxSoEMaYYbwGz1X3Xa4QwDHDTtxixVeVafzWVFadXfibcqlfCANJK/a956TNDg
ven3pOH+/8akVxctTKe4MJJzWxXvhE/spYTgm8qqAAUM3DlagGnNCN+RyIkXFY4s
ucZ1Py/ZRYowAVF8Mjwq2Hsj2LYPnNBeFqm6JsP1l9s5c2Pj/IvQuKUjEI4N394X
zcRC0xFbs/OxoVwBlmsduRL/NQCgHg2Qnxa/Cj2ua0La0Q/alWL8aixie5VT1Ad3
gLkLRSbxczmXxIPeTAoWBgOP6WxcZWTTedsYwQKMCb8IkzSAmK+ZWLQ+JQzi6vwj
y1MQnB17d4Kx57Fxf4/uzocAo/3u1RsjFS+O7a9Jrh1/egoORiombLafspsgGGsa
OkQgqh6jOlNuf8WkoUpY
=4LyP
-----END PGP SIGNATURE-----

--sNm2gItsaHDcGTdXphJtQPq3F4BMwBT5v--
