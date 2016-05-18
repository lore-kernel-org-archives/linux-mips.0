Received: from mailapp01.imgtec.com ([195.59.15.196]:32759 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028204AbcERWfHRsTH7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 19 May 2016 00:35:07 +0200
Date: Wed, 18 May 2016 23:34:57 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v2 2/2] MIPS: CPS: Copy EVA configuration when starting
 secondary VPs.
Message-ID: <20160518223457.GA1529@NP-P-BURTON>
References: <1463587956-9160-1-git-send-email-matt.redfearn@imgtec.com>
 <1463587956-9160-2-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1463587956-9160-2-git-send-email-matt.redfearn@imgtec.com>
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
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20160518223457.zS5j78Lrvo6e--0LyxjZdztsf13TfAvizJKbFtPQnZk@z>

On Wed, May 18, 2016 at 05:12:36PM +0100, Matt Redfearn wrote:
> When starting secondary VPEs which support EVA and the SegCtl registers,
> copy the memory segmentation configuration from the running VPE to ensure
> that all VPEs in the core have a consistent virtual memory map.
> 
> The EVA configuration of secondary cores is dealt with when starting the
> core via the CM.
> 
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
> ---
> 
> Changes in v2:
> - Skip check for config3 existing - we know it must to be doing
> multithreading
> - Use a unique lable name in the function
> 
>  arch/mips/kernel/cps-vec.S | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
> index ac81edd44563..f8eae9189e38 100644
> --- a/arch/mips/kernel/cps-vec.S
> +++ b/arch/mips/kernel/cps-vec.S
> @@ -431,6 +431,21 @@ LEAF(mips_cps_boot_vpes)
>  	mfc0	t0, CP0_CONFIG
>  	mttc0	t0, CP0_CONFIG
>  
> +	/*
> +	 * Copy the EVA config from this VPE if the CPU supports it.
> +	 * CONFIG3 must exist to be running MT startup - just read it.
> +	 */
> +	mfc0	t0, CP0_CONFIG, 3
> +	and	t0, t0, MIPS_CONF3_SC

Tiny nit - I'd prefer "andi" here since we're using an immediate. The
assembler will figure it out though, so it's not a big deal.

For both in the series:

    Reviewed-by: Paul Burton <paul.burton@imgtec.com>

Thanks,
    Paul

> +	beqz	t0, 3f
> +	 nop
> +	mfc0    t0, CP0_SEGCTL0
> +	mttc0	t0, CP0_SEGCTL0
> +	mfc0    t0, CP0_SEGCTL1
> +	mttc0	t0, CP0_SEGCTL1
> +	mfc0    t0, CP0_SEGCTL2
> +	mttc0	t0, CP0_SEGCTL2
> +3:
>  	/* Ensure no software interrupts are pending */
>  	mttc0	zero, CP0_CAUSE
>  	mttc0	zero, CP0_STATUS
> -- 
> 2.5.0
> 
