Received: from mailapp01.imgtec.com ([195.59.15.196]:13270 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27026175AbcDOTQruH6JG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 15 Apr 2016 21:16:47 +0200
Date: Fri, 15 Apr 2016 20:16:40 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 03/12] MIPS: Remove redundant asm/pgtable-bits.h
 inclusions
Message-ID: <20160415191640.GE7859@jhogan-linux.le.imgtec.org>
References: <1460716620-13382-1-git-send-email-paul.burton@imgtec.com>
 <1460716620-13382-4-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Content-Disposition: inline
In-Reply-To: <1460716620-13382-4-git-send-email-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, Markos Chandras <markos.chandras@imgtec.com>, Alex Smith <alex.smith@imgtec.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160415191640.Csd-HTHuTPXR7aGz2pdTQSBbC816saVQJDGNhwg0Ymw@z>

--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2016 at 11:36:51AM +0100, Paul Burton wrote:
> asm/pgtable-bits.h is included in 2 assembly files and thus has to
> in either of the assembly files that include it.

That could do with rewording :-)

Otherwise
Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

>=20
> Remove the redundant inclusions such that asm/pgtable-bits.h doesn't
> need to #ifdef around C code, for cleanliness & and in preparation for
> later patches which will add more C.
>=20
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
>=20
>  arch/mips/include/asm/pgtable-bits.h | 2 --
>  arch/mips/kernel/head.S              | 1 -
>  arch/mips/kernel/r4k_switch.S        | 1 -
>  3 files changed, 4 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm=
/pgtable-bits.h
> index 97b3138..2f40312 100644
> --- a/arch/mips/include/asm/pgtable-bits.h
> +++ b/arch/mips/include/asm/pgtable-bits.h
> @@ -191,7 +191,6 @@
>   */
> =20
> =20
> -#ifndef __ASSEMBLY__
>  /*
>   * pte_to_entrylo converts a page table entry (PTE) into a Mips
>   * entrylo0/1 value.
> @@ -218,7 +217,6 @@ static inline uint64_t pte_to_entrylo(unsigned long p=
te_val)
> =20
>  	return pte_val >> _PAGE_GLOBAL_SHIFT;
>  }
> -#endif
> =20
>  /*
>   * Cache attributes
> diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> index 4e4cc5b..b8fb0ba 100644
> --- a/arch/mips/kernel/head.S
> +++ b/arch/mips/kernel/head.S
> @@ -21,7 +21,6 @@
>  #include <asm/asmmacro.h>
>  #include <asm/irqflags.h>
>  #include <asm/regdef.h>
> -#include <asm/pgtable-bits.h>
>  #include <asm/mipsregs.h>
>  #include <asm/stackframe.h>
> =20
> diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
> index 92cd051..2f0a3b2 100644
> --- a/arch/mips/kernel/r4k_switch.S
> +++ b/arch/mips/kernel/r4k_switch.S
> @@ -15,7 +15,6 @@
>  #include <asm/fpregdef.h>
>  #include <asm/mipsregs.h>
>  #include <asm/asm-offsets.h>
> -#include <asm/pgtable-bits.h>
>  #include <asm/regdef.h>
>  #include <asm/stackframe.h>
>  #include <asm/thread_info.h>
> --=20
> 2.8.0
>=20

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXET4YAAoJEGwLaZPeOHZ6j5wP/AtoZM/60bHhaoMsXQSoAoPU
xO+TFwdF4tqwoyPQDx/K/CpzYYtViUMVuwISyDcDrefqFMrjGKtVKZU+GDBgeWjf
HPj6KoqmV5Uzqk7xV9/PKXRPvv3OdO+gNx+w731oh7xxWXUx+RZjVavfxcSgy/nb
1PmdVSH2RI8axpLRm4sKSJr9v+eW7XeLCfSpNSgKWP7qHQhYbwVH1peibWjL6fjl
bLZFxXrfufrF5EKKWKKI8uC7xwUfdRJY5fVOEe6TQnboxc9ScRrWgET0baj9Mn5s
Z23zakUxM9cxeB2RTF0tWzIfX7aNzvhoEGAOiCiVak/CN+zMEZuW/AQoDDUChMOu
NOUXgZ3qUxQeZ47HE9US52moTR/Q94OVONqNFEob79YwK3EmmS07UCJeFQqEF4rm
8EsP5eUpzaR1jtxhyeUYuG6Qw9qnyeQanBGh8eG6mwaFI1UXyudIcbqEkfB3tTQx
RUYHfgdt5Y7bgkBoQbWh89XiDPPuOUQrpTv6eyWOW9dyRqA2qWG8ASy6lg+37fMX
c/VqEUpO3AX5oWBS3APyXWqjUSNumQ3mvSe7yNfxjl8KSO0pzaYcYqQHCTaEwnNb
t320rlhNPVFSVJ00ao/xRy3mwnv5pprkU6UhsmxsMQpZwx1HtzKrHPXTaCxasKVv
Kiiy6osk+H0IscYM5aQD
=ETBt
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
