Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:44563 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992391AbeAQJERQ7pti (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 17 Jan 2018 10:04:17 +0100
Date: Wed, 17 Jan 2018 09:03:48 +0000
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: Re: [PATCH] MIPS: use generic GCC library routines from lib/
Message-ID: <20180117090348.GA20406@mredfearn-linux>
References: <20180117065121.30437-1-antonynpavlov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180117065121.30437-1-antonynpavlov@gmail.com>
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20180117090348.Hkcte0uLMmmiqbEKRZFnQ90e3VbRnYrsTdaAotYPlYg@z>

Hi,

On Wed, Jan 17, 2018 at 09:51:21AM +0300, Antony Pavlov wrote:
> The commit b35cd9884fa5 ("lib: Add shared copies of
> some GCC library routines") makes it possible
> to share generic GCC library routines by several
> architectures.
> 
> This commit removes several generic GCC library
> routines from arch/mips/lib/ in favour of similar
> routines from lib/.
> 
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/mips/Kconfig       |  5 +++++
>  arch/mips/lib/Makefile  |  2 +-
>  arch/mips/lib/ashldi3.c | 30 ------------------------------
>  arch/mips/lib/ashrdi3.c | 32 --------------------------------
>  arch/mips/lib/cmpdi2.c  | 28 ----------------------------
>  arch/mips/lib/lshrdi3.c | 30 ------------------------------
>  arch/mips/lib/ucmpdi2.c | 22 ----------------------
>  7 files changed, 6 insertions(+), 143 deletions(-)
>  delete mode 100644 arch/mips/lib/ashldi3.c
>  delete mode 100644 arch/mips/lib/ashrdi3.c
>  delete mode 100644 arch/mips/lib/cmpdi2.c
>  delete mode 100644 arch/mips/lib/lshrdi3.c
>  delete mode 100644 arch/mips/lib/ucmpdi2.c
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 350a990fc719..9cd49ee848c6 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -73,6 +73,11 @@ config MIPS
>  	select RTC_LIB if !MACH_LOONGSON64
>  	select SYSCTL_EXCEPTION_TRACE
>  	select VIRT_TO_BUS
> +	select GENERIC_ASHLDI3
> +	select GENERIC_ASHRDI3
> +	select GENERIC_LSHRDI3
> +	select GENERIC_CMPDI2
> +	select GENERIC_UCMPDI2

Please preserve alphabetical order

>  
>  menu "Machine selection"
>  
> diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
> index 78c2affeabf8..195ab4cb0840 100644
> --- a/arch/mips/lib/Makefile
> +++ b/arch/mips/lib/Makefile
> @@ -16,4 +16,4 @@ obj-$(CONFIG_CPU_R3000)		+= r3k_dump_tlb.o
>  obj-$(CONFIG_CPU_TX39XX)	+= r3k_dump_tlb.o
>  
>  # libgcc-style stuff needed in the kernel
> -obj-y += ashldi3.o ashrdi3.o bswapsi.o bswapdi.o cmpdi2.o lshrdi3.o ucmpdi2.o
> +obj-y += bswapsi.o bswapdi.o
> diff --git a/arch/mips/lib/ashldi3.c b/arch/mips/lib/ashldi3.c
> deleted file mode 100644
> index 24cd6903e797..000000000000
> --- a/arch/mips/lib/ashldi3.c
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/export.h>
> -
> -#include "libgcc.h"
> -
> -long long notrace __ashldi3(long long u, word_type b)
> -{
> -	DWunion uu, w;
> -	word_type bm;
> -
> -	if (b == 0)
> -		return u;
> -
> -	uu.ll = u;
> -	bm = 32 - b;
> -
> -	if (bm <= 0) {
> -		w.s.low = 0;
> -		w.s.high = (unsigned int) uu.s.low << -bm;
> -	} else {
> -		const unsigned int carries = (unsigned int) uu.s.low >> bm;
> -
> -		w.s.low = (unsigned int) uu.s.low << b;
> -		w.s.high = ((unsigned int) uu.s.high << b) | carries;
> -	}
> -
> -	return w.ll;
> -}
> -
> -EXPORT_SYMBOL(__ashldi3);
> diff --git a/arch/mips/lib/ashrdi3.c b/arch/mips/lib/ashrdi3.c
> deleted file mode 100644
> index 23f5295af51e..000000000000
> --- a/arch/mips/lib/ashrdi3.c
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/export.h>
> -
> -#include "libgcc.h"
> -
> -long long notrace __ashrdi3(long long u, word_type b)
> -{
> -	DWunion uu, w;
> -	word_type bm;
> -
> -	if (b == 0)
> -		return u;
> -
> -	uu.ll = u;
> -	bm = 32 - b;
> -
> -	if (bm <= 0) {
> -		/* w.s.high = 1..1 or 0..0 */
> -		w.s.high =
> -		    uu.s.high >> 31;
> -		w.s.low = uu.s.high >> -bm;
> -	} else {
> -		const unsigned int carries = (unsigned int) uu.s.high << bm;
> -
> -		w.s.high = uu.s.high >> b;
> -		w.s.low = ((unsigned int) uu.s.low >> b) | carries;
> -	}
> -
> -	return w.ll;
> -}
> -
> -EXPORT_SYMBOL(__ashrdi3);
> diff --git a/arch/mips/lib/cmpdi2.c b/arch/mips/lib/cmpdi2.c
> deleted file mode 100644
> index 93cfc785927d..000000000000
> --- a/arch/mips/lib/cmpdi2.c
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/export.h>
> -
> -#include "libgcc.h"
> -
> -word_type notrace __cmpdi2(long long a, long long b)
> -{
> -	const DWunion au = {
> -		.ll = a
> -	};
> -	const DWunion bu = {
> -		.ll = b
> -	};
> -
> -	if (au.s.high < bu.s.high)
> -		return 0;
> -	else if (au.s.high > bu.s.high)
> -		return 2;
> -
> -	if ((unsigned int) au.s.low < (unsigned int) bu.s.low)
> -		return 0;
> -	else if ((unsigned int) au.s.low > (unsigned int) bu.s.low)
> -		return 2;
> -
> -	return 1;
> -}
> -
> -EXPORT_SYMBOL(__cmpdi2);
> diff --git a/arch/mips/lib/lshrdi3.c b/arch/mips/lib/lshrdi3.c
> deleted file mode 100644
> index 914b971aca3b..000000000000
> --- a/arch/mips/lib/lshrdi3.c
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/export.h>
> -
> -#include "libgcc.h"
> -
> -long long notrace __lshrdi3(long long u, word_type b)
> -{
> -	DWunion uu, w;
> -	word_type bm;
> -
> -	if (b == 0)
> -		return u;
> -
> -	uu.ll = u;
> -	bm = 32 - b;
> -
> -	if (bm <= 0) {
> -		w.s.high = 0;
> -		w.s.low = (unsigned int) uu.s.high >> -bm;
> -	} else {
> -		const unsigned int carries = (unsigned int) uu.s.high << bm;
> -
> -		w.s.high = (unsigned int) uu.s.high >> b;
> -		w.s.low = ((unsigned int) uu.s.low >> b) | carries;
> -	}
> -
> -	return w.ll;
> -}
> -
> -EXPORT_SYMBOL(__lshrdi3);
> diff --git a/arch/mips/lib/ucmpdi2.c b/arch/mips/lib/ucmpdi2.c
> deleted file mode 100644
> index c31c78ca4175..000000000000
> --- a/arch/mips/lib/ucmpdi2.c
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/export.h>
> -
> -#include "libgcc.h"
> -
> -word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)

The version of __ucmpdi2 in /lib/ is not marked notrace. We have seen
issues before with compiler intrinsics not being marked notrace - see
aedcfbe06558 ("MIPS: lib: Mark intrinsics notrace")

Please ensure that the /lib/ version is equivalent before switching to
that version.

Thanks,
Matt

> -{
> -	const DWunion au = {.ll = a};
> -	const DWunion bu = {.ll = b};
> -
> -	if ((unsigned int) au.s.high < (unsigned int) bu.s.high)
> -		return 0;
> -	else if ((unsigned int) au.s.high > (unsigned int) bu.s.high)
> -		return 2;
> -	if ((unsigned int) au.s.low < (unsigned int) bu.s.low)
> -		return 0;
> -	else if ((unsigned int) au.s.low > (unsigned int) bu.s.low)
> -		return 2;
> -	return 1;
> -}
> -
> -EXPORT_SYMBOL(__ucmpdi2);
> -- 
> 2.15.1
> 
> 
