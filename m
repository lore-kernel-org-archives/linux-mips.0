Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096DF43B48C
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622634; cv=none; b=YrBTJo+24NyFkwFmIZr8Yprkm6qnPYGQQgNb2YvAycLma5hTWyQUVpckNyOFnGZkOkCQ6P2JZPS1S/n74OhhRriYDkyQvB7tvvepWC9iVjEjGbHg/ziij/SrZSp10JppG8cjnwRSR4lDoYISppAoPCBL1H5IJjfq/7aCqwH+6Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622634; c=relaxed/simple;
	bh=5522vd31FFvseMtFKZmNLN0MO3Bnoibk1qUMw3Ml4Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ8pLwRuBuIblv418epjwmdVRD70UwNgwqJCp2rftOR3omwB93dvIBxIwimT99snQrqgqszFKWn31ypGTgL6VClt8xvZaVnXHnsz9JWvLfD/01nUYRpvRQzNN0z2IQaEd/dRZW+NUXTs4L8KT3b7lZZtERGR9WLNYDTwmD5ogYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riRQKuR+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riRQKuR+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-382ef647e20so262522a91.1
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622632; x=1784227432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=riRQKuR+XX2MFtODdxhiHEdB6Za+0kzqtImMsil4VbDuA817S5zqgMg4uvu6P96FE7
         7JDwU6IFNZWY+m5inz7S1JRNEV0pJq1SuNE4iMk5XqvbhYLLkn0bjNBxwUf9qOUN2Riz
         HM0IH5hgCgsqi8gYgjgMP7Xd2SZ3DtTjvWBDs/srg8sOh/E+PRqxOd2wQwj3ckbekDbW
         BTHjh4M1wqSW8OSNoDIskaYzem2+TgNitTvM5S8O01RWbtvA2hWMp5LAUmO5AyghuAfb
         EFNNKlzrlZxq30FBfoVXPInHkqfdJZCaBlM7q8/aHgjUHzb/iYK8b0pMrmGC8qtLfb/p
         ekYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622632; x=1784227432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=UiB5g0nCUNa98rpFGIW9cb1EjQzolMnuY2C2YfF3lRDwhRTt5tiT8vA3uNXcfrTQ1d
         I8ZevbQ53syl9VbwDqx+IffXYoKhWyFxJb2NcLYnZ43XBfJNEO/XI5/wVfL9zwgdpZ5l
         +OIabOXAJyLbo6ciIfL7gtN7yx3bi1eAw6BwuH8Pm+jwoDBX0qfBIGw6JqAdPQSgmYXS
         OUdiHYNm89ADmvAPjtDcgrLySEcEO5IXG2hVkMk+c8/WFYvaZF6LjyN8SwzGU7Ps6bjS
         xNo9xSnBfLHVANBavLPJqG9u0mTtZEQ1KyTGbsntMDlMtbRK0eAKgf2YGBDnNVS7tPYY
         kaZg==
X-Forwarded-Encrypted: i=1; AHgh+RogVhhKSuedaGlrE2+6NMDPo1IrOsrVK12rqyCMCFFKudi1apuHFohauO4nvuOFcr7CNGoxPwSxPCoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKwIvcqLA24ixjXe4JAehhFF5e3wVcHFgMetqTuo3wSz8SoFWI
	a6QTTYt1UfBa5qptrmLDDvoBjgKLrYkdZRf4V59edYJBQxwPfxGGEd47
X-Gm-Gg: AfdE7cmL8WkyMXI6QB91yQ77yCLl6CHMsxvIZoiS4wYEfpl+ojhNdVvg/0t/gPkGkDW
	v9kEqJxThYVcCy7jMNClrc40hQ0B1FjM6gs9BAOgnDj2JXRjj5haSQ5dWSS0zRk1oKRT2j+RGah
	zxEnVB8KIOrHi7zS7U4r/nvX6Y8AC/EM1U3JPWP5AR1c+ujOAFJf/J4dPwSHRFjKDMq1GdAQvNc
	6UFvqnmYpS+k4zhyyQ5yJZwxWBDJUbwZ8yIkg0v2kuxl56iksRAJ/LZf0ba12X+Q1Y+EiveOVP1
	ix53QpHALmscqocN3rUdyXPIR5lMMewW/bUCjt9Rn53ZvqM4uVNPgre95/VAeBmAR0SdZej57L4
	lDOowFTqk4Qd5SFkStNKR3rPhaF9X1uAz8cuKLuZHFqui9vcLBLrJgTZ+q+nsJ483lefNSPX//z
	/XlPQ/zWWLWQ6O+azklrHh9kgV7sHyGmYMeK3H9xGvlYniP4WsxpEp48IHLI2z
X-Received: by 2002:a17:90b:564d:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38943d404dfmr8538131a91.43.1783622632431;
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm35673867eec.30.2026.07.09.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:13:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
Message-ID: <ak_rx2gFCLtG-Qpy@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.030598804@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.030598804@kernel.org>

On Tue, Jul 07, 2026 at 09:06:23PM +0200, Thomas Gleixner wrote:
> enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
> the subsequent invocation of add_random_kstack_offset_irqsoff().
> 
> As a bonus this avoids the overhead of get/put_cpu_var() in
> add_random_kstack_offset().
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/kernel/syscall.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
>  {
>  	unsigned long nr;
>  
> -	enter_from_user_mode(regs);
> -	add_random_kstack_offset();
> +	enter_from_user_mode_randomize_stack(regs);
> +
>  	regs->psw = get_lowcore()->svc_old_psw;
>  	regs->int_code = get_lowcore()->svc_int_code;
>  	update_timer_sys();
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
