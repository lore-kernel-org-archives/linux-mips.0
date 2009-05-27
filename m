Received: from mail-px0-f119.google.com ([209.85.216.119]:44190 "EHLO
	mail-px0-f119.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S20022027AbZE0Rix (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 27 May 2009 18:38:53 +0100
Subject: Re: [loongson-PATCH-v2 19/23] Loongson2F cpufreq support
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
In-Reply-To: <m3skiqop3b.fsf@anduin.mandriva.com>
References: <cover.1243362545.git.wuzj@lemote.com>
	 <1a75bd9d59ff0c92250ddb7238509a7a4b154505.1243362545.git.wuzj@lemote.com>
	 <m3skiqop3b.fsf@anduin.mandriva.com>
Content-Type: text/plain
Date: Thu, 28 May 2009 01:37:59 +0800
Message-ID: <1243445879.11263.116.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Arnaud Patard <apatard@mandriva.com>, Yan Hua <yanh@lemote.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Zhang Fuxin <zhangfx@lemote.com>, loongson-dev <loongson-dev@googlegroups.com>, Nicholas Mc Guire <der.herr@hofr.at>, Liu Junliang <liujl@lemote.com>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090527173759.L4gaG-B3y0G0fRm4CoPXoswUToBxPqE1AhBCX4pHkDc@z>

Hi,

On Wed, 2009-05-27 at 11:46 +0200, Arnaud Patard wrote:
> > Loongson2F add a new capability to dynamic scaling cpu frequency.  However the
> > cpu count timer depends on cpu frequency. So an alternative clock must be used
> > if this driver is enabled. Besides, the CPU enter wait state when the frequency
> > is setting zero. All these features help power save.
> >
> > In fuloong(2f) and yeeloong(2f), if you want to use this feature, you
> > should enable the cs5536 mfgpt timer.
[...]
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index 74efb43..aa8cd64 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -2136,6 +2136,23 @@ source "kernel/power/Kconfig"
> >  
> >  endmenu
> >  
> > +menu "CPU Frequency scaling"
> > +
> > +source "drivers/cpufreq/Kconfig"
> > +
> > +config LOONGSON2F_CPU_FREQ
> > +	bool "Loongson-2F CPU Frequency driver"
> > +	depends on CPU_LOONGSON2F && CPU_FREQ && CS5536_MFGPT
> 
> If I have a clock from (for instance) a i8253 compatible source, one will
> have to add something here. I'm not sure it's a good idea. Did you try
> with something like "select  LOONGSON2F_CPU_FREQ" in the machine Kconfig
> entry ?
> 

something like "select LOONGSON2F_CPU_FREQ" not work, because users may
do not need LOONGSON2F_CPU_FREQ.
 
what about this solution?

+config LOONGSON2F_CPU_FREQ +	bool "Loongson-2F CPU Frequency driver"
+	depends on CPU_LOONGSON2F && CPU_FREQ && (CS5536_MFGPT || I8253)


> > diff --git a/arch/mips/kernel/loongson2f_freq.c b/arch/mips/kernel/loongson2f_freq.c
> > new file mode 100644
> > index 0000000..183f36b
[...]
> > +static int __init loongson2f_cpufreq_module_init(void)
> > +{
> > +	struct cpuinfo_mips *c = &cpu_data[0];
> > +	int result;
> > +
> > +	if (c->processor_id != PRID_IMP_LOONGSON2F)
> > +		return -ENODEV;
> 
> How can this happen ? the Kconfig entry depends on CPU_LOONGSON2F so I
> would expect this is useless.
> 

i just removed it, thanks!

> > diff --git a/arch/mips/loongson/common/clock.c b/arch/mips/loongson/common/clock.c
> > new file mode 100644
> > index 0000000..a8c648d
> > --- /dev/null
> > +++ b/arch/mips/loongson/common/clock.c
[...]
> > +/*
> > + * This is the simple version of Loongson-2F wait
> > + * Maybe we need do this in interrupt disabled content
> > + */
> > +DEFINE_SPINLOCK(loongson2f_wait_lock);
> > +void loongson2f_cpu_wait(void)
> > +{
> > +	u32 cpu_freq;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&loongson2f_wait_lock, flags);
> > +	cpu_freq = LOONGSON_CHIPCFG0;
> > +	LOONGSON_CHIPCFG0 &= ~0x7;	/* Put CPU into wait mode */
> 
> by doing this, if you want to "wake up" the 2f, you need an external
> interrupt source otherwise your only solution is to power down your
> machine. Are you sure that it's really safe to enable it by default ?
> 

sorry, I am not clear why Yanhua use a loongson-specific cpu_wait
here(seems used in loongson2f_freq.c)? perhaps he can explain it. and I
also have a question about it: why not use the "wait" instruction
directly here like r4k_wait() does? or just use the r4k_wait() function
via adding some code in arch/mips/kernel/cpu-probe.c:

void __init check_wait(void)
{
    ...
    switch (c->cputype) {
    ...
    case CPU_PR4450:
    case CPU_BCM3302:
    case CPU_CAVIUM_OCTEON:
+    case CPU_LOONGSON2:
        cpu_wait = r4k_wait;
        break;
    ...
}

and even if we not use cpufreq, is better to enable a loongson-specific
cpu_wait()? cpu_wait() is called in cpu_idle() (defined in
arch/mips/kernel/process.c), does we need cpu_wait() to save power when
cpu is idle?
