Received: from mail-bn1blp0181.outbound.protection.outlook.com ([207.46.163.181]:57438
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6816207AbaE1WFPoSsj6 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:05:15 +0200
Date: Thu, 29 May 2014 00:04:18 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 15/15] MIPS: paravirt: Provide _machine_halt function to
 exit VM on shutdown of guest
Message-ID: <20140528220418.GA6335@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-16-git-send-email-andreas.herrmann@caviumnetworks.com>
 <537CADD1.5020006@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <537CADD1.5020006@imgtec.com>
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20140528220418.Dtj_nreAcAfolatb1-Lfy5R48nhGsOB2x13DNgQzeRA@z>

On Wed, May 21, 2014 at 02:44:49PM +0100, James Hogan wrote:
> On 20/05/14 15:47, Andreas Herrmann wrote:
> > Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> 
> Does it make sense to provide a _machine_restart too?

Hmm, I've not seen a real need for this so far.
(Halting the guest and relaunching it from the shell with lkvm was fast
enough for my tests ;-)

But it's worth to get it working. I might be wrong but I think that
this requires lkvm changes to actually handle the reboot.

> I think this should be squashed into patch 10 really,

Done that.

> or else patch 10
> split up into several parts (irq, smp, serial, other).

Still kept the pci stuff as a separate patch in case that it might be
replaced with something based on "PCI: Generic Configuration Access
Mechanism support" (https://lkml.org/lkml/2014/5/18/54) or similar.

Andreas

> Cheers
> James
> 
> > ---
> >  arch/mips/paravirt/setup.c |    7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/mips/paravirt/setup.c b/arch/mips/paravirt/setup.c
> > index f80c3bc..6d2781c 100644
> > --- a/arch/mips/paravirt/setup.c
> > +++ b/arch/mips/paravirt/setup.c
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/kernel.h>
> >  
> > +#include <asm/reboot.h>
> >  #include <asm/bootinfo.h>
> >  #include <asm/mipsregs.h>
> >  #include <asm/smp-ops.h>
> > @@ -27,6 +28,11 @@ void __init plat_time_init(void)
> >  	preset_lpj = mips_hpt_frequency / (2 * HZ);
> >  }
> >  
> > +static void pv_machine_halt(void)
> > +{
> > +	hypcall0(1 /* Exit VM */);
> > +}
> > +
> >  /*
> >   * Early entry point for arch setup
> >   */
> > @@ -47,6 +53,7 @@ void __init prom_init(void)
> >  		if (i < argc - 1)
> >  			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
> >  	}
> > +	_machine_halt = pv_machine_halt;
> >  	register_smp_ops(&paravirt_smp_ops);
> >  }
> >  
> > 
