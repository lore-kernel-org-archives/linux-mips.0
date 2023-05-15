Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93D9C7EE25
	for <linux-mips@archiver.kernel.org>; Mon, 15 May 2023 19:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243628AbjEOT5g (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 15 May 2023 15:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbjEOT5f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 May 2023 15:57:35 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 607EED7
        for <linux-mips@vger.kernel.org>; Mon, 15 May 2023 12:57:33 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id F033392009C; Mon, 15 May 2023 21:57:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E95C492009B;
        Mon, 15 May 2023 20:57:30 +0100 (BST)
Date:   Mon, 15 May 2023 20:57:30 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Nathan Chancellor <nathan@kernel.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ndesaulniers@google.com, trix@redhat.com,
        linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
Subject: Re: [PATCH] MIPS: Drop unused positional parameter in
 local_irq_{dis,en}able
In-Reply-To: <20230404-mips-unused-named-parameters-v1-1-71d6c656f1de@kernel.org>
Message-ID: <alpine.DEB.2.21.2305150228520.11892@angie.orcam.me.uk>
References: <20230404-mips-unused-named-parameters-v1-1-71d6c656f1de@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 4 Apr 2023, Nathan Chancellor wrote:

> When building with clang's integrated assembler, it points out that the
> CONFIG_CPU_HAS_DIEI versions of local_irq_enable and local_irq_disable
> have a named parameter that is not used in the body of the macro and it
> thinks that $8 is a positional parameter, rather than a register:
> 
>   arch/mips/include/asm/asmmacro.h:48:2: warning: macro defined with named
> parameters which are not used in macro body, possible positional parameter found
> in body which will have no effect
>    .macro local_irq_enable reg=$8
>    ^
> 
> The comment above the function that performs this check in LLVM notes
> that the warning may trigger in this case, even though it is not
> problematic. It is easy enough to clean this up by just omitting the
> named parameter for this version of the macro, as it is entirely unused.

 You need to remove the argument from the !CONFIG_CPU_HAS_DIEI versions of 
the macros then too or otherwise we now have an inconsistent API between 
kernel configurations.

 AFAICT the only call site is in arch/mips/kernel/entry.S (and for
`local_irq_enable' only), and it doesn't supply the argument, which is why 
you could have removed it for CONFIG_CPU_HAS_DIEI at all.

 FWIW I find your reported warning questionable, there are valid reasons, 
such as the very situation here, why an argument might not be used.  It is 
only a macro after all, effectively a source code transformation tool.  
Similarly the C preprocessor does not warn about unused macro arguments.

 So IMHO your change has crippled reasonable code just to paper over a 
tool's deficiency.

  Maciej
