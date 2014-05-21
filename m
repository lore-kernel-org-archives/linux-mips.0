Received: from mail-bl2lp0208.outbound.protection.outlook.com ([207.46.163.208]:30397
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6822112AbaEUQb0fESx6 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 May 2014 18:31:26 +0200
Message-ID: <537CD4C6.5080905@caviumnetworks.com>
Date: Wed, 21 May 2014 09:31:02 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 10/15] MIPS: Add code for new system 'paravirt'.
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com> <1400597236-11352-11-git-send-email-andreas.herrmann@caviumnetworks.com> <537CAC74.4030800@imgtec.com>
In-Reply-To: <537CAC74.4030800@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
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
Cc: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, linux-mips@linux-mips.org, David Daney <ddaney.cavm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140521163102.SngSL12_25jb8rEO_bnV_P5mriGF0cArdml_Qilkga8@z>

On 05/21/2014 06:39 AM, James Hogan wrote:
[...]
>> diff --git a/arch/mips/paravirt/paravirt-irq.c b/arch/mips/paravirt/paravirt-irq.c
>> new file mode 100644
>> index 0000000..e1603dd
>> --- /dev/null
>> +++ b/arch/mips/paravirt/paravirt-irq.c
[...]
>
>> +static void irq_core_set_enable_local(void *arg)
>> +{
>> +	struct irq_data *data = arg;
>> +	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
>> +	unsigned int mask = 0x100 << cd->bit;
>> +
>> +	/*
>> +	 * Interrupts are already disabled, so these are atomic.
>
> Really? Even when called directly from irq_core_bus_sync_unlock with
> only a single core online?
>

Yes, but...


>> +	 */
>> +	if (cd->desired_en)
>> +		set_c0_status(mask);
>> +	else
>> +		clear_c0_status(mask);
>> +
>> +}
>> +
>> +static void irq_core_disable(struct irq_data *data)
>> +{
>> +	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
>> +	cd->desired_en = false;
>> +}
>> +
>> +static void irq_core_enable(struct irq_data *data)
>> +{
>> +	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
>> +	cd->desired_en = true;
>> +}
>> +
>> +static void irq_core_bus_lock(struct irq_data *data)
>> +{
>> +	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
>> +
>> +	mutex_lock(&cd->core_irq_mutex);
>> +}
>> +
>> +static void irq_core_bus_sync_unlock(struct irq_data *data)
>> +{
>> +	struct core_chip_data *cd = irq_data_get_irq_chip_data(data);
>> +
>> +	if (cd->desired_en != cd->current_en) {
>> +		/*
>> +		 * Can be called in early init when on_each_cpu() will
>> +		 * unconditionally enable irqs, so handle the case
>> +		 * where only a single CPU is online specially, and
>> +		 * directly call.
>> +		 */
>> +		if (num_online_cpus() == 1)
>> +			irq_core_set_enable_local(data);
>> +		else
>> +			on_each_cpu(irq_core_set_enable_local, data, 1);
>> +


...  This code is not correct.  It was initially done as a workaround 
for the issues fixed in commit 202da4005.

Now that on_each_cpu() is less buggy, we can unconditionally use it and 
the assertion above about "Interrupts are already disabled" will be true.


>> +		cd->current_en = cd->desired_en;
>> +	}
>> +
>> +	mutex_unlock(&cd->core_irq_mutex);
>> +}
>
>
>> +static int irq_pci_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
>> +{
>> +	return 0;
>> +}
>
> Is there any point even providing this callback?

I guess we can add them only when they are implemented.

>
>> +
>> +static void irq_pci_cpu_offline(struct irq_data *data)
>> +{
>> +}
>
> Or this one?

Same.

>
>> +
>> +static struct irq_chip irq_chip_pci = {
>> +	.name = "PCI",
>> +	.irq_enable = irq_pci_enable,
>> +	.irq_disable = irq_pci_disable,
>> +	.irq_ack = irq_pci_ack,
>> +	.irq_mask = irq_pci_mask,
>> +	.irq_unmask = irq_pci_unmask,
>> +	.irq_set_affinity = irq_pci_set_affinity,
>> +	.irq_cpu_offline = irq_pci_cpu_offline,
>> +};
>
>
>> diff --git a/arch/mips/paravirt/paravirt-smp.c b/arch/mips/paravirt/paravirt-smp.c
>> new file mode 100644
>> index 0000000..52f86eb
>> --- /dev/null
>> +++ b/arch/mips/paravirt/paravirt-smp.c
>
>> +static void paravirt_smp_finish(void)
>> +{
>> +	/* to generate the first CPU timer interrupt */
>> +	write_c0_compare(read_c0_count() + mips_hpt_frequency / HZ);
>
> This strikes me as a bit hacky. Are you sure it's actually necessary? (I
> would have expected some generic hotplug notifier somewhere to ensure
> that percpu clocksources gets initialised sensibly when a new CPU is
> brought up)
>
>
>> +static void paravirt_boot_secondary(int cpu, struct task_struct *idle)
>> +{
>> +	paravirt_smp_gp[cpu] = (unsigned long)(task_thread_info(idle));
>
> spurious brackets around task_thread_info(idle)
>
>> +	wmb();
>
> Wouldn't smp_wmb() be more accurate?

Probably.

>
>> +	paravirt_smp_sp[cpu] = __KSTK_TOS(idle);
>> +	mb();
>
> is this barrier necessary?

Really it is just make_writes_visible_asap(), but for OCTEON mb() or 
smp_wmb() is the closest that the kernel has.

It may not be necessary, but it doesn't really harm anything.


>
>> diff --git a/arch/mips/paravirt/serial.c b/arch/mips/paravirt/serial.c
>> new file mode 100644
>> index 0000000..e3f98b2
>> --- /dev/null
>> +++ b/arch/mips/paravirt/serial.c
>> @@ -0,0 +1,38 @@
>> +/*
>> + * This file is subject to the terms and conditions of the GNU General Public
>> + * License.  See the file "COPYING" in the main directory of this archive
>> + * for more details.
>> + *
>> + * Copyright (C) 2013 Cavium, Inc.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/virtio_console.h>
>> +
>> +#include <asm/mipsregs.h>
>> +
>> +/*
>> + * Emit one character to the boot console.
>> + */
>> +int prom_putchar(char c)
>> +{
>> +	hypcall3(0 /* Console output */, 0 /*  port 0 */, (unsigned long)&c, 1 /* len == 1 */);
>
> I think the hypcall API needs to be clearly specified and Documented
> somewhere along with its HYPCALL codes and scope. I.e. is it specific to
> kvmtool, or attempting to be a standard API across MIPS hypervisors.
>

I was intending it to be the later.  (standard API across MIPS hypervisors.)

The idea being that the first argument would be broken up into several 
ranges.

0..x : Globally available HYPCALL provided by all hypervisors.

m..n : MIPS KVM specific.

y..z : Reserved for the vendor.


For some values of x, m, n, y and z.

But perhaps it should just be MIPS KVM specific. If making it global is 
too much trouble.


> It probably should have nice definitions in a header and wrappers
> somewhere to make the arguments explicit and so there's no need for the
> comments explaining what the magic values mean.
>
> Cheers
> James
>
