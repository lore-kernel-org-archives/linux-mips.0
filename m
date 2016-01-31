Received: from mailapp01.imgtec.com ([195.59.15.196]:43252 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007295AbcAaXfYS0hKA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 1 Feb 2016 00:35:24 +0100
Date: Sun, 31 Jan 2016 23:33:30 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Fix buffer overflow in syscall_get_arguments()
In-Reply-To: <1453753923-26620-1-git-send-email-james.hogan@imgtec.com>
Message-ID: <alpine.DEB.2.00.1601312327590.5958@tp.orcam.me.uk>
References: <1453753923-26620-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Milko Leporis <milko.leporis@imgtec.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20160131233330.FPxpcFnxhpqjkudBfpSmT2JPTuE_FcLBf71bjqSJWLg@z>

On Mon, 25 Jan 2016, James Hogan wrote:

> Since commit 4c21b8fd8f14 ("MIPS: seccomp: Handle indirect system calls
> (o32)"), syscall_get_arguments() attempts to handle o32 indirect syscall
> arguments by incrementing both the start argument number and the number
> of arguments to fetch. However only the start argument number needs to
> be incremented. The number of arguments does not change, they're just
> shifted up by one, and in fact the output array is provided by the
> caller and is likely only n entries long, so reading more arguments
> overflows the output buffer.
[...]
> diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
> index 6499d93ae68d..47bc45a67e9b 100644
> --- a/arch/mips/include/asm/syscall.h
> +++ b/arch/mips/include/asm/syscall.h
> @@ -101,10 +101,8 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  	/* O32 ABI syscall() - Either 64-bit with O32 or 32-bit */
>  	if ((config_enabled(CONFIG_32BIT) ||
>  	    test_tsk_thread_flag(task, TIF_32BIT_REGS)) &&
> -	    (regs->regs[2] == __NR_syscall)) {
> +	    (regs->regs[2] == __NR_syscall))
>  		i++;
> -		n++;
> -	}
>  
>  	while (n--)
>  		ret |= mips_get_syscall_arg(args++, task, regs, i++);

 What I think it really needs to do is to *decrease* the number of 
arguments, as we're throwing the syscall number away as not an argument to 
itself.  So this looks like a typo to me, the expression was meant to be 
`n--' rather than `n++'.  With the number of arguments unchanged, as in 
your proposed change, we're still reaching one word too far.

  Maciej
