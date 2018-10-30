Received: from ozlabs.org ([203.11.71.1]:49121 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990439AbeJ3Mg0eTGwN (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 30 Oct 2018 13:36:26 +0100
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] kbuild: replace cc-name test with CONFIG_CC_IS_CLANG
In-Reply-To: <1540873293-29817-1-git-send-email-yamada.masahiro@socionext.com>
References: <1540873293-29817-1-git-send-email-yamada.masahiro@socionext.com>
Date: Tue, 30 Oct 2018 23:36:17 +1100
Message-ID: <877ehzk3we.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <mpe@ellerman.id.au>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Paul Mackerras <paulus@samba.org>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, linuxppc-dev@lists.ozlabs.org
Message-ID: <20181030123617.kof4uP-PHE810XiJEPdJ_4tBZ8H0wLCvCNBttrf0neU@z>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 17be664..338e827 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -96,7 +96,7 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
>  aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
>  endif
>  
> -ifneq ($(cc-name),clang)
> +ifneq ($(CONFIG_CC_IS_CLANG),y)
>    cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mno-strict-align
>  endif
>  
> @@ -175,7 +175,7 @@ endif
>  # Work around gcc code-gen bugs with -pg / -fno-omit-frame-pointer in gcc <= 4.8
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44199
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52828
> -ifneq ($(cc-name),clang)
> +ifneq ($(CONFIG_CC_IS_CLANG),y)
>  CC_FLAGS_FTRACE	+= $(call cc-ifversion, -lt, 0409, -mno-sched-epilog)
>  endif
>  endif

Does this behave like other CONFIG variables, ie. it will not be defined
when it's false?

And if so can't we use ifdef/ifndef? eg:

ifndef CONFIG_CC_IS_CLANG
  CC_FLAGS_FTRACE	+= $(call cc-ifversion, -lt, 0409, -mno-sched-epilog)

That reads cleaner to me.

Still this patch is fine as is:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
