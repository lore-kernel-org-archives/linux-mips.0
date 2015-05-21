Received: from mailapp01.imgtec.com ([195.59.15.196]:37560 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27012077AbbEUJMNi5Jrx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 21 May 2015 11:12:13 +0200
Date: Thu, 21 May 2015 10:12:04 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 1/2] MIPS: MSA: bugfix - disable MSA during thread switch
 correctly
Message-ID: <20150521090741.GG13811@NP-P-BURTON>
References: <20150519211222.35859.52798.stgit@ubuntu-yegoshin>
 <20150519211351.35859.80332.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <20150519211351.35859.80332.stgit@ubuntu-yegoshin>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org, rusty@rustcorp.com.au, alexinbeijing@gmail.com, david.daney@cavium.com, alex@alex-smith.me.uk, linux-kernel@vger.kernel.org, ralf@linux-mips.org, james.hogan@imgtec.com, markos.chandras@imgtec.com, macro@linux-mips.org, eunb.song@samsung.com, manuel.lauss@gmail.com, andreas.herrmann@caviumnetworks.com
Message-ID: <20150521091204.bGfzu_xv5VV4oHe5I61C_gL0AKoKzu0Wt_vLDwrYT4I@z>

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 02:13:51PM -0700, Leonid Yegoshin wrote:
> During thread cloning the new (child) thread should have MSA disabled even
> at first thread entry. So, the code to disable MSA is moved from macro
> 'switch_to' to assembler function 'resume' before it switches kernel stack
> to 'next' (new) thread. Call of 'disable_msa' after 'resume' in 'switch_t=
o'
> macro never called a first time entry into thread.

Hi Leonid,

I'm not sure I understand what you're trying to say here. Do you have an
example of a program that demonstrates the behaviour you believe to be
broken?

Thanks,
    Paul

> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> ---
>  arch/mips/include/asm/switch_to.h |    1 -
>  arch/mips/kernel/r4k_switch.S     |    6 ++++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/sw=
itch_to.h
> index e92d6c4b5ed1..0d0f7f8f8b3a 100644
> --- a/arch/mips/include/asm/switch_to.h
> +++ b/arch/mips/include/asm/switch_to.h
> @@ -104,7 +104,6 @@ do {									\
>  	if (test_and_clear_tsk_thread_flag(prev, TIF_USEDMSA))		\
>  		__fpsave =3D FP_SAVE_VECTOR;				\
>  	(last) =3D resume(prev, next, task_thread_info(next), __fpsave);	\
> -	disable_msa();							\
>  } while (0)
> =20
>  #define finish_arch_switch(prev)					\
> diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
> index 04cbbde3521b..7dbb64656bfe 100644
> --- a/arch/mips/kernel/r4k_switch.S
> +++ b/arch/mips/kernel/r4k_switch.S
> @@ -25,6 +25,7 @@
>  /* preprocessor replaces the fp in ".set fp=3D64" with $30 otherwise */
>  #undef fp
> =20
> +#define t4  $12
>  /*
>   * Offset to the current process status flags, the first 32 bytes of the
>   * stack are not used.
> @@ -73,6 +74,11 @@
>  	cfc1	t1, fcr31
>  	msa_save_all	a0
>  	.set pop	/* SET_HARDFLOAT */
> +	li      t4, MIPS_CONF5_MSAEN
> +	mfc0    t3, CP0_CONFIG, 5
> +	or      t3, t3, t4
> +	xor     t3, t3, t4
> +	mtc0    t3, CP0_CONFIG, 5
> =20
>  	sw	t1, THREAD_FCR31(a0)
>  	b	2f
>=20

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXaFjAAoJENzvn0paErs54s0QALkfjnLE9AcoHbf3nPdg1XKK
/oDZNKa8lydX6NlX+m1rLChcM9qvMp+fhDgZTvyWV0rrg4gBWxww9S79JvGtqB/E
9cdXu7cER7GQGnxd/u12tedgf1R2OgL1c/IdbVIndcdSDGNpS4qAuHTGUS1YaRU9
lU7Vai9pZAmmno3Lcb9Dx4dheoaw9pgTyIwEiUkaNHGMY+HKgLJGo8CojlhfzJj1
hgun3BEhu13TTVQboyHPvKqGjI7PZFTFkuLNUeudm7k0iC77YcVgg3HV73c8g/ks
ygF/SiG2vqlapJl/n4cmSMZnc8/FMVrd5EriNPjzhxo9Xl3ScuRI87oKuTZReCdK
J2s8c0ryRPjiNUWExNtKe2NhUxKRSJ1HJfpd9jheotd4z/QRUObxpLW2vJxVirMc
uteKW2lGTUnLbfzChlEVhIVt5mHXiiHFOdm//TSoGP7WDhARt/OQuAkvI84yPwk7
TQ8hb6/AMOzK38nd1e8S1ebWrNvpEKU7omgZS+18Z+zrfr9oshMrkHg/CzPgaXke
PrVp8Gt2FskzAZCntF2n2agE83BudiJXT/Q6b+xa4xye7Wm01Z/Kw9tI/lKp2VIl
QzilzI83Ey7twp/u3bwM6p14/kwOlOsGiroUXxE2JoUeciq0MNzlhE1oU7AQVHIy
CsEhemWDG1dHlxV8qwCg
=yGJG
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
