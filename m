Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415C740DFBD;
	Mon,  3 Aug 2026 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762950; cv=none; b=SVnItAvESWvAMvVDHUvM5jE3vrRZBxH4HQAePkWj1TFPZ98jhRdRdRcUBaM/snUlQzxP8ROaAyF/YHxlJWtOd2VR16oRqf3lrGK/1CsBX5TCbdT96eJWSNGuO6QGHkAE+oUye+qwlmveCDBdiGtm99syJqfLoMfuRgVl52WnsCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762950; c=relaxed/simple;
	bh=dEoQ5g69d9PextxhfJTgvDxOBYt4mQ+NSzdrh9skUQ4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPo2ayPNf8OrUKkJ8+MD7+qKliRtXIrmUZDjx9AO41kLg1t+x9tHT52e8ZHrmDuAoMwJbE45TMVtuJIs22TKaxPe526XZ4PKBJDr4G/fzWOMenphnSFFhqWO3vRzldIVr3L5kuG5/zdUAxXepQ+8RkCmse+WYVzlw0ITDVIz5Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wqsW1-0002bx-00; Mon, 03 Aug 2026 15:15:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6363EC02DA; Mon,  3 Aug 2026 15:15:00 +0200 (CEST)
Date: Mon, 3 Aug 2026 15:15:00 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Oleg Nesterov <oleg@redhat.com>, James Hogan <jhogan@kernel.org>,
	Kees Cook <kees@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ptrace: Fix syscall skipping via PTRACE_SYSCALL
Message-ID: <anCUVDXlRLPspx11@alpha.franken.de>
References: <20260717112731.59254-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717112731.59254-1-tsbogend@alpha.franken.de>

On Fri, Jul 17, 2026 at 01:27:31PM +0200, Thomas Bogendoerfer wrote:
> If tracer wanted to skip a syscall return value was always
> overwritten with -ENOSYS. Fix this by checking against original
> syscall number and only return -ENOSYS, if it is negative.
> 
> Fixes: b6318a903d06 ("MIPS/ptrace: Pick up ptrace/seccomp changed syscalls")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/ptrace.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
> index 3f4c94c88124..87102a03b6ea 100644
> --- a/arch/mips/kernel/ptrace.c
> +++ b/arch/mips/kernel/ptrace.c
> @@ -1321,8 +1321,12 @@ long arch_ptrace(struct task_struct *child, long request,
>   */
>  asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>  {
> +	long syscall;
> +
>  	user_exit();
>  
> +	syscall = current_thread_info()->syscall;
> +
>  	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
>  		if (ptrace_report_syscall_entry(regs))
>  			return -1;
> @@ -1342,7 +1346,7 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
>  	 * Negative syscall numbers are mistaken for rejected syscalls, but
>  	 * won't have had the return value set appropriately, so we do so now.
>  	 */
> -	if (current_thread_info()->syscall < 0)
> +	if (syscall < 0)
>  		syscall_set_return_value(current, regs, -ENOSYS, 0);
>  	return current_thread_info()->syscall;
>  }
> -- 
> 2.51.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
