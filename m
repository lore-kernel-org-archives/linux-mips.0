Received: from mail-pf0-f196.google.com ([209.85.192.196]:32783 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990513AbcJUIrgsUpCg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 21 Oct 2016 10:47:36 +0200
Date: Fri, 21 Oct 2016 19:47:18 +1100
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/6] MIPS: Use thin archives & dead code elimination
Message-ID: <20161021194718.2cd4b93e@roar.ozlabs.ibm.com>
In-Reply-To: <1724594.nvOo2qz5cT@np-p-burton>
References: <20161020202705.3783-1-paul.burton@imgtec.com>
        <20161021115147.0f6eea51@roar.ozlabs.ibm.com>
        <1724594.nvOo2qz5cT@np-p-burton>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <npiggin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20161021084718.7b_cXh-W33OHN8P85Ag5hkgTGM9iFkQgOH0MrVPs87Q@z>

On Fri, 21 Oct 2016 08:45:47 +0100
Paul Burton <paul.burton@imgtec.com> wrote:

> Hi Nick,
> 
> On Friday, 21 October 2016 11:51:47 BST Nicholas Piggin wrote:
> > Paul Burton <paul.burton@imgtec.com> wrote:  
> > > This series fixes a few issues with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> > > and then enables it, along with CONFIG_THIN_ARCHIVES, for MIPS. This
> > > 
> > > leads to a typical generic kernel build becoming ~5% smaller:
> > >   add/remove: 0/3028 grow/shrink: 1/14 up/down: 18/-457362 (-457344)
> > >   ...
> > >   Total: Before=9001030, After=8543686, chg -5.08%
> > > 
> > > Applies atop v4.9-rc1.  
> > 
> > Very nice, and thanks for the kbuild fixes, I think they all look sane.
> > 
> > Let's try to get those kbuild fixes in through the kbuild tree first
> > (which has some other fixes required for 4.9). I can take them and send
> > them to kbuild maintainer if you like.  
> 
> That sounds great :)
> 
> > On powerpc we'll likely provide an option to select these manually for
> > 4.9 because there has been the odd toolchain issue come up, so that's
> > something to consider.  
> 
> I imagine the MIPS bits will probably be v4.10 material, but hopefully Ralf 
> can get them into -next as soon as possible after the kbuild bits are in, 
> which should give us some time to discover any toolchain issues.

Okay, whatever works for you.


> > For your linker script, you may consider putting the function sections
> > into the same input as other text. TEXT_TEXT does not include .text.*,
> > so mips's .text.* below it will catch those.
> > 
> > You may just open-code your TEXT_TEXT, and have:
> > 
> > *(.text.hot .text .text.fixup .text.unlikely .text.[0-9a-zA-Z_]*)
> > 
> > or similar.  
> 
> Ah, so are you saying that would give the linker more scope for discarding 
> things?

I don't think discarding, but it will allow those sections to be placed
together with more scope for reordering. This can reduce the amount of
branch trampolines required.

Aside from that, it just gives less change in behaviour. Without
-ffunction-sections, those functions would be placed in .text section,
so you ideally want to keep them there when enabling it.

Thanks,
Nick
