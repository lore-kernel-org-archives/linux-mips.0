Received: from mailapp01.imgtec.com ([195.59.15.196]:16284 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993898AbdF1OaLzUPZr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 28 Jun 2017 16:30:11 +0200
Date: Wed, 28 Jun 2017 15:30:05 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH V7 2/9] MIPS: c-r4k: Add r4k_blast_scache_node for
 Loongson-3
Message-ID: <20170628143005.GJ31455@jhogan-linux.le.imgtec.org>
References: <1498144016-9111-1-git-send-email-chenhc@lemote.com>
 <1498144016-9111-3-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="va4/JQ6j8/8uipEp"
Content-Disposition: inline
In-Reply-To: <1498144016-9111-3-git-send-email-chenhc@lemote.com>
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
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J . Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, stable@vger.kernel.org
Message-ID: <20170628143005.NUn5PKrrb43-8rftTKi52MiLmZEwBHVhUpxPqSdvUjs@z>

--va4/JQ6j8/8uipEp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

On Thu, Jun 22, 2017 at 11:06:49PM +0800, Huacai Chen wrote:
> @@ -839,9 +860,12 @@ static void r4k_dma_cache_wback_inv(unsigned long ad=
dr, unsigned long size)
> =20
>  	preempt_disable();
>  	if (cpu_has_inclusive_pcaches) {
> -		if (size >=3D scache_size)
> -			r4k_blast_scache();
> -		else
> +		if (size >=3D scache_size) {
> +			if (current_cpu_type() !=3D CPU_LOONGSON3)
> +				r4k_blast_scache();
> +			else
> +				r4k_blast_scache_node(pa_to_nid(addr));
> +		} else
>  			blast_scache_range(addr, addr + size);
>  		preempt_enable();
>  		__sync();
> @@ -872,9 +896,12 @@ static void r4k_dma_cache_inv(unsigned long addr, un=
signed long size)
> =20
>  	preempt_disable();
>  	if (cpu_has_inclusive_pcaches) {
> -		if (size >=3D scache_size)
> -			r4k_blast_scache();
> -		else {
> +		if (size >=3D scache_size) {
> +			if (current_cpu_type() !=3D CPU_LOONGSON3)
> +				r4k_blast_scache();
> +			else
> +				r4k_blast_scache_node(pa_to_nid(addr));

malta_defconfig now fails to build:

arch/mips/mm/c-r4k.c: In function =E2=80=98r4k_dma_cache_wback_inv=E2=80=99:
arch/mips/mm/c-r4k.c:867:5: error: implicit declaration of function =E2=80=
=98pa_to_nid=E2=80=99 [-Werror=3Dimplicit-function-declaration]
     r4k_blast_scache_node(pa_to_nid(addr));
     ^

Cheers
James

--va4/JQ6j8/8uipEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAllTvWIACgkQbAtpk944
dnqtUQ//Y2RZHO/wqrQxVrepKG4SyAYXRtT4a0TzuvVI/EWzhRLy2c5ZHN5i33ef
Ifn28O+ZhxlUsGwHUdaWC5/34J5FM+GPui43MmSE5WqU3372AvMGMp2NZIrfW9/M
NsYO4ioJuaFlxzVfD0sN6WfgQaN83/O2RLSdg6vbrdj1MYnGzaXhjhjxNY1Rbs2I
mQ7pvbZVmqO9tLjq8ZSy8rsTLqBoX1QJIBTzIFBop2/BKNZqZKlpaWITUGnnbdAo
5+RIUCOjlO12Tsbswc7L+dMu83p158wCN26Pjjz5/LBXodYt0fThZ558s4n/Q5hF
1CQycp1uEnOKT0j1QuJfI3zpuTXRngu0NCjDgv2joVjPNbL9bhDLZ3fRRVwD2xCd
MiY2KRd6W1Q0GVEGGAKBqnaAAGhqD7WebBZLpITU/IdVdEWwQ56u7KFwMUFeROqu
KYYNAx0qB3BqBn7KS3fQJ98cHYXZZRqKe7OHBr+u99Lpi9x7lJ+2PxxYtCiuwa+v
IAnsDMAARWEmKVP8WKaVAsbZfWZnrt1waUhYqQMBeg7LXBbpmPjS5v5S2IAPYBKf
2shFh18eWYTsNMxqzcT7pRLzdiuDoLCdgWzd0XruGaCGgTlxjTN6h8HFM6CU3R7S
YSEKvpypsXMDlU+URkLxxxelhsMKG6nP26AOsGqEV/XyF3OsPyg=
=gZur
-----END PGP SIGNATURE-----

--va4/JQ6j8/8uipEp--
