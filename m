Received: from mail-lf0-x241.google.com ([IPv6:2a00:1450:4010:c07::241]:42902
        "EHLO mail-lf0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994679AbeAQNUIIKvN4 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 17 Jan 2018 14:20:08 +0100
Date: Wed, 17 Jan 2018 16:34:18 +0300
From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [PATCH] MIPS: use generic GCC library routines from lib/
Message-ID: <20180117163418.ba77b2f72298092fb843fda7@gmail.com>
In-Reply-To: <20180117090348.GA20406@mredfearn-linux>
References: <20180117065121.30437-1-antonynpavlov@gmail.com>
        <20180117090348.GA20406@mredfearn-linux>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <antonynpavlov@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@mips.com>, Palmer Dabbelt <palmer@sifive.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20180117133418.f3TSHV4CGU8LcGu5RFFMOZH-ej3jvpi7HGT6Eq7pJ10@z>

On Wed, 17 Jan 2018 09:03:48 +0000
Matt Redfearn <matt.redfearn@mips.com> wrote:

> Hi,
> 
> On Wed, Jan 17, 2018 at 09:51:21AM +0300, Antony Pavlov wrote:
> > The commit b35cd9884fa5 ("lib: Add shared copies of
> > some GCC library routines") makes it possible
> > to share generic GCC library routines by several
> > architectures.
> > 
> > This commit removes several generic GCC library
> > routines from arch/mips/lib/ in favour of similar
> > routines from lib/.
> > 
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > Cc: Palmer Dabbelt <palmer@sifive.com>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: linux-mips@linux-mips.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  arch/mips/Kconfig       |  5 +++++
> >  arch/mips/lib/Makefile  |  2 +-
> >  arch/mips/lib/ashldi3.c | 30 ------------------------------
> >  arch/mips/lib/ashrdi3.c | 32 --------------------------------
> >  arch/mips/lib/cmpdi2.c  | 28 ----------------------------
> >  arch/mips/lib/lshrdi3.c | 30 ------------------------------
> >  arch/mips/lib/ucmpdi2.c | 22 ----------------------
> >  7 files changed, 6 insertions(+), 143 deletions(-)
> >  delete mode 100644 arch/mips/lib/ashldi3.c
> >  delete mode 100644 arch/mips/lib/ashrdi3.c
> >  delete mode 100644 arch/mips/lib/cmpdi2.c
> >  delete mode 100644 arch/mips/lib/lshrdi3.c
> >  delete mode 100644 arch/mips/lib/ucmpdi2.c
> > 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 350a990fc719..9cd49ee848c6 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -73,6 +73,11 @@ config MIPS
> >  	select RTC_LIB if !MACH_LOONGSON64
> >  	select SYSCTL_EXCEPTION_TRACE
> >  	select VIRT_TO_BUS
> > +	select GENERIC_ASHLDI3
> > +	select GENERIC_ASHRDI3
> > +	select GENERIC_LSHRDI3
> > +	select GENERIC_CMPDI2
> > +	select GENERIC_UCMPDI2
> 
> Please preserve alphabetical order

Ok, I'll fix order in v2 patch.

> > --- a/arch/mips/lib/ucmpdi2.c
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0
> > -#include <linux/export.h>
> > -
> > -#include "libgcc.h"
> > -
> > -word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)
> 
> The version of __ucmpdi2 in /lib/ is not marked notrace. We have seen
> issues before with compiler intrinsics not being marked notrace - see
> aedcfbe06558 ("MIPS: lib: Mark intrinsics notrace")
> 
> Please ensure that the /lib/ version is equivalent before switching to
> that version.

Good shot! I have missed this 'notrace'.

lib/ucmpdi2.c differ from other GCC library routines files from lib
related to my patch (ashldi3.c, ashrdi3.c, cmpdi2.c, lshrdi3.c):
only lib/ucmpdi2.c has no 'notrace' flag. In other details the files
look equivalent. The files arch/mips/lib/libgcc.h and include/linux/libgcc.h
have no fundamental differences.

to Palmer:
Can we add notrace to lib/ucmpdi2.c?
It looks like that nobody (even RISC-V code)
uses GENERIC_CMPDI2 and GENERIC_UCMPDI2. Why?
Do you use them in your local branches?

-- 
Best regards,
  Antony Pavlov
