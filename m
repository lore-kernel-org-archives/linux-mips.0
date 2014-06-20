Received: from mailapp01.imgtec.com ([195.59.15.196]:31823 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6859944AbaFTJyeJE4y1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 20 Jun 2014 11:54:34 +0200
Message-ID: <53A404D2.3030303@imgtec.com>
Date: Fri, 20 Jun 2014 10:54:26 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips: n32: use compat getsockopt syscall
References: <1403250786-9763-1-git-send-email-sdumitru@ixiacom.com>
In-Reply-To: <1403250786-9763-1-git-send-email-sdumitru@ixiacom.com>
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
To: Sorin Dumitru <sdumitru@ixiacom.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20140620095426.bZ1ciQsOOSyeanZGcr4kc99i3K2hio-1Zr459OzJ1TQ@z>

On 20/06/14 08:53, Sorin Dumitru wrote:
> Signed-off-by: Sorin Dumitru <sdumitru@ixiacom.com>

A little more commit message wouldn't hurt. Did it break a particular
program?

It's consistent with compat_sys_socketcall(), include/uapi/asm/unistd.h,
and commit 515c7af85ed9 (which does same thing for x32) though so it
looks good to me.

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> ---
>  arch/mips/kernel/scall64-n32.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
> index c1dbcda..e543861 100644
> --- a/arch/mips/kernel/scall64-n32.S
> +++ b/arch/mips/kernel/scall64-n32.S
> @@ -162,7 +162,7 @@ EXPORT(sysn32_call_table)
>  	PTR	sys_getpeername
>  	PTR	sys_socketpair
>  	PTR	compat_sys_setsockopt
> -	PTR	sys_getsockopt
> +	PTR	compat_sys_getsockopt
>  	PTR	__sys_clone			/* 6055 */
>  	PTR	__sys_fork
>  	PTR	compat_sys_execve
> 
