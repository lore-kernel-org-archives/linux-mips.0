Received: from mailapp01.imgtec.com ([195.59.15.196]:32729 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990522AbdFUGwnZ1qXY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jun 2017 08:52:43 +0200
Subject: Re: [PATCH] Partially revert "MIPS: Remove old core dump functions"
References: <1497991165-31361-1-git-send-email-minyard@acm.org>
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <e21ffb18-e44d-4e8a-f9ec-8dd042b68edc@imgtec.com>
Date: Wed, 21 Jun 2017 08:52:36 +0200
MIME-Version: 1.0
In-Reply-To: <1497991165-31361-1-git-send-email-minyard@acm.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: minyard@acm.org, Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex@alex-smith.me.uk>
Cc: linux-mips@linux-mips.org, David Daney <ddaney@caviumnetworks.com>, Corey Minyard <cminyard@mvista.com>
Message-ID: <20170621065236.r7KBFIy6d4Ds3Xze1RY5Meo2OUeRebOQditGqKEXt7o@z>

Hi Corey,

On 20.06.2017 22:39, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> This reverts part of commit 30852ad0039b4a54b5062efd66877125e519dc30,
> which removed some ELF coredump functions from MIPS.  They are no
> longer needed for normal coredumps, but they are still needed for
> kdump.  The kernel crashes when doing a kdump shutdown because
> elf_core_copy_kernel_regs() needs a MIPS-specific version and the
> reverted commit removes it.
> 
> This change adds back in ELF_CORE_COPY_REGS() and the required
> support for it.


A similar fix has been merged some time ago already:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=39a3cb27c123df8e8461291cc9e86f1ac3f0ea06

Marcin


> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>   arch/mips/include/asm/elf.h |  7 +++++++
>   arch/mips/kernel/process.c  | 22 ++++++++++++++++++++++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
> index 2b3dc29..600db7b 100644
> --- a/arch/mips/include/asm/elf.h
> +++ b/arch/mips/include/asm/elf.h
> @@ -414,6 +414,13 @@ do {									\
>   
>   #endif /* CONFIG_64BIT */
>   
> +struct pt_regs;
> +
> +extern void elf_dump_regs(elf_greg_t *, struct pt_regs *regs);
> +
> +#define ELF_CORE_COPY_REGS(elf_regs, regs)                     \
> +       elf_dump_regs((elf_greg_t *)&(elf_regs), regs);
> +
>   #define CORE_DUMP_USE_REGSET
>   #define ELF_EXEC_PAGESIZE	PAGE_SIZE
>   
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index fbbf5fc..0d63aa1 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -180,6 +180,28 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
>   	return 0;
>   }
>   
> +void elf_dump_regs(elf_greg_t *gp, struct pt_regs *regs)
> +{
> +	int i;
> +
> +	for (i = 0; i < EF_R0; i++)
> +		gp[i] = 0;
> +	gp[EF_R0] = 0;
> +	for (i = 1; i <= 31; i++)
> +		gp[EF_R0 + i] = regs->regs[i];
> +	gp[EF_R26] = 0;
> +	gp[EF_R27] = 0;
> +	gp[EF_LO] = regs->lo;
> +	gp[EF_HI] = regs->hi;
> +	gp[EF_CP0_EPC] = regs->cp0_epc;
> +	gp[EF_CP0_BADVADDR] = regs->cp0_badvaddr;
> +	gp[EF_CP0_STATUS] = regs->cp0_status;
> +	gp[EF_CP0_CAUSE] = regs->cp0_cause;
> +#ifdef EF_UNUSED0
> +	gp[EF_UNUSED0] = 0;
> +#endif
> +}
> +
>   #ifdef CONFIG_CC_STACKPROTECTOR
>   #include <linux/stackprotector.h>
>   unsigned long __stack_chk_guard __read_mostly;
> 
