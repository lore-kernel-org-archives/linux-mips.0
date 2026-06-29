Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFFB3C76AF;
	Mon, 29 Jun 2026 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754805; cv=none; b=UpXlwZjntp/rU0V06yJJSi0KLLrFH4K7mNf9t4ISC+fygrd50PZxhWgc5lwc4vZgSPe7hEiCjWFLY98YB89b011WteaetQp+KVxep/CDHLzRhtDYvBX0U+CjrZUULEPm6+qFlsQeOZn93f2zCr8D3gD5gbBoMelQ9vjpmty8VkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754805; c=relaxed/simple;
	bh=5Xp6Gna+QerBHHtTloQenMnRCJCRT4SCo+ZoZI5cseY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQhbOYUIbHDFfKSsopZWEsBzcGIJ1HYi2QAyi3pMtUiTrBqwQGAtH9dA1alSAIbzY1i/ugF9MiacOUF/CtyV6UkKJbqP6Be9UFDOAmQea1smPngRTM3mIj0RI4xUefv3ObiqGyjvYYISMXCwt+bO8l73FdsBZpYheLGb44WavoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1weFd2-0005iT-00; Mon, 29 Jun 2026 19:18:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 16F44C012A; Mon, 29 Jun 2026 19:12:39 +0200 (CEST)
Date: Mon, 29 Jun 2026 19:12:39 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Bastian Blank <waldi@debian.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Add build salt to the vDSO
Message-ID: <akKnh5c2IIJRAg23@alpha.franken.de>
References: <ajQY5adFB_yOfIl5@steamhammer.waldi.eu.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajQY5adFB_yOfIl5@steamhammer.waldi.eu.org>

On Thu, Jun 18, 2026 at 06:12:21PM +0200, Bastian Blank wrote:
> The vDSO needs to have a unique build id in a similar manner
> to the kernel and modules. Use the build salt macro.
> 
> Signed-off-by: Bastian Blank <waldi@debian.org>
> ---
> I was not able to properly test this change, due to unavailable
> toolchain.
> 
>  arch/mips/vdso/elf.S | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/vdso/elf.S b/arch/mips/vdso/elf.S
> index a25cb147f1ca..821fcffe7655 100644
> --- a/arch/mips/vdso/elf.S
> +++ b/arch/mips/vdso/elf.S
> @@ -8,6 +8,7 @@
>  
>  #include <asm/isa-rev.h>
>  
> +#include <linux/build-salt.h>
>  #include <linux/elfnote.h>
>  #include <linux/version.h>
>  
> @@ -15,6 +16,8 @@ ELFNOTE_START(Linux, 0, "a")
>  	.long LINUX_VERSION_CODE
>  ELFNOTE_END
>  
> +BUILD_SALT
> +
>  /*
>   * The .MIPS.abiflags section must be defined with the FP ABI flags set
>   * to 'any' to be able to link with both old and new libraries.
> -- 
> 2.53.0

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
