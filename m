Received: from mailapp01.imgtec.com ([195.59.15.196]:54589 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992974AbdFWOzBkcuZp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 23 Jun 2017 16:55:01 +0200
Date: Fri, 23 Jun 2017 15:54:53 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH V7 9/9] MIPS: Loongson: Introduce and use
 LOONGSON_LLSC_WAR
Message-ID: <20170623145453.GB31455@jhogan-linux.le.imgtec.org>
References: <1498144016-9111-1-git-send-email-chenhc@lemote.com>
 <1498144016-9111-10-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <1498144016-9111-10-git-send-email-chenhc@lemote.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J . Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>
Message-ID: <20170623145453.ekikPKlDkWu_JX2h31LIfm-qXxHVW-BWELKlntumlpw@z>

--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 22, 2017 at 11:06:56PM +0800, Huacai Chen wrote:
> diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
> index 0ab176b..e0002c58 100644
> --- a/arch/mips/include/asm/atomic.h
> +++ b/arch/mips/include/asm/atomic.h
> @@ -56,6 +56,22 @@ static __inline__ void atomic_##op(int i, atomic_t * v)			      \
>  		"	.set	mips0					\n"   \
>  		: "=&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)	      \
>  		: "Ir" (i));						      \
> +	} else if (kernel_uses_llsc && LOONGSON_LLSC_WAR) {		      \
> +		int temp;						      \
> +									      \
> +		do {							      \
> +			__asm__ __volatile__(				      \
> +			"	.set	"MIPS_ISA_LEVEL"		\n"   \
> +			__WEAK_LLSC_MB					      \
> +			"	ll	%0, %1		# atomic_" #op "\n"   \
> +			"	" #asm_op " %0, %2			\n"   \
> +			"	sc	%0, %1				\n"   \
> +			"	.set	mips0				\n"   \
> +			: "=&r" (temp), "+" GCC_OFF_SMALL_ASM() (v->counter)      \
> +			: "Ir" (i));					      \
> +		} while (unlikely(!temp));				      \

Can loongson use the common versions of all these bits of assembly by
adding a LOONGSON_LLSC_WAR dependent smp_mb__before_llsc()-like macro
before the asm?

It would save a lot of duplication, avoid potential bitrot and
divergence, and make the patch much easier to review.

Cheers
James

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEd80NauSabkiESfLYbAtpk944dnoFAllNK7IACgkQbAtpk944
dnq9vxAAqy/3vGH4UL1RaL2CP26MAm9SvrArghceQK55eL09YLIHmj12BvLyGCSd
sVPSJ9e53hoKB1onnBk2V1uk8TLtBqamq2JKJgeFaH7p2ft2FLoL/B7qcrxRdedH
Q6UEG2b9Ig2VYa9/P33pCLVaw8qWLd6r4c5qo8alrmMqKa1JR0Znp4rtEW3r1h7h
W+cw7ntNw269qYyBrHPL/EIUrQR7D9y71AoO3oa+uMtYoYItuhKJif9IVdVgNLu6
xleNYGlZNbO8+jrL3Pq9sz4iLl49PSdSf8rQmB2BfsOYhTfVnXMSLmG05Zyqi435
7z5c0mUCVtpOlOBuom38+q+cwsEtBygc4i1C2UYmRK5SQ0po0OOZQYfbwSi0PBYk
EbwViHJ5SZGY6TaRcxhZGaCDlQKKOrcfSXSsIZUKCbqVVtB8PV1SjksXQOI6bkuR
J9LEm9Kwr7xoPcNGt9REPDRxLF8ZJkGhTTVKQ1hf58BmvhPaECFHxUlh6EmpnFNg
fOlG8cVA226UmSzHItpFYXt26cOHkXTWlhawffbwS/E4jhLvmj4Gb83xUc26S7l3
7xeAxQewSw0TrlRqR+pZOfnK8NBrFZVNTvG61WSv/f42tE4qlLYwvVxRFPsCGWwT
Q8Y572SjEPDObNP+/BI15vt5NSttJFrc+LTnwiZQkRzTqivrc9w=
=NNDp
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
