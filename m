Received: from mailapp01.imgtec.com ([195.59.15.196]:59735 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27026566AbbEHOv3e-t2w (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 May 2015 16:51:29 +0200
Message-ID: <554CCD6D.9010004@imgtec.com>
Date: Fri, 8 May 2015 15:51:25 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips:Remove unneeded duplicate declaration of cpu_callin_map
 in smp.h
References: <1431094355-28145-1-git-send-email-xerofoify@gmail.com>
In-Reply-To: <1431094355-28145-1-git-send-email-xerofoify@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="9iVb4aFBWr9IQMm9c8pC720DtJVvCU8NI"
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
To: Nicholas Krause <xerofoify@gmail.com>, ralf@linux-mips.org
Cc: chenhc@lemote.com, andreas.herrmann@caviumnetworks.com, rusty@rustcorp.com.au, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150508145125.3n5-ESe76qwYhl_GukP9LTlnJwrZ9ZJ9jSXuSqDfOqA@z>

--9iVb4aFBWr9IQMm9c8pC720DtJVvCU8NI
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 08/05/15 15:12, Nicholas Krause wrote:
> This removes the unneeded duplicate declaration of cpu_callin_map
> in smp.h due to use already declaring it in the file,smp.c that

No, it isn't declared in arch/mips/kernel/smp.c, its *defined* there (no
"extern"). It's referenced by:
arch/mips/cavium-octeon/smp.c
arch/mips/kernel/process.c
arch/mips/kernel/smp-bmips.c
arch/mips/kernel/smp-cps.c
arch/mips/loongson/loongson-3/smp.c
as well as arch/mips/kernel/smp.c, which is why the declaration is
needed in a header.

If you're attempting to fix the build errors in this area, please see:
http://patchwork.linux-mips.org/patch/9970/

Cheers
James

> already uses it internally for functions required this variable
> for their various internal work.
>=20
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  arch/mips/include/asm/smp.h | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
> index bb02fac..7752011 100644
> --- a/arch/mips/include/asm/smp.h
> +++ b/arch/mips/include/asm/smp.h
> @@ -45,8 +45,6 @@ extern int __cpu_logical_map[NR_CPUS];
>  #define SMP_DUMP		0x8
>  #define SMP_ASK_C0COUNT		0x10
> =20
> -extern volatile cpumask_t cpu_callin_map;
> -
>  /* Mask of CPUs which are currently definitely operating coherently */=

>  extern cpumask_t cpu_coherent_mask;
> =20
>=20


--9iVb4aFBWr9IQMm9c8pC720DtJVvCU8NI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVTM1tAAoJEGwLaZPeOHZ69fAP/00c7JAQpUQgzzskxtwFyo/2
wYGB4ABIZzCEz7wfHEzvnNoHCrgOE26o5tNXh+C07SwnFZguSfBqdEeSS/5Q3a1L
pbQa5gaV3NAYyOy2CppzX+15IWN/AIWt8i0uEHOHMt5D69rimCE7mTscsBB1vZY7
cIOv9GpWeYEZomJ3ajhSgI6txSih+f0mu3vs356ZSpSNYFjgrkOl4Dd7mESwMQji
FH6D9zni0Pd7o+j5yj4FSgkLGGorLV48F6VgFns6i6zhk/r/ZuUTNfdO81m6uOvz
cxnCg78pNRY1XxQRn15APpHKC59rp9uKUio3V3AToww/Fbmml6i9WrDpHsOR4FUF
RYMQU5Y43fBdBpZ368nJ+kA54f23zaa/caobFPRrHpHKY+GSV0/ePlA56iOMEoGf
StAAoEn1+w5zbz99nJiU4eCkIWO9mvmwHEaeZJxaOpLJiR7S0bvTbwdVzqm965uL
PNwNL0XhljyAnwEEWdegcnL0SvjpPtxKl9NWZmYCoLrEs3zmTtwJT3Cr530P3gSK
mh9sQ+k/K3tLahjS9D5/anmAb5N2G7xt8SehDFoTRl5Yo+rpTGEQf1Ln7uHZx/Ll
4EI6bmI6MDh97rh78ZoOxFeIrsIDZmLlcJgl9LBA9GNyDIHYMa5woG/pfi3ZlclS
JQKZtkv48rb3cb+HzJBV
=crdc
-----END PGP SIGNATURE-----

--9iVb4aFBWr9IQMm9c8pC720DtJVvCU8NI--
