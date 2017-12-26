Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:52841 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990408AbdLZPPGB8afj convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 26 Dec 2017 16:15:06 +0100
From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH 1/2] MIPS: math-emu: Do not export function `srl128`
Date: Tue, 26 Dec 2017 15:14:54 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEEC2826A@MIPSMAIL01.mipstec.com>
References: <20171226104554.19612-1-malat@debian.org>
In-Reply-To: <20171226104554.19612-1-malat@debian.org>
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

> Fix non-fatal warning:
> 
> arch/mips/math-emu/dp_maddf.c:19:6: warning: no previous prototype for ‘srl128’ [-Wmissing-prototypes]
>  void srl128(u64 *hptr, u64 *lptr, int count)
> 
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  arch/mips/math-emu/dp_maddf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/math-emu/dp_maddf.c b/arch/mips/math-emu/dp_maddf.c
> index 7ad79ed411f5..0e2278a47f43 100644
> --- a/arch/mips/math-emu/dp_maddf.c
> +++ b/arch/mips/math-emu/dp_maddf.c
> @@ -16,7 +16,7 @@
>  
>  
>  /* 128 bits shift right logical with rounding. */
> -void srl128(u64 *hptr, u64 *lptr, int count)
> +static void srl128(u64 *hptr, u64 *lptr, int count)
>  {
>          u64 low;
>  
> -- 
> 2.11.0

Acked-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
