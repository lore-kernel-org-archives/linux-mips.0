Received: from mailapp01.imgtec.com ([195.59.15.196]:44327 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993894AbdGFN2rg72pn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Jul 2017 15:28:47 +0200
Date: Thu, 6 Jul 2017 14:12:37 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v2 2/4] MIPS: VDSO: Add implementation of clock_gettime()
 fallback
In-Reply-To: <20170706090553.GO31455@jhogan-linux.le.imgtec.org>
Message-ID: <alpine.DEB.2.00.1707061405410.3339@tp.orcam.me.uk>
References: <1498665337-28845-1-git-send-email-aleksandar.markovic@rt-rk.com> <1498665337-28845-3-git-send-email-aleksandar.markovic@rt-rk.com> <alpine.DEB.2.00.1707060055470.3339@tp.orcam.me.uk> <20170706090553.GO31455@jhogan-linux.le.imgtec.org>
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, linux-mips@linux-mips.org, Goran Ferenc <goran.ferenc@imgtec.com>, Miodrag Dinic <miodrag.dinic@imgtec.com>, Aleksandar Markovic <aleksandar.markovic@imgtec.com>, Douglas Leung <douglas.leung@imgtec.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Petar Jovanovic <petar.jovanovic@imgtec.com>, Raghu Gandham <raghu.gandham@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170706131237.DyQ5R43ryEAmgLY6V4T73d7fMo0XWvmu6naQsb_OA_M@z>

On Thu, 6 Jul 2017, James Hogan wrote:

> > > +	asm volatile(
> > > +	"       syscall\n"
> > > +	: "=r" (ret), "=r" (error)
> > > +	: "r" (clkid), "r" (ts), "r" (nr)
> > > +	: "memory");
> > > +
> > > +	return error ? -ret : ret;
> > > +}
> > 
> >  Hmm, are you sure it is safe nowadays WRT the syscall restart convention 
> > to leave out the instruction explicitly loading the syscall number that 
> > would normally immediately precede SYSCALL
> 
> It should be fine. syscall restart only rewinds one (32-bit)
> instruction, and it preserves the syscall number in pt_regs::regs[0]
> (see handle_signal() / do_signal() and this code in e.g. scall32-o32.S:)
> 
> sw      t1, PT_R0(sp)           # save it for syscall restarting

 Fair enough, I just wanted to be sure.

 [This user code is bundled with the kernel, so it can assume whatever the 
kernel does, however general user code does have to conform to the legacy 
restart convention, unless it also requires a kernel version that is new 
enough and has a safety check in place.]

> > (and would have to forcibly use the 32-bit encoding in the microMIPS
> > case)?
> 
> I don't believe there is a 16-bit SYSCALL encoding in microMIPS, at
> least I can't see one in the 5.04 manual.

 I referred to the preceding instruction, presumably LI, that does have a 
16-bit variant in the microMIPS instruction set.

  Maciej
