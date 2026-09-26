Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE9A40F75C;
	Sat, 26 Sep 2026 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419287; cv=none; b=br8spSPuFxPbyeMOtLE96zB+s8mop+4NRBPioJfI6/EPbVl7FuUOybZeMTtOKmyVb+D9XzaSZ2NWpZhPCFut8yMblFTC3QescyG653Q7R1a5JlokVqkm0jxRp2B1CLCJ/V7E/OdZFO00kFKYRFRgfDvPmQNckqfvH5z/riAXo+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419287; c=relaxed/simple;
	bh=BdvZ8nvsueNuBqlysy76XB/afq+8/Nb5k6Hi6XxtnN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMTaRDQ0UJ33Bsd4i08lXZuM3ePMwiWyAnfNJBev01zXDDH5i3hJ15nMf0ngTmYfFF/XzN55uGTVGfCB6MXCRv61rzL1QnzyHhnLSn+DLyfJ46KBkFtJvjn2EnO5LA3GxU5BuUtg4j3IynUG6LJa/rFx07H+EPNTsa0l3GUzXao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4O-0007Ki-00; Sat, 26 Sep 2026 11:51:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 22A25C02BE; Sat, 26 Sep 2026 11:31:38 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:31:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Anthony Iliopoulos <ailiop@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: remove unused setup_profiling_timer function
Message-ID: <areQ-kja7OR-EjfA@alpha.franken.de>
References: <20260820124906.144352-1-ailiop@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820124906.144352-1-ailiop@suse.com>

On Thu, Aug 20, 2026 at 02:49:04PM +0200, Anthony Iliopoulos wrote:
> setup_profiling_timer() is not used by any code at this point. Since a
> default weak implementation exists, there is no need to keep this
> arch-specific definition around. Remove it along with the now-redundant
> profile header includes.
> 
> Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
> ---
>  arch/mips/kernel/smp.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 0f28b4a62e72..7f4b395b090d 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -10,7 +10,6 @@
>  #include <linux/delay.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> -#include <linux/profile.h>
>  #include <linux/smp.h>
>  #include <linux/spinlock.h>
>  #include <linux/threads.h>
> @@ -487,14 +486,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>  }
>  #endif
>  
> -#ifdef CONFIG_PROFILING
> -/* Not really SMP stuff ... */
> -int setup_profiling_timer(unsigned int multiplier)
> -{
> -	return 0;
> -}
> -#endif

the weak implementation returns -EINVAL, which then fails the
write_profile() call. This is a different bahvavior then the code
above. Do I miss something ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
