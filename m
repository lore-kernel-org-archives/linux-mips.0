Received: from mailapp01.imgtec.com ([195.59.15.196]:50048 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028767AbcEUIiLNOTdn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 May 2016 10:38:11 +0200
Date: Sat, 21 May 2016 09:37:55 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 5/5] MIPS: Simplify DSP instruction encoding macros
In-Reply-To: <7CA8BFBF-73A8-4699-975E-79BDC383C2E4@imgtec.com>
Message-ID: <alpine.DEB.2.00.1605210844150.6794@tp.orcam.me.uk>
References: <1463783321-24442-1-git-send-email-james.hogan@imgtec.com> <1463783321-24442-6-git-send-email-james.hogan@imgtec.com> <alpine.DEB.2.00.1605210742260.6794@tp.orcam.me.uk> <7CA8BFBF-73A8-4699-975E-79BDC383C2E4@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160521083755.qLtMjv5p78vP9y-6x9N630Cf9-xNnztDhgnO0Ct6EUY@z>

On Sat, 21 May 2016, James Hogan wrote:

> >More importantly the use of `.insn' prevents execution from going
> >astray 
> >if there's a label being jumped to at the handcoded instruction.
> 
> Right. in my builds i couldn't find any examples of this happening, only 
> relative branches (the only diff when adding .insn seemed to be objdump 
> -d printing as microMIPS, but tbh i didn't compare data sections), but 
> perhaps it could still happen with a different configuration or 
> toolchain?

 It would have to be a JAL instruction (relaxed to JALX as necessary) or 
one of the register jumps.  The J instruction would cause an assembly or 
link error, depending on the symbol binding (a global or weak symbol may 
yet be preempted), as there's no way to switch modes with a direct jump.

 Branches however currently ignore the ISA bit, which I consider a bug, as 
it makes binutils silently produce broken code in regular MIPS and 
microMIPS interlinking if a branch target turns out to be the other ISA. 
Therefore I have a binutils patch in the works to correct this problem and 
make GAS and LD, as applicable, diagnose unsupported mode switches with 
branches and fail, but it will make `.insn' annotation even more necessary 
for handcoded machine code and other such odd cases.

 I would have actually pushed this change this week already if not for a 
microMIPS JALX encoding bug I've encountered, which would require me to 
write nonsensical code if not handled first.  That bug has now been fixed, 
so I expect to push said branch diagnostics sometime next week.  You may 
want try building with binutils master afterwards to see if any further 
cases of missing `.insn' annotation have been revealed.

 FAOD (of the other readers) none of this affects regular MIPS kernel 
builds.  It's all about microMIPS code, so there's no concern about 
toolchain compatibility with regular (classic) MIPS kernel configurations.

  Maciej
