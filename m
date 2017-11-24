Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:56423 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990504AbdKXKkkBfXqG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 24 Nov 2017 11:40:40 +0100
Date: Fri, 24 Nov 2017 10:39:29 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH v2] MIPS: Add basic R5900 support
In-Reply-To: <alpine.DEB.2.00.1711240958370.3865@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1711241038320.3865@tp.orcam.me.uk>
References: <20170916133423.GB32582@localhost.localdomain> <alpine.DEB.2.00.1709171001160.16752@tp.orcam.me.uk> <20170918192428.GA391@localhost.localdomain> <alpine.DEB.2.00.1709182055090.16752@tp.orcam.me.uk> <20170920145440.GB9255@localhost.localdomain>
 <alpine.DEB.2.00.1709201705070.16752@tp.orcam.me.uk> <20170927172107.GB2631@localhost.localdomain> <alpine.DEB.2.00.1709272208300.16752@tp.orcam.me.uk> <20170930065654.GA7714@localhost.localdomain> <alpine.DEB.2.00.1709301305400.12020@tp.orcam.me.uk>
 <20171030175516.GA18586@localhost.localdomain> <alpine.DEB.2.00.1711240958370.3865@tp.orcam.me.uk>
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
To: Fredrik Noring <noring@nocrew.org>, John Crispin <john@phrozen.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171124103929.JkF86u-WER5Ieu0bSVP0QBw0j9KLPhu2pTTRPvt-lGY@z>

Fredrik, John --

[Sending again, with John's address corrected.]

 John: can you please see the question below on the machine type you 
previously fiddled with?

> >  Given that the R5900 does not expand DSP support anyhow that sounds 
> > suspicious to me.
> 
> I've taken a closer look at the R5900 changes to the DSP kernel code now:
> 
> The R5900 has four three-operand instructions: MADD, MADDU, MULT and MULTU.
> In addition, it has ten instructions for pipeline 1: MULT1, MULTU1, DIV1,
> DIVU1, MADD1, MADDU1, MFHI1, MFLO1, MTHI1 and MTLO1. Those are the reason
> (parts of) the cpu_has_dsp infrastructure is used, as shown in the patch
> below. What are your thoughts on this?
> 
> The instructions are specific to the R5900, and notably incompatible with
> similar ones in the base MIPS32 architecture. They are also distinct from
> the (also R5900 specific) 128-bit multimedia instructions.

 They're still upper halves of the architectural HI/LO accumulator and 
also used by the 128-bit multiply and divide instructions.  I think they 
should be handled analogously to the 128-bit GPRs, rather than pretending 
they're a crippled version of the DSP ASE.

> By the way, "machine" is set to "Unknown" and "ASEs implemented" is empty
> in /proc/cpuinfo. What would be the proper values for the R5900?

 I have no idea what the machine type is supposed to be set to and why it 
is not omitted by default, given this piece:

		if (mips_get_machine_name())
			seq_printf(m, "machine\t\t\t: %s\n",
				mips_get_machine_name());

I think commit 9169a5d01114 ("MIPS: move mips_{set,get}_machine_name() to 
a more generic place") broke things.  Cc-ing the author for possible 
input.

 ASEs OTOH are specific to MIPS32 and MIPS64 architectures, as per 
respective architecture specification volumes (the MIPS16 ASE might be a 
prominent exception, having been defined as the first ASE ever mid way 
through between the MIPS IV and MIPS32/MIPS64 ISAs).  As the R5900 is not 
a MIPS32 or MIPS64 processor (and has no MIPS16 support) it does not have 
any ASEs implemented.  Vendor-specific architecture extensions do not 
count as ASEs.

  Maciej
