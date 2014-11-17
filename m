Received: from mailapp01.imgtec.com ([195.59.15.196]:20653 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013854AbaKQQiwj0oHH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Nov 2014 17:38:52 +0100
Message-ID: <546A248F.4040604@imgtec.com>
Date: Mon, 17 Nov 2014 10:38:39 -0600
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] MIPS: Apply `.insn' to fixup labels throughout
References: <alpine.DEB.1.10.1411140122420.2881@tp.orcam.me.uk> <alpine.DEB.1.10.1411152139430.2881@tp.orcam.me.uk>
In-Reply-To: <alpine.DEB.1.10.1411152139430.2881@tp.orcam.me.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@codesourcery.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20141117163839.aDxxsVSxGG1dG51nMhfF_zFgZVDpct1xizAAy5fd8Vc@z>

On 11/15/2014 04:09 PM, Maciej W. Rozycki wrote:
> Fix the issue with the ISA bit being lost in fixups that jump to
> labels placed just before a section switch.  Such a switch leads to
> the ISA bit being lost, because GAS concludes there is no code that
> follows and therefore the label refers to data.  Use the `.insn'
> pseudo-op to convince the tool this is not the case.
> 
> This lack of label annotation leads to microMIPS compilation errors 
> like:
> 
> mips-linux-gnu-ld: arch/mips/built-in.o: .fixup+0x3b8: Unsupported
> jump between ISA modes; consider recompiling with interlinking
> enabled. mips-linux-gnu-ld: final link failed: Bad value
> 
> Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com> --- Hi,
> 
> I see someone has just fixed this issue in one place, so I had to 
> regenerate the change I originally made against 3.17, but I really
> fail to see why not to fix it throughout at once.
> 
In our earlier branches I believe all of the '.insn' pseudo-ops were in
place. I remember removing a number of them during release testing since
they appeared to not make any difference. It appears that use of
different toolchains has shown that to be in error.

Steve


Signed-off-by: Steven J. Hill <Steven.Hill@imgtec.com>
