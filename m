Received: from mailapp01.imgtec.com ([195.59.15.196]:53467 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993259AbcKAWkjtB7Cp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Nov 2016 23:40:39 +0100
Date: Tue, 1 Nov 2016 22:40:24 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: VDSO: Always select -msoft-float
In-Reply-To: <1477843551-21813-1-git-send-email-linux@roeck-us.net>
Message-ID: <alpine.DEB.2.00.1611012208400.24498@tp.orcam.me.uk>
References: <1477843551-21813-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20161101224024.A2ASvZZUjV8YHHUePh4y6bydLyZLS-7hJDI-PNhDSVI@z>

On Sun, 30 Oct 2016, Guenter Roeck wrote:

> Some toolchains fail to build mips images with the following build error.
> 
> arch/mips/vdso/gettimeofday.c:1:0: error: '-march=r3000' requires '-mfp32'
> 
> This is seen, for example, with the 'mipsel-linux-gnu-gcc (Debian 6.1.1-9)
> 6.1.1 20160705' toolchain as used by the 0Day build robot when building
> decstation_defconfig.
> 
> Comparison of compile flags suggests that the major difference is a missing
> '-soft-float', which is otherwise defined unconditionally.
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Cc: James Hogan <james.hogan@imgtec.com>
> Fixes: ebb5e78cc634 ("MIPS: Initial implementation of a VDSO")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

 Using `-msoft-float' changes the floating-point ABI with the result being 
incompatible with the rest of the userland.  I think the dynamic loader 
may not be currently enforcing ABI compatibility here, but this may change 
in the future.

 Using `-mno-float' in place of `-msoft-float' might be a safer option, 
because even if we start enforcing floating-point ABI checks in dynamic 
loading, then `-mno-float' DSOs will surely remain compatible with 
everything else, because they guarantee no floating-point code or data 
even to be ever produced by the compiler, be it using the software or the 
hardware ABI.  One problem with that option is however that it is 
apparently not universally accepted, for reasons unclear to me offhand.

 That written not so long ago I actually explicitly tried the config file 
sent by the build bot reporting this issue and I built a kernel thus 
configured with current upstream top-of-tree toolchain components, which 
went just fine.  So what I suspect you've observied is just another sign 
of a bug which has been already fixed, maybe even the very same binutils 
bug I referred to recently.

 If you send me the generated assembly, i.e. `gettimeofday.s', that is 
causing you trouble, then I'll see if I can figure out what is going on 
here.  We may decide to paper a particularly nasty toolchain bug over from 
time to time rather than requesting users to apply the relevant proper fix 
to the toolchain, but before we do so I think we first need to thoroughly 
understand what the issue is so as not to cause more harm than good with 
the workaround.

  Maciej
