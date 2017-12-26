Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:50312 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990408AbdLZPM2yobAj convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 26 Dec 2017 16:12:28 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH 2/2] MIPS: math-emu: Declare ys variable as possibly
 unused
Date: Tue, 26 Dec 2017 15:12:06 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEEC28256@MIPSMAIL01.mipstec.com>
References: <20171226104554.19612-1-malat@debian.org>,<20171226104554.19612-2-malat@debian.org>
In-Reply-To: <20171226104554.19612-2-malat@debian.org>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Aleksandar.Markovic@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mathieu Malaterre <malat@debian.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Miodrag Dinic <Miodrag.Dinic@mips.com>, Goran Ferenc <goran.ferenc@imgtec.com>, James Hogan <jhogan@kernel.org>, Douglas Leung <douglas.leung@imgtec.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20171226151206.HCrjmwFMp3zCaQNkTWBvmwYgJJsIrlaaTHcM9Ax0xnU@z>

> Fix non-fatal warning:
>
> arch/mips/math-emu/sp_fdp.c: In function ‘ieee754sp_fdp’:
> arch/mips/math-emu/ieee754int.h:60:31: warning: variable ‘ys’ set but not used [-Wunused-but-set-variable]
>   unsigned int ym; int ye; int ys; int yc
>                                ^
> arch/mips/math-emu/sp_fdp.c:37:2: note: in expansion of macro ‘COMPYSP’
>   COMPYSP;
>   ^~~~~~~
> 
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  arch/mips/math-emu/ieee754int.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/math-emu/ieee754int.h b/arch/mips/math-emu/ieee754int.h
> index 06ac0e2ac7ac..cb8f04cd24bf 100644
> --- a/arch/mips/math-emu/ieee754int.h
> +++ b/arch/mips/math-emu/ieee754int.h
> @@ -57,7 +57,7 @@ static inline int ieee754_class_nan(int xc)
>          unsigned int xm; int xe; int xs __maybe_unused; int xc
>  
>  #define COMPYSP \
> -       unsigned int ym; int ye; int ys; int yc
> +       unsigned int ym; int ye; int ys __maybe_unused; int yc
>  
>  #define COMPZSP \
>          unsigned int zm; int ze; int zs; int zc

This will silence the warning, but will do it for all future cases of unused
ys too - in other words, it may well silence even useful, valid warnings.
Also, this introduces an inconsistency among COMPXSP, COMPYSP, and COMPZSP
macros.

A better solution would be to reduce the scope of ys, so that it is always
used, if declared. Instead of this code segment (in arch/mips/math-emu/sp_fdp.c):

union ieee754sp ieee754sp_fdp(union ieee754dp x)
{
	union ieee754sp y;
	u32 rm;

	COMPXDP;
	COMPYSP;

	EXPLODEXDP;

	ieee754_clearcx();

	FLUSHXDP;

	switch (xc) {
	case IEEE754_CLASS_SNAN:
		x = ieee754dp_nanxcpt(x);
		EXPLODEXDP;
		/* Fall through.  */
	case IEEE754_CLASS_QNAN:
		y = ieee754sp_nan_fdp(xs, xm);
		if (!ieee754_csr.nan2008) {
			EXPLODEYSP;
			if (!ieee754_class_nan(yc))
				y = ieee754sp_indef();
		}
		return y;


... should be the following: (COMPYSP is moved to a smaller code block)

union ieee754sp ieee754sp_fdp(union ieee754dp x)
{
	union ieee754sp y;
	u32 rm;

	COMPXDP;	

	EXPLODEXDP;

	ieee754_clearcx();

	FLUSHXDP;

	switch (xc) {
	case IEEE754_CLASS_SNAN:
		x = ieee754dp_nanxcpt(x);
		EXPLODEXDP;
		/* Fall through.  */
	case IEEE754_CLASS_QNAN:
		{
			COMPYSP;

			y = ieee754sp_nan_fdp(xs, xm);
			if (!ieee754_csr.nan2008) {
				EXPLODEYSP;
				if (!ieee754_class_nan(yc))
					y = ieee754sp_indef();
			}
			return y;
		}

Regards,
Aleksandar
