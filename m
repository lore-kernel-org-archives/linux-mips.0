Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FC0353A77;
	Sat, 19 Sep 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830858; cv=none; b=sbUAlIfZX8tEhpkrRJ7oI2VqU+J4fcb8qkvhluPLQF8kPvq0fc8brB0IAdXcBgyOj6kWQRY4WMWyEnx64di9VHw1cDF14C3IG2QhiEipUIOxHeodeNI67uNaIAy+KA/2Tk2xI9eFBdtR0vCduM5ij1Sh/EY99w6kv4Ldd6rgYCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830858; c=relaxed/simple;
	bh=amfqfEA04w4dIObCPOHORQkXMOxFvo+9z/A3+oyUGek=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=uSC4Y/55V+aTYjgvAmp4LWITG5/q+bIy6ZrBZ4NAJsHmcFm6dX9yuT4GFG5zT7B9v6N4bLUZqlQ+eolsgzAJwynN6rscHdk2q2exw5HxP68RXSC6LfvP1d1lrZz8cmBzW8gSAwwsLtL/KMjISY1v0PVbwpo6xVzO7BsjXWDs7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8961392009C; Sat, 19 Sep 2026 17:14:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8425892009B;
	Sat, 19 Sep 2026 16:14:06 +0100 (BST)
Date: Sat, 19 Sep 2026 16:14:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] MIPS: Resolve build problems on decstation_64
Message-ID: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Thomas,

 I chose to rework this patchset on behalf of WangYuli after all; I'm not 
sure if his address cc'd works.  I've reordered the changes to put fixes 
ahead of improvements and reworded the piece of inline documentation for 
the KBUILD_SYM32 option since, frankly, the one we have now is hard to 
comprehend.

 I have verified this patchset with my 5000/150.  Please apply.

 Previous iteration (v2) at 
<https://lore.kernel.org/r/24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com/>.

 The original cover letter follows.

  Maciej

[ Part 1 ]: MIPS: dec: Only check -msym32 when need compiler

During 'make modules_install', the need-compiler variable becomes
null, so Makefile.compiler isn't included.
    
This results in call cc-option-yn returning nothing.
    
For more technical details on why need-compiler is null during
'make modules_install' and why no compiler invocation is actually
needed at this point, please refer to commit 4fe4a6374c4d ("MIPS:
Only fiddle with CHECKFLAGS if need-compiler") and commit
805b2e1d427a ("kbuild: include Makefile.compiler only when compiler
is needed").
    
Commit a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression") tried to fix the same issue but it
caused a compile error on clang compiler because it doesn't support
'-msym32'. Then, commit 18ca63a2e23c ("MIPS: Probe toolchain support
of -msym32") fixed it but reintroduced the CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression.

Wrapping this entire code block with #ifdef need-compiler to avoid
all issues is the best solution for now.
    
To get rid of spurious "CONFIG_CPU_DADDI_WORKAROUNDS unsupported
without -msym32" error.

Moreover, I also identified an unnecessary check for KBUILD_SYM32
in this Makefile section. Eliminate it for code simplification.

NOTE:

It is particularly important to note that this code fix does not
imply that we have resolved the problem entirely.

In fact, the entire application of cc-option and its auxiliary
commands within the kernel codebase currently carries significant
risk.

When we execute make modules_install, the Makefile for the
corresponding architecture under arch/subarches/Makefile is
invariably included. Within these files, there are numerous
usages of cc-option and its auxiliary commands, all of which will
return empty strings. The reason other architectures can
successfully complete compilation under these circumstances is
purely because they do not, unlike MIPS, check the return values
of cc-option and its auxiliary commands within their Makefiles
and halt the compilation process when the expected results are
not received.

A feasible approach to remediation might be to encapsulate all
usages of cc-option and its auxiliary commands within conditional
statements across all architecture Makefiles, preventing their
execution entirely during make modules_install.

However, this would lead to a massive number of inelegant
modifications, and these broader implications may require
deliberation by Masahiro Yamada.

Regardless, this does not preclude us from addressing the
issue on MIPS first.

Link: https://lore.kernel.org/all/41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/F49F5EE9975F29EA+20250214094758.172055-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/8ABBF323414AEF93+20250217142541.48149-1-wangyuli@uniontech.com/


[ Part 2 ]: MIPS: decstation_64_defconfig: Compile the kernel with warnings as errors

Patch ("MIPS: dec: Only check -msym32 when need compiler") allows
us to compile kernel image packages with decstation_64_defconfig.

However, compilation warnings remain during the build.

Address these warnings and enable CONFIG_WERROR for decstation_64_defconfig.

Link: https://lore.kernel.org/all/487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/EA0AFB15DDCF65C1+20250227141949.1129536-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/303EFD6BFBDAC7C8+20250305033436.31214-1-wangyuli@uniontech.com/


[ Changelog: ]

 *v1->v2: Add Philippe Mathieu-Daudé's "Reviewed-by" tag in patch3.
Link: https://lore.kernel.org/all/11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com/
Link: https://lore.kernel.org/all/8dcb5c6d-be4f-4891-a999-137d53edfc05@linaro.org/

WangYuli (6):
  MIPS: dec: Only check -msym32 when need compiler
  MIPS: Eliminate Redundant KBUILD_SYM32 Checks
  MIPS: dec: Create reset.h
  MIPS: dec: Remove dec_irq_dispatch()
  MIPS: decstation_64_defconfig: Update configs dependencies
  MIPS: decstation_64_defconfig: Compile the kernel with warnings as
    errors

 arch/mips/Makefile                        |  6 ++--
 arch/mips/configs/decstation_64_defconfig | 43 +++++++++--------------
 arch/mips/dec/int-handler.S               |  2 +-
 arch/mips/dec/prom/init.c                 |  3 +-
 arch/mips/dec/reset.c                     |  2 ++
 arch/mips/dec/setup.c                     | 15 ++------
 arch/mips/include/asm/dec/reset.h         | 20 +++++++++++
 7 files changed, 47 insertions(+), 44 deletions(-)
 create mode 100644 arch/mips/include/asm/dec/reset.h

-- 
2.49.0
