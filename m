Received: from relay1.mentorg.com ([192.94.38.131]:61000 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6824780Ab3F0NOIxe6-0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 27 Jun 2013 15:14:08 +0200
Date: Thu, 27 Jun 2013 14:13:51 +0100
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: Re: [PATCH] MIPS: micromips: Add 16-bit instruction floating point
 breakpoints.
In-Reply-To: <20130627110449.GS7171@linux-mips.org>
Message-ID: <alpine.DEB.1.10.1306271322370.16287@tp.orcam.me.uk>
References: <1370370146-19716-1-git-send-email-Steven.Hill@imgtec.com> <20130627110449.GS7171@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Steven J. Hill" <Steven.Hill@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, ddaney.cavm@gmail.com
Message-ID: <20130627131351.APyLWI0Az1ekgPwaXebk2fxkMIX39-MiOse09nSHHYQ@z>

On Thu, 27 Jun 2013, Ralf Baechle wrote:

> > This patch adds explicit support for 16-bit instruction breakpoints
> > for floating point exceptions.
> 
> This patch has gone stale with a conflict in traps.c.  Can you resubmit
> an updated patch?  Thanks!

 Also I reckon we used to have an instruction fetch helper here -- where 
has it gone?  Without it code gets horribly cluttered.  I'd envisage one 
that returns both the full instruction word and an ISA specifier, one of 
MIPS, MIPS16 or microMIPS, an enum preferably so that `switch' handles it 
without hassle.  The instruction word would have the second half-word 
already retrieved if applicable, with the endianness already adjusted, 
i.e. the major-opcode half-word always in the high word.

 With such a helper in place you could reduce the decoding of the 
instruction and retrieval of the break code to a simple switch statement, 
immediately obvious to a casual reader.  This might result in a small 
performance loss here, but this is not a critical execution path and I 
think the reduction of the long-term maintenance cost of this code 
outweighs any such loss.

 Finally, in the FP emulator I think the comment needs updating to match 
reality (as a separate change).  Also I think struct emuframe should use 
unions for instruction accesses to avoid the horrible casts.

  Maciej
