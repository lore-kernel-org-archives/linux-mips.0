Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0B63A7580
	for <linux-mips@vger.kernel.org>; Sat, 26 Sep 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419318; cv=none; b=GrixsEI0n75wmu2fleSSqlLAaX76el3iug6A5YWBXg22vI0zRUAIR7cK0BjC+f8KBMilo2xMGPLyXDG+AHBcfpr2TZrr83jR+0HzeNy6H/wVDiCT7uDmSY3U/eBEtbghuXWA4cX1NIefM2Vl0+tVDJa4EqGZQqtBnkNqfmxCHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419318; c=relaxed/simple;
	bh=PW+0RTynD5W4LVJZa+oZWJzTRgOu3Ro4LYwegIzis8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhf3XQjxZ3I4rEgFy7cJpGWlnuO+Z8Q3tYYYH3LiH+EMTeGe3bUS89X1PVCsM3Zzd8/GBM6T0Vj20QOh6dX9YvodAm0GXxav6eFJ0UdM5Z+JgDexYwbIgU8DeB2GU/EWbX3fCSIy+hKLTR1ZLQzTJzNFuZy03RTwUI+clMFp54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4P-0007LT-00; Sat, 26 Sep 2026 11:51:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 53C7CC0CE9; Sat, 26 Sep 2026 11:38:04 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:38:04 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: remove unused <asm/amon.h> header
Message-ID: <areSfI6haTEVitBy@alpha.franken.de>
References: <20260918025757.389718-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918025757.389718-1-enelsonmoore@gmail.com>

On Thu, Sep 17, 2026 at 07:57:51PM -0700, Ethan Nelson-Moore wrote:
> The last use of arch/mips/include/asm/amon.h was removed in
> commit 7fb6f7b0af67 ("MIPS: Remove deprecated CONFIG_MIPS_CMP"),
> but it was left behind. Remove it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/mips/include/asm/amon.h | 12 ------------
>  1 file changed, 12 deletions(-)
>  delete mode 100644 arch/mips/include/asm/amon.h
> 
> diff --git a/arch/mips/include/asm/amon.h b/arch/mips/include/asm/amon.h
> deleted file mode 100644
> index 3cc03c64a9c7..000000000000
> --- a/arch/mips/include/asm/amon.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -/*
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file "COPYING" in the main directory of this archive
> - * for more details.
> - *
> - * Copyright (C) 2013 Imagination Technologies Ltd.
> - *
> - * Arbitrary Monitor Support (AMON)
> - */
> -int amon_cpu_avail(int cpu);
> -int amon_cpu_start(int cpu, unsigned long pc, unsigned long sp,
> -		   unsigned long gp, unsigned long a0);
> -- 
> 2.43.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
