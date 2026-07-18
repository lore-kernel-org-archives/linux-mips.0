Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B03D9022
	for <linux-mips@vger.kernel.org>; Sat, 18 Jul 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784388219; cv=none; b=i23xjePRncv1+ytDi0o58htOWPZxLuRVj1LO+HXc8ZK+5NkCGElSzTeCRorYRoGKW9m7ROQjdVDgGLbXcZa1PM8emBmDNqldXVMQZ4TAQpP1cVEch2uLXvEnnMk9s8aD1jzJbBTvc4y0LgotxDBvCXEjtGhkFXGm74l+nah3CgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784388219; c=relaxed/simple;
	bh=BxOc+P2cYz1TULPiWVbhGaT/Tfs/xqhjzztbQD5tN+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVreToNjgKCMD2JaaoDtErgvPNai7Pyjn2ZEbd4u6AO3xyhfxtLknVzFDfhGmAOPZlWtMCA3ECdaKbY8c16XHtL8IYqEJQOVhW84IBhWAKWY2TrACnMujl/s3VBoyYVB18tr36NlWeVAOBZkNOYh+KxmDtTXDWCMXi3o/o8SCjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NuUfnxQi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NuUfnxQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784388213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xAGhW0qGGS6bImxALSIlIu+AR7DBr6ToCi1mFcVfN94=;
	b=NuUfnxQiCodZrWb9VnyrrXH74ve+xlHzKo+qH3CLMx6Ru4YI43oefJPRTSLiap6ov2gTBl
	XUHBdxTA4uxBUEfTvVkbPkaQhCE/yNrLcQU+PvhEXn5KVFwsOoBR37sVI+iLuqrJH0OTIJ
	c1ZquX77Mh2CQb6tB7Lfo9qgqnkt6Jg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-297-cJjFiycHPOSw4TwFrGvGcA-1; Sat,
 18 Jul 2026 11:23:27 -0400
X-MC-Unique: cJjFiycHPOSw4TwFrGvGcA-1
X-Mimecast-MFC-AGG-ID: cJjFiycHPOSw4TwFrGvGcA_1784388206
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3BECE1955D8E;
	Sat, 18 Jul 2026 15:23:26 +0000 (UTC)
Received: from fedora (unknown [10.44.49.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 0F8571954221;
	Sat, 18 Jul 2026 15:23:23 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat, 18 Jul 2026 17:23:25 +0200 (CEST)
Date: Sat, 18 Jul 2026 17:23:22 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: James Hogan <jhogan@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ptrace: Fix syscall skipping via PTRACE_SYSCALL
Message-ID: <aluaasodc1tSCxtl@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

I obviously can't ack the mips-specific change, but it looks good to me.

Thomas, thanks again.

Oleg.

On 07/17, Thomas Bogendoerfer wrote:
>
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
> 

