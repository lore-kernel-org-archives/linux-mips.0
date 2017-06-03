Received: from mail-pf0-x242.google.com ([IPv6:2607:f8b0:400e:c00::242]:36067
        "EHLO mail-pf0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990644AbdFCCSPNIw0u (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Jun 2017 04:18:15 +0200
Received: by mail-pf0-x242.google.com with SMTP id n23so14318034pfb.3
        for <linux-mips@linux-mips.org>; Fri, 02 Jun 2017 19:18:15 -0700 (PDT)
Date: Fri, 02 Jun 2017 19:18:08 -0700 (PDT)
From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 4/7] mips: Use lib/{ashldi3,ashrdi3,cmpdi2,lshrdi3,ucmpdi2}.c
In-Reply-To: <a870bfb8-a1c8-220e-460c-baa03b3fd554@imgtec.com>
Message-ID: <mhng-fc1d65cf-1943-4c73-8fae-b13ee8349d2f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Return-Path: <palmer@dabbelt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: matt.redfearn@imgtec.com
Cc: monstr@monstr.eu, ralf@linux-mips.org, liqin.linux@gmail.com, lennox.wu@gmail.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Message-ID: <20170603021808.-xPZ5uJ3dFcL6XOfOpvMAaQUp0bESx4zucIJX84tNVs@z>

On Wed, 24 May 2017 02:01:39 PDT (-0700), matt.redfearn@imgtec.com wrote:
> Hi Palmer,
> This patch doesn't quite match the subject, since it only removes the
> mips specific implementation of __ucmpdi2. The following patch removes
> all of the intrinsics that you added to lib/ from arch/mips/lib. I've
> built & boot tested this on a MIPS pistachio platform.
> Note that this patch will require rebasing on linux-next, since it will
> conflict with other changes in arch/mips/Kconfig
>
> Thanks,
> Matt
>
> [PATCH] MIPS: Use generic libgcc intrinsics
>
> These routines in arch/mips/lib/ are functionally identical to those
> recently added to lib/ so remove them and select the generic ones.
>
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
> ---
>   arch/mips/Kconfig       |  5 +++++
>   arch/mips/lib/Makefile  |  2 +-
>   arch/mips/lib/ashldi3.c | 29 -----------------------------
>   arch/mips/lib/ashrdi3.c | 31 -------------------------------
>   arch/mips/lib/cmpdi2.c  | 27 ---------------------------
>   arch/mips/lib/libgcc.h  | 25 -------------------------
>   arch/mips/lib/lshrdi3.c | 29 -----------------------------
>   arch/mips/lib/ucmpdi2.c | 21 ---------------------
>   8 files changed, 6 insertions(+), 163 deletions(-)
>   delete mode 100644 arch/mips/lib/ashldi3.c
>   delete mode 100644 arch/mips/lib/ashrdi3.c
>   delete mode 100644 arch/mips/lib/cmpdi2.c
>   delete mode 100644 arch/mips/lib/libgcc.h
>   delete mode 100644 arch/mips/lib/lshrdi3.c
>   delete mode 100644 arch/mips/lib/ucmpdi2.c

Sorry about that, I'll take your version and submit a v2.
