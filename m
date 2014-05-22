Received: from mail-bn1blp0183.outbound.protection.outlook.com ([207.46.163.183]:48365
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855125AbaEVQzrqZOew (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 22 May 2014 18:55:47 +0200
Date: Thu, 22 May 2014 18:54:47 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 10/15] MIPS: Add code for new system 'paravirt'.
Message-ID: <20140522165447.GJ11800@alberich>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1400597236-11352-11-git-send-email-andreas.herrmann@caviumnetworks.com>
 <537CAC74.4030800@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <537CAC74.4030800@imgtec.com>
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
Cc: linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140522165447.Kyqk7u91ZFUNNFiV_LaDfWm1-kGwpcp4QDXuci5Q3vM@z>

On Wed, May 21, 2014 at 02:39:00PM +0100, James Hogan wrote:
> On 20/05/14 15:47, Andreas Herrmann wrote:

 -- 8< --

> > diff --git a/arch/mips/paravirt/paravirt-irq.c b/arch/mips/paravirt/paravirt-irq.c
> > new file mode 100644
> > index 0000000..e1603dd
> > --- /dev/null
> > +++ b/arch/mips/paravirt/paravirt-irq.c
> > @@ -0,0 +1,388 @@
> > +/*
> > + * This file is subject to the terms and conditions of the GNU General Public
> > + * License.  See the file "COPYING" in the main directory of this archive
> > + * for more details.
> > + *
> > + * Copyright (C) 2013 Cavium, Inc.
> > + */
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mutex.h>
> > +
> > +#include <asm/io.h>
> > +
> > +#define MBOX_BITS_PER_CPU 2
> > +
> > +int cpunum_for_cpu(int cpu)
> 
> static?

Yes.

> > +{
> > +#ifdef CONFIG_SMP
> > +	return cpu_logical_map(cpu);
> > +#else
> > +	return mips_cpunum();
> > +#endif
> > +}

 -- 8< --

> > +static int irq_pci_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
> > +{
> > +	return 0;
> > +}
> 
> Is there any point even providing this callback?

Hmm, no, if we can't modify CPU affinity we shouldn't provide it.

> > +
> > +static void irq_pci_cpu_offline(struct irq_data *data)
> > +{
> > +}
> 
> Or this one?

No.

> > +
> > +static struct irq_chip irq_chip_pci = {
> > +	.name = "PCI",
> > +	.irq_enable = irq_pci_enable,
> > +	.irq_disable = irq_pci_disable,
> > +	.irq_ack = irq_pci_ack,
> > +	.irq_mask = irq_pci_mask,
> > +	.irq_unmask = irq_pci_unmask,
> > +	.irq_set_affinity = irq_pci_set_affinity,
> > +	.irq_cpu_offline = irq_pci_cpu_offline,
> > +};

 -- 8< --

> > +static void paravirt_boot_secondary(int cpu, struct task_struct *idle)
> > +{
> > +	paravirt_smp_gp[cpu] = (unsigned long)(task_thread_info(idle));
> 
> spurious brackets around task_thread_info(idle)

Ok.

> > +	wmb();
 
 -- 8< --

> > +int prom_putchar(char c)
> > +{
> > +	hypcall3(0 /* Console output */, 0 /*  port 0 */, (unsigned long)&c, 1 /* len == 1 */);
> 
> I think the hypcall API needs to be clearly specified and Documented
> somewhere along with its HYPCALL codes and scope. I.e. is it specific to
> kvmtool, or attempting to be a standard API across MIPS hypervisors.
> 
> It probably should have nice definitions in a header and wrappers
> somewhere to make the arguments explicit and so there's no need for the
> comments explaining what the magic values mean.

Agreed. I think when the definitions are moved to kvm_para.h,
appropriate macros for the hypercall numbers will also be provided
etc.


Andreas
