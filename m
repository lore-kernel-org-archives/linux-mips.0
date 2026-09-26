Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EF11FA272;
	Sat, 26 Sep 2026 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418465; cv=none; b=oRDw01KGUFsWjI7gdTRcZCtb9Bw0QmXPUISEg+ep9ZBENIB881sNBi0SO10sp3HV3gGGWmQQMupII8uffk4WrVNeksSh8mmj/Cz/p3vSjjRq8Ghgzm6YorJsOacbq8Rt4pkaM9+E7TCBEXvyEf6Kqw1IokYuHON5+3K9Ov/Uvk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418465; c=relaxed/simple;
	bh=XpUop/jT3q0q9NR7t0O0+OFtpuH/y9YA6YubX6h9GJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEc2CGaA8fqduaCUcoyjkz2o44/KS+Fp50EUGZyGT4kqRm2ElFxnHmZLgnC5shgjQXexhAheAfBPVqw8jxyPYA4PIiKcTfcbyeQNUcZoS/aWKhWygloHtKv3CefuBofnpK8uvvvN2tnMyxGBgkKYq0qTD+xHeEnVJ/slvyN3sA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4P-0007Lr-00; Sat, 26 Sep 2026 11:51:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 66903C0D27; Sat, 26 Sep 2026 11:40:51 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:40:51 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] MIPS: Resolve build problems on decstation_64
Message-ID: <areTI4iW1pbaAwn3@alpha.franken.de>
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>

On Sat, Sep 19, 2026 at 04:14:06PM +0100, Maciej W. Rozycki wrote:
> Hi Thomas,
> 
>  I chose to rework this patchset on behalf of WangYuli after all; I'm not 
> sure if his address cc'd works.  I've reordered the changes to put fixes 
> ahead of improvements and reworded the piece of inline documentation for 
> the KBUILD_SYM32 option since, frankly, the one we have now is hard to 
> comprehend.
> 
>  I have verified this patchset with my 5000/150.  Please apply.
> 
>  Previous iteration (v2) at 
> <https://lore.kernel.org/r/24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com/>.
> 
>  The original cover letter follows.
> 
>   Maciej
> 
> [ Part 1 ]: MIPS: dec: Only check -msym32 when need compiler
> 
> During 'make modules_install', the need-compiler variable becomes
> null, so Makefile.compiler isn't included.
>     
> This results in call cc-option-yn returning nothing.
>     
> For more technical details on why need-compiler is null during
> 'make modules_install' and why no compiler invocation is actually
> needed at this point, please refer to commit 4fe4a6374c4d ("MIPS:
> Only fiddle with CHECKFLAGS if need-compiler") and commit
> 805b2e1d427a ("kbuild: include Makefile.compiler only when compiler
> is needed").
>     
> Commit a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS
> `modules_install' regression") tried to fix the same issue but it
> caused a compile error on clang compiler because it doesn't support
> '-msym32'. Then, commit 18ca63a2e23c ("MIPS: Probe toolchain support
> of -msym32") fixed it but reintroduced the CONFIG_CPU_DADDI_WORKAROUNDS
> `modules_install' regression.
> 
> Wrapping this entire code block with #ifdef need-compiler to avoid
> all issues is the best solution for now.
>     
> To get rid of spurious "CONFIG_CPU_DADDI_WORKAROUNDS unsupported
> without -msym32" error.
> 
> Moreover, I also identified an unnecessary check for KBUILD_SYM32
> in this Makefile section. Eliminate it for code simplification.
> 
> NOTE:
> 
> It is particularly important to note that this code fix does not
> imply that we have resolved the problem entirely.
> 
> In fact, the entire application of cc-option and its auxiliary
> commands within the kernel codebase currently carries significant
> risk.
> 
> When we execute make modules_install, the Makefile for the
> corresponding architecture under arch/subarches/Makefile is
> invariably included. Within these files, there are numerous
> usages of cc-option and its auxiliary commands, all of which will
> return empty strings. The reason other architectures can
> successfully complete compilation under these circumstances is
> purely because they do not, unlike MIPS, check the return values
> of cc-option and its auxiliary commands within their Makefiles
> and halt the compilation process when the expected results are
> not received.
> 
> A feasible approach to remediation might be to encapsulate all
> usages of cc-option and its auxiliary commands within conditional
> statements across all architecture Makefiles, preventing their
> execution entirely during make modules_install.
> 
> However, this would lead to a massive number of inelegant
> modifications, and these broader implications may require
> deliberation by Masahiro Yamada.
> 
> Regardless, this does not preclude us from addressing the
> issue on MIPS first.
> 
> Link: https://lore.kernel.org/all/41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com/
> Link: https://lore.kernel.org/all/F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com/
> Link: https://lore.kernel.org/all/8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com/
> 
> 
> [ Part 2 ]: MIPS: decstation_64_defconfig: Compile the kernel with warnings as errors
> 
> Patch ("MIPS: dec: Only check -msym32 when need compiler") allows
> us to compile kernel image packages with decstation_64_defconfig.
> 
> However, compilation warnings remain during the build.
> 
> Address these warnings and enable CONFIG_WERROR for decstation_64_defconfig.
> 
> Link: https://lore.kernel.org/all/487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com/
> Link: https://lore.kernel.org/all/EA0AFB15DDCF65C1+20250227141949.1129536-1-wangyuli@uniontech.com/
> Link: https://lore.kernel.org/all/303EFD6BFBDAC7C8+20250305033436.31214-1-wangyuli@uniontech.com/
> 
> 
> [ Changelog: ]
> 
>  *v1->v2: Add Philippe Mathieu-Daudé's "Reviewed-by" tag in patch3.
> Link: https://lore.kernel.org/all/11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com/
> Link: https://lore.kernel.org/all/8dcb5c6d-be4f-4891-a999-137d53edfc05@linaro.org/
> 
> WangYuli (6):
>   MIPS: dec: Only check -msym32 when need compiler
>   MIPS: Eliminate Redundant KBUILD_SYM32 Checks
>   MIPS: dec: Create reset.h
>   MIPS: dec: Remove dec_irq_dispatch()
>   MIPS: decstation_64_defconfig: Update configs dependencies
>   MIPS: decstation_64_defconfig: Compile the kernel with warnings as
>     errors
> 
>  arch/mips/Makefile                        |  6 ++--
>  arch/mips/configs/decstation_64_defconfig | 43 +++++++++--------------
>  arch/mips/dec/int-handler.S               |  2 +-
>  arch/mips/dec/prom/init.c                 |  3 +-
>  arch/mips/dec/reset.c                     |  2 ++
>  arch/mips/dec/setup.c                     | 15 ++------
>  arch/mips/include/asm/dec/reset.h         | 20 +++++++++++
>  7 files changed, 47 insertions(+), 44 deletions(-)
>  create mode 100644 arch/mips/include/asm/dec/reset.h

series applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
