Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.225]:41878 "EHLO
        cdptpa-oedge-vip.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27009370AbaIVS0tOYNoX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Sep 2014 20:26:49 +0200
Date: Mon, 22 Sep 2014 14:26:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] MIPS: mcount: Fix selfpc address for static trace
Message-ID: <20140922142642.7f70fb0f@gandalf.local.home>
In-Reply-To: <1411392779-9554-3-git-send-email-markos.chandras@imgtec.com>
References: <1411392779-9554-1-git-send-email-markos.chandras@imgtec.com>
        <1411392779-9554-3-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <rostedt@goodmis.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20140922182642.KzNvAQOqU_H0SaNtFePBlZLzqKfR0OYrQg83kdRPTBA@z>

On Mon, 22 Sep 2014 14:32:59 +0100
Markos Chandras <markos.chandras@imgtec.com> wrote:

> According to Documentation/trace/ftrace-design.txt, the selfpc
> should be the return address minus the mcount overhead (8 bytes).
> This brings static trace in line with the dynamic trace regarding
> the selfpc argument to the tracing function.
> 
> This also removes the magic number '8' with the proper
> MCOUNT_INSN_SIZE.

I could also update the generic code to handle delay slots.

-- Steve

> 
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  arch/mips/kernel/mcount.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
> index 2f7c734771f4..3af48b7c7a47 100644
> --- a/arch/mips/kernel/mcount.S
> +++ b/arch/mips/kernel/mcount.S
> @@ -79,7 +79,7 @@ _mcount:
>  	PTR_S	MCOUNT_RA_ADDRESS_REG, PT_R12(sp)
>  #endif
>  
> -	PTR_SUBU a0, ra, 8	/* arg1: self address */
> +	PTR_SUBU a0, ra, MCOUNT_INSN_SIZE /* arg1: self address */
>  	PTR_LA   t1, _stext
>  	sltu     t2, a0, t1	/* t2 = (a0 < _stext) */
>  	PTR_LA   t1, _etext
> @@ -138,7 +138,7 @@ NESTED(_mcount, PT_SIZE, ra)
>  static_trace:
>  	MCOUNT_SAVE_REGS
>  
> -	move	a0, ra		/* arg1: self return address */
> +	PTR_SUBU a0, ra, MCOUNT_INSN_SIZE	/* arg1: self address */
>  	jalr	t2		/* (1) call *ftrace_trace_function */
>  	 move	a1, AT		/* arg2: parent's return address */
>  
