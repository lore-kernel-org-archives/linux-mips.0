Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:49882 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990405AbeBUKJcI1FX- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Feb 2018 11:09:32 +0100
Date: Wed, 21 Feb 2018 10:09:06 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH V2 12/12] MIPS: Loongson: Introduce and use WAR_LLSC_MB
In-Reply-To: <20180220222153.GG6245@saruman>
Message-ID: <alpine.DEB.2.00.1802202339250.3553@tp.orcam.me.uk>
References: <1517022752-3053-1-git-send-email-chenhc@lemote.com> <1517023381-17624-1-git-send-email-chenhc@lemote.com> <1517023381-17624-3-git-send-email-chenhc@lemote.com> <20180220222153.GG6245@saruman>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>
Cc: Huacai Chen <chenhc@lemote.com>, Ralf Baechle <ralf@linux-mips.org>, "Steven J . Hill" <Steven.Hill@cavium.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>
Message-ID: <20180221100906.h1-L7aa-sA7wdonl18sIh4aGknwg5EWgdFQhDb25sXE@z>

On Tue, 20 Feb 2018, James Hogan wrote:

> > diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
> > index 0fce460..3700dcf 100644
> > --- a/arch/mips/loongson64/Platform
> > +++ b/arch/mips/loongson64/Platform
> > @@ -23,6 +23,9 @@ ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
> >  endif
> >  
> >  cflags-$(CONFIG_CPU_LOONGSON3)	+= -Wa,--trap
> > +ifneq ($(call as-option,-Wa$(comma)-mfix-loongson3-llsc,),)
> > +  cflags-$(CONFIG_CPU_LOONGSON3) += -Wa$(comma)-mno-fix-loongson3-llsc
> > +endif
> 
> Could this be a separate patch?
> 
> This needs more explanation.
> - What does this do exactly?
> - Why are you turning *OFF* the compiler fix?
> - Was some fix we don't want already in use by default?

 FYI, support for `-mfix-loongson3-llsc' in GAS has only recently been 
proposed: <https://sourceware.org/ml/binutils/2018-01/msg00303.html> and 
is still pending review.

  Maciej
