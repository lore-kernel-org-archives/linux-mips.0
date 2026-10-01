Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9093B71CC;
	Thu,  1 Oct 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856778; cv=none; b=cJLFxiZ6qXJVLl+4ESmfY/mgWLYMKy/9gjrMJO+tAxWfW2bNBvK1YvYmGLXBaEa94qDf6it4QWn/kMOhXN7Vldj3P/vCJwhhBQrF6QKyIodZ07FByzj5NteZYcuBLvcDplmG5UiR9AuLte+UkVDyB5nkshXJmw+6ZUeI1SkwEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856778; c=relaxed/simple;
	bh=o18IV4zOtC20tUpw2bNMBkrDUv8rwqxXfGNlGHNF5zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfimSSu8QhKFgNlMIPx00ZpfVM+NlAeWtbcIy5oGLjQG99JGTd7bNFtpFIsGQuPYKPuew0jGjy06tj8lzuD7UEIdBqEQ+TNzLOXQ/KUTY8cS6da4AH3bVeobLlmekvdILfVfcBIxW9zgqXyxGPCm95TlGfl4gdDbATCfZ6ypMGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xCFeU-00010i-00; Thu, 01 Oct 2026 14:12:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 5BDF3C02BE; Thu,  1 Oct 2026 14:11:53 +0200 (CEST)
Date: Thu, 1 Oct 2026 14:11:53 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aristo Chen <aristo.chen@canonical.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: GT64120: Remove duplicate GT_PCI1M1LD_OFS and
 GT_PCI1M1HD_OFS
Message-ID: <ar5OCUOixCsB1hD_@alpha.franken.de>
References: <20261001053016.76578-1-aristo.chen@canonical.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001053016.76578-1-aristo.chen@canonical.com>

On Thu, Oct 01, 2026 at 05:30:15AM +0000, Aristo Chen wrote:
> The GT_PCI1M1LD_OFS and GT_PCI1M1HD_OFS register offsets are defined
> twice in a row with identical values. Identical macro redefinitions are
> valid C, so the compiler never warned about it. Drop the second copy.
> 
> No functional change.
> 
> Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
> ---
>  arch/mips/include/asm/gt64120.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/include/asm/gt64120.h b/arch/mips/include/asm/gt64120.h
> index 5d68d726598a..2ad770ff3c56 100644
> --- a/arch/mips/include/asm/gt64120.h
> +++ b/arch/mips/include/asm/gt64120.h
> @@ -45,8 +45,6 @@
>  #define GT_PCI1M0HD_OFS		0x0a8
>  #define GT_PCI1M1LD_OFS		0x0b0
>  #define GT_PCI1M1HD_OFS		0x0b8
> -#define GT_PCI1M1LD_OFS		0x0b0
> -#define GT_PCI1M1HD_OFS		0x0b8
>  
>  #define GT_SCS10AR_OFS		0x0d0
>  #define GT_SCS32AR_OFS		0x0d8
> 
> base-commit: f552e14f77bfce3e7ee0bb268ab023951baec3ff
> -- 
> 2.53.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
