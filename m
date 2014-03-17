Received: from mailapp01.imgtec.com ([195.89.28.115]:41449 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6867486AbaCQOlKc1asu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Mar 2014 15:41:10 +0100
Message-ID: <5327097E.4090709@imgtec.com>
Date: Mon, 17 Mar 2014 14:41:02 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] MIPS: Fix syscall tracing interface
References: <1395054853-3465-1-git-send-email-larper@axis.com>
In-Reply-To: <1395054853-3465-1-git-send-email-larper@axis.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Lars Persson <lars.persson@axis.com>, linux-mips@linux-mips.org
Cc: Lars Persson <larper@axis.com>
Message-ID: <20140317144102.jeFZQoj6r4wax8QE5EubMVwdfDbFXp8-PInOhiVc9n0@z>

Hi Lars,

On 03/17/2014 11:14 AM, Lars Persson wrote:
> Fix pointer computation for stack-based arguments.
>
> Signed-off-by: Lars Persson <larper@axis.com>
> ---
>   arch/mips/include/asm/syscall.h |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> index c71e40a..6c488c8 100644
> --- a/arch/mips/include/asm/syscall.h
> +++ b/arch/mips/include/asm/syscall.h
> @@ -51,14 +51,14 @@ static inline unsigned long mips_get_syscall_arg(unsigned long *arg,
>
>   #ifdef CONFIG_32BIT
>   	case 4: case 5: case 6: case 7:
> -		return get_user(*arg, (int *)usp + 4 * n);
> +		return get_user(*arg, (int *)usp + n);
>   #endif
>
>   #ifdef CONFIG_64BIT
>   	case 4: case 5: case 6: case 7:
>   #ifdef CONFIG_MIPS32_O32
>   		if (test_thread_flag(TIF_32BIT_REGS))
> -			return get_user(*arg, (int *)usp + 4 * n);
> +			return get_user(*arg, (int *)usp + n);
>   		else
>   #endif
>   			*arg = regs->regs[4 + n];
>

Thanks for the v2.

It looks good to me but I haven't tested it.

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
