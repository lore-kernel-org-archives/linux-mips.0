Received: from mailapp01.imgtec.com ([195.59.15.196]:57826 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007927AbbJEIWQD-kDy (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Oct 2015 10:22:16 +0200
Subject: Re: [PATCH 2/3] irqchip: irq-mips-gic: Provide function to map GIC
 user section
References: <1443434629-14325-1-git-send-email-markos.chandras@imgtec.com>
 <1443435117-17144-1-git-send-email-markos.chandras@imgtec.com>
 <56091CA1.1030808@arm.com>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <56123331.3010200@imgtec.com>
Date: Mon, 5 Oct 2015 09:22:09 +0100
MIME-Version: 1.0
In-Reply-To: <56091CA1.1030808@arm.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Marc Zyngier <marc.zyngier@arm.com>, linux-mips@linux-mips.org
Cc: alex@alex-smith.me.uk, Alex Smith <alex.smith@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org
Message-ID: <20151005082209.nxqWCTk0oOLPKa-D_c8sudrTpeaPLmy0iwujlJRythE@z>

Hi,

On 09/28/2015 11:55 AM, Marc Zyngier wrote:
> On 28/09/15 11:11, Markos Chandras wrote:
>> From: Alex Smith <alex.smith@imgtec.com>
>>
>> The GIC provides a "user-mode visible" section containing a mirror of
>> the counter registers which can be mapped into user memory. This will
>> be used by the VDSO time function implementations, so provide a
>> function to map it in.
>>
>> When the GIC is not enabled in Kconfig a dummy inline version of this
>> function is provided, along with "#define gic_present 0", so that we
>> don't have to litter the VDSO code with ifdefs.
>>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Jason Cooper <jason@lakedaemon.net>
>> Cc: Marc Zyngier <marc.zyngier@arm.com>
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>  drivers/irqchip/irq-mips-gic.c   | 27 +++++++++++++++++++++------
>>  include/linux/irqchip/mips-gic.h | 24 ++++++++++++++++++++++--
>>  2 files changed, 43 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
>> index af2f16bb8a94..c995b199ca32 100644
>> --- a/drivers/irqchip/irq-mips-gic.c
>> +++ b/drivers/irqchip/irq-mips-gic.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/irq.h>
>>  #include <linux/irqchip.h>
>>  #include <linux/irqchip/mips-gic.h>
>> +#include <linux/mm.h>
>>  #include <linux/of_address.h>
>>  #include <linux/sched.h>
>>  #include <linux/smp.h>
>> @@ -29,6 +30,7 @@ struct gic_pcpu_mask {
>>  	DECLARE_BITMAP(pcpu_mask, GIC_MAX_INTRS);
>>  };
>>  
>> +static unsigned long gic_base_addr;
>>  static void __iomem *gic_base;
>>  static struct gic_pcpu_mask pcpu_masks[NR_CPUS];
>>  static DEFINE_SPINLOCK(gic_lock);
>> @@ -301,6 +303,19 @@ int gic_get_c0_fdc_int(void)
>>  				  GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_FDC));
>>  }
>>  
>> +int gic_map_user_section(struct vm_area_struct *vma, unsigned long base,
>> +			 unsigned long size)
>> +{
>> +	unsigned long pfn;
>> +
>> +	BUG_ON(!gic_present);
> 
> Why do you have a BUG() here, while you're just returning -1 in the case
> where CONFIG_MIPS_GIC is not refined? This feels overly harsh to me.

I suppose i could change that to return -1 if git_present is not true.

> 
>> +	BUG_ON(size > USM_VISIBLE_SECTION_SIZE);
> 
> Same here.

But I think this is different. The size of mapping has to be less than
USM_VISIBLE_SECTION_SIZE because that's the maximum data size exposed by
the GIC chip for userspace use. So if that's not true, then BUG_ON seems
like a sensible thing to do.

> 
> - Does this code have to be in the irqchip driver? It really feels out
> of place, and I'd rather see a function that returns the mappable range
> to the VDSO code, where the mapping would occur.
> 
> Thanks,
> 

That does seem like a good idea. I will have a look


-- 
markos
