Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893544;
	b=uaimJ3SnxUCLtLbDQ35xYRZISnIAyaG5G1osu1UKcFAQfGFquu01uaEMmZRv4536/gp2
	 cVHPH4bKJQGg5cLLAWWNtRucOXZQ9bahIJur/CrLIs3UCUveGhVHXALN1Zs2HThUpcaeG
	 V4jb7zHDsVzOZOp9O25c/HCvfbkci7WAPLAWARriiIGCDHjYbhVHoUc6K/fskTcP+fM5w
	 u6h5qYWzFUCRQuAMGZ5m4ocYPGLGUMn3r6WgOiRFnFymbauL0ujSLZxxHb3PCBkjed+dq
	 DC46fXEbIdoDgNTr3tKkK0JRuJu3OWcDW1xBoqWqIagL4rqWgjOPU9Pju8+wXQtretA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893544;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fKKMZ1cRIJOjEVSTfu+ryep2x0XwX80JB3I/g7wFdCE=;
	b=brQsHe06b9UO6c5hkf+ffvLVRxdAE4sFdAOHuZp4m6EdFSJECibcOnOTjZzkv0F9Ssfc
	 Mc59KOL+90gFDuXx228/K0FA0D/v78cFauuh22hp1ZExq6lM/lw6xi2vSc1qqgctd4tN5
	 mMWMoR2+Dn58qT/emUfvV4zD1VZEo3E12TzyrynWP2zqb0Eg0MAqrI458a8LMHB4wHJyp
	 FNo0rRfyc9JLd9JXJVSsq24ZsLVnPBgBNpNyMCxry4yvYw+WFsgXEk4B1biEKGXSrfZuW
	 o/yYz/wLfslJ2iWk37ijTyFIzT7mpMlptcrLFECovk2W4wU+Q6HB9tT9HNgjSsfLMJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8FC606A32F;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8FC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeg-00071G-00; Thu, 05 Nov 2026 16:45:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 65CD5C055C; Thu,  5 Nov 2026 16:24:40 +0100 (CET)
Date: Thu, 5 Nov 2026 16:24:40 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: boot: compressed: fix the vmlinuz link with ld.lld
Message-ID: <auyfuLr4Vdc40uzt@alpha.franken.de>
References: <20261009232923.655907-1-rosenp@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009232923.655907-1-rosenp@gmail.com>

On Fri, Oct 09, 2026 at 04:29:23PM -0700, Rosen Penev wrote:
> ld.lld cannot link a 32-bit executable at a sign-extended address. With
> a sign-extended ZBOOT_LOAD_ADDRESS, such as the BCM47XX default of
> 0xffffffff80400000, the vmlinuz link fails:
> 
>   ld.lld: error: section .text at 0xffffffff80400000 of size 0x35a4
>   exceeds available address space
> 
> arch/mips/Makefile already avoids this for vmlinux by linking at
> LINKER_LOAD_ADDRESS, which drops the upper 32 bits on 32-bit kernels.
> Do the same for vmlinuz. The address computed by calc_vmlinuz_load_addr
> is already derived from LINKER_LOAD_ADDRESS, which is why only an
> explicit ZBOOT_LOAD_ADDRESS is affected.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/boot/compressed/Makefile | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
> index e0b8ec9a9516..ee554eaaa18f 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -96,12 +96,20 @@ VMLINUZ_LOAD_ADDRESS = $(shell $(obj)/calc_vmlinuz_load_addr \
>  endif
>  UIMAGE_LOADADDR = $(VMLINUZ_LOAD_ADDRESS)
>  
> +# Like LINKER_LOAD_ADDRESS in arch/mips/Makefile: ld.lld cannot link a
> +# 32-bit executable at a sign-extended address, so drop the upper 32 bits.
> +ifdef CONFIG_64BIT
> +VMLINUZ_LINK_ADDRESS = $(VMLINUZ_LOAD_ADDRESS)
> +else
> +VMLINUZ_LINK_ADDRESS = $(subst 0xffffffff,0x,$(VMLINUZ_LOAD_ADDRESS))
> +endif
> +
>  vmlinuzobjs-y += $(obj)/piggy.o
>  
>  targets += ../../../../vmlinuz
>  
>  quiet_cmd_zld = LD      $@
> -      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LOAD_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@
> +      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LINK_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@
>  quiet_cmd_strip = STRIP   $@
>        cmd_strip = $(STRIP) -s $@
>  
> -- 
> 2.56.0

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
