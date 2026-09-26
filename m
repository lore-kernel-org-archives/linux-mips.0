Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1890140E8E1
	for <linux-mips@vger.kernel.org>; Sat, 26 Sep 2026 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419346; cv=none; b=kUCj9J+qxsDbE1/epzHgRW1B76fTIwlg3oO67LDqzrQLjC3250qPqjrKx6J54Iwwt/YdBxNSjuDii4kthxIKaExNSWVqp+vt+uPUzhWm8rnZJ4VMWg2O95/sQLQcE2ack8+A069iXdNvT8l5hDrNHpYjssFaqwkEO18d2JXzR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419346; c=relaxed/simple;
	bh=+07w6JjY58dtcufoJoODclJ70hNsIdXyqi8uX/5ZTOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ra1wP0aSgoNlG147uZClfPLpqU1+0igVarblFaEm8oOdMaeJI2kHlZsFtXStGSNeVak/w6f4nVEeYJgGuK5mIGrEkMdCOR6r+MrBdUKYdWj/WcsFnEJyAvPmECpxcyXne+zpjMXFPZzWw4b+bWCaZd+FeeXsboOwyd3RegcGG5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4P-0007Lf-00; Sat, 26 Sep 2026 11:51:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E5F0DC0D20; Sat, 26 Sep 2026 11:40:07 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:40:07 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: remove unused <asm/cmp.h> header
Message-ID: <areS94zPwkUAdtMQ@alpha.franken.de>
References: <20260918060628.996925-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918060628.996925-1-enelsonmoore@gmail.com>

On Thu, Sep 17, 2026 at 11:06:22PM -0700, Ethan Nelson-Moore wrote:
> arch/mips/include/asm/cmp.h appears never to have been used by the
> kernel. CMP support was removed in commit 7fb6f7b0af67 ("MIPS: Remove
> deprecated CONFIG_MIPS_CMP"), but it was left behind. Remove it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/mips/include/asm/cmp.h | 10 ----------
>  1 file changed, 10 deletions(-)
>  delete mode 100644 arch/mips/include/asm/cmp.h
> 
> diff --git a/arch/mips/include/asm/cmp.h b/arch/mips/include/asm/cmp.h
> deleted file mode 100644
> index 71e20e6cd38d..000000000000
> --- a/arch/mips/include/asm/cmp.h
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_CMP_H
> -#define _ASM_CMP_H
> -
> -/*
> - * Definitions for CMP multitasking on MIPS cores
> - */
> -struct task_struct;
> -
> -#endif /*  _ASM_CMP_H */
> -- 
> 2.43.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
