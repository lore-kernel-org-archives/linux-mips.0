Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAA732D0D8;
	Fri, 30 Jan 2026 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783903; cv=none; b=bHj7NTGa5ZfH2H56iZqZBAsycBKIVajDpYnyTk1hMfuiFjkZvZPhYa9l2p4sKcbd8mxXKikgFRAIcBFdNlq5AkZx8rUyfFcelyNt0CvOjy8YeTHwSdxDgZ+I4GjDxNeBhp5eRZTcYc53OdhkgNRR00Gt1ffW6LLyn6TvO3Q6w5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783903; c=relaxed/simple;
	bh=2tMmb1Coa4kTr6gZQ72agTZZJTOnqg7sJtNF1SmIMmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyqbdYWqdw/TU5avfCormmwCqZkXJ2ceCAq3BzhWIw5RlaxZTpSy9heor6xnE7JRqd3qw4rkuYUpSecNdBD2X8zWGLxirrcg1bmqkBmUVGFrYf6bCkLF+NV+/6BUpFDvtRb0/NABnuX0FhEe46KbRcrPwRHmNXr8Sfftgp2Z28U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vlpdb-0007Er-00; Fri, 30 Jan 2026 15:38:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id EADF8C061A; Fri, 30 Jan 2026 15:34:29 +0100 (CET)
Date: Fri, 30 Jan 2026 15:34:29 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: LOONGSON32: drop a dangling Kconfig symbol
Message-ID: <aXzBdfjPC0patZd9@alpha.franken.de>
References: <20251228190443.2479978-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228190443.2479978-1-rdunlap@infradead.org>

On Sun, Dec 28, 2025 at 11:04:43AM -0800, Randy Dunlap wrote:
> CPU_GAS_LOAD_STORE_LR is not used anywhere in the kernel sources,
> so drop it.
> 
> Fixes: 85c4354076ca ("MIPS: loongson32: Switch to generic core")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> 
>  arch/mips/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- linux-next-20251219.orig/arch/mips/Kconfig
> +++ linux-next-20251219/arch/mips/Kconfig
> @@ -1408,7 +1408,6 @@ config CPU_LOONGSON32
>  	select CPU_MIPS32
>  	select CPU_MIPSR2
>  	select CPU_HAS_PREFETCH
> -	select CPU_HAS_LOAD_STORE_LR
>  	select CPU_SUPPORTS_32BIT_KERNEL
>  	select CPU_SUPPORTS_HIGHMEM
>  	select CPU_SUPPORTS_CPUFREQ

applied to mips-next with the typo fixed
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
