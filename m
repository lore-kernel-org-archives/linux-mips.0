Received: from 20pmail.ess.barracuda.com ([64.235.150.246]:55804 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990591AbdJWQMCjQ2rl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Oct 2017 18:12:02 +0200
Date: Mon, 23 Oct 2017 17:10:27 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH v2] MIPS: Add basic R5900 support
In-Reply-To: <20171021180040.GC10522@localhost.localdomain>
Message-ID: <alpine.DEB.2.00.1710231659060.3886@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1709171001160.16752@tp.orcam.me.uk> <20170920140715.GA9255@localhost.localdomain> <alpine.DEB.2.00.1709201604400.16752@tp.orcam.me.uk> <20170922163753.GA2415@localhost.localdomain> <alpine.DEB.2.00.1709300024350.12020@tp.orcam.me.uk>
 <20170930182608.GB7714@localhost.localdomain> <alpine.DEB.2.00.1709301929060.12020@tp.orcam.me.uk> <20171006202838.GA26707@localhost.localdomain> <20171015163937.GA2239@localhost.localdomain> <alpine.DEB.2.00.1710171301160.3886@tp.orcam.me.uk>
 <20171021180040.GC10522@localhost.localdomain>
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
To: Fredrik Noring <noring@nocrew.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20171023161027.tVxdK-Ml1HZ4GZq-QusgXa9tt-J1ne5fYUrRankyDYM@z>

On Sat, 21 Oct 2017, Fredrik Noring wrote:

> > > Still left to explain is why the kernel stumbles on registers during
> > > initialisation, before user applications are invoked.
> > 
> >  Good luck!
> 
> The problem was with the inq and outq macros in the Graphics Synthesizer
> driver. A 32-bit kernel now works with 32-bit register save/restore and o32
> applications, as intended. Many thanks for all your help in finding this!

 Great, and you are welcome!

> I've found an unrelated curiosity. With CONFIG_CPU_HAS_MSA undefined,
> handle_msa_fpe_int, do_msa_fpe, etc. are still generated with nonsensical
> instructions:
> 
> 	80025128 <handle_msa_fpe_int>:
> 	80025128:       787e0859        lq      s8,2137(v1) <<<-----
> 	8002512c:       00202821        move    a1,at
> 	80025130:       0000040f        sync.p
> 	80025134:       40086000        mfc0    t0,c0_sr
> 	...
> 
> 	80030f08 <do_msa_fpe>:
> 	80030f08:       27bdffd8        addiu   sp,sp,-40
> 	80030f0c:       afb0001c        sw      s0,28(sp)
> 	80030f10:       00808021        move    s0,a0
> 	...
> 	80030f70:       02228824        and     s1,s1,v0
> 	80030f74:       02200821        move    at,s1
> 	80030f78:       783e0859        lq      s8,2137(at) <<<-----
> 	80030f7c:       0000040f        sync.p
> 	80030f80:       40016000        mfc0    at,c0_sr
> 	...
> 
> I disabled both with the patch below (there seems to be more opportunities
> for size reductions overall).

 Perhaps the MSA and the MSAFPE exception handlers could be improved 
somehow for configurations known not to support the MSA ASE, however your 
change as it stands will make the MSA exception handler default to 
`do_reserved', which in turn will cause MSA software to cause a kernel 
panic rather than sending SIGILL if run with CPU_HAS_MSA disabled on MSA 
hardware.  This would be rather nasty IMO.

  Maciej
