Received: from mailapp01.imgtec.com ([195.59.15.196]:41588 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6835073AbaEUJmK4ia10 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 May 2014 11:42:10 +0200
Message-ID: <537C741F.60104@imgtec.com>
Date: Wed, 21 May 2014 10:38:39 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 05/15] MIPS: Don't build fast TLB refill handler with
 32-bit kernels.
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400597236-11352-6-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-6-git-send-email-andreas.herrmann@caviumnetworks.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
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
To: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, linux-mips@linux-mips.org
Cc: David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521093839.4v1SSk-tG-8XE_ib6KwLY37IXopEttSlNVH-5rli6Tg@z>

On 20/05/14 15:47, Andreas Herrmann wrote:
> From: David Daney <david.daney@cavium.com>
> 
> The fast handler only supports 64-bit kernels.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> ---
>  arch/mips/mm/tlbex.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> index ee88367..781e183 100644
> --- a/arch/mips/mm/tlbex.c
> +++ b/arch/mips/mm/tlbex.c
> @@ -1250,13 +1250,17 @@ static void build_r4000_tlb_refill_handler(void)
>  	unsigned int final_len;
>  	struct mips_huge_tlb_info htlb_info __maybe_unused;
>  	enum vmalloc64_mode vmalloc_mode __maybe_unused;
> -
> +#ifdef CONFIG_64BIT
> +	bool is64bit = true;
> +#else
> +	bool is64bit = false;
> +#endif
>  	memset(tlb_handler, 0, sizeof(tlb_handler));
>  	memset(labels, 0, sizeof(labels));
>  	memset(relocs, 0, sizeof(relocs));
>  	memset(final_handler, 0, sizeof(final_handler));
>  
> -	if ((scratch_reg >= 0 || scratchpad_available()) && use_bbit_insns()) {
> +	if (is64bit && (scratch_reg >= 0 || scratchpad_available()) && use_bbit_insns()) {
>  		htlb_info = build_fast_tlb_refill_handler(&p, &l, &r, K0, K1,
>  							  scratch_reg);
>  		vmalloc_mode = refill_scratch;
> 

This looks like a good place to use IS_ENABLED(CONFIG_64BIT) to reduce
ifdefery.

Cheers
James
