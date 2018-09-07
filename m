Received: from mail-eopbgr700130.outbound.protection.outlook.com ([40.107.70.130]:23695
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23994663AbeIGWVWAz6Mn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 8 Sep 2018 00:21:22 +0200
From: Dengcheng Zhu <dzhu@wavecomp.com>
Subject: Re: [PATCH v4 0/6] MIPS: kexec/kdump: Fix smp reboot and other issues
Date: Fri, 7 Sep 2018 22:21:10 +0000
Message-ID: <CO2PR0801MB2151111E37EDDB45D93F0F64A2000@CO2PR0801MB2151.namprd08.prod.outlook.com>
References: <20180905155909.30454-1-dzhu@wavecomp.com>
 <20180905225455.luh32536uei5je6m@pburton-laptop>
 <5B917DD5.6020009@wavecomp.com>
 <20180906203455.pap7lh5itrbp7ed2@pburton-laptop>
 <5B91A8D1.4060206@wavecomp.com>
 <20180906232122.wp72jwfnsbb2ps7b@pburton-laptop>
 <CO2PR0801MB21512A2FA3A3A718725DC035A2000@CO2PR0801MB2151.namprd08.prod.outlook.com>,<20180907214232.du2fh422uwzhdusm@pburton-laptop>
In-Reply-To: <20180907214232.du2fh422uwzhdusm@pburton-laptop>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <dzhu@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <pburton@wavecomp.com>
Cc: "ralf@linux-mips.org" <ralf@linux-mips.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "rachel.mozes@intel.com" <rachel.mozes@intel.com>
Message-ID: <20180907222110.YA6tb2qXN5BP4CH3X4OMqdCmQPSDBlnKE-QITxBZ8gY@z>

Hi Paul,


> The problem is that the "only CPU0 will use reboot_code_buffer" part
isn't true because CPU0 might not be the one that writes to it.

[Dengcheng]: I didn't say CPU0 is always the one running machine_kexec().
Actually, in my testing, I intentionally did something like:

taskset -c 3 echo c > /proc/sysrq-trigger

And for "either halted or powered down", do you have any idea/plan for
Octeon, Loognson and bmips?


Thanks,

Dengcheng


From: Paul Burton
Sent: Friday, September 7, 2018 2:42 PM
To: Dengcheng Zhu
Cc: Paul Burton; ralf@linux-mips.org; linux-mips@linux-mips.org; rachel.mozes@intel.com
Subject: Re: [PATCH v4 0/6] MIPS: kexec/kdump: Fix smp reboot and other issues
  

Hi Dengcheng,

On Fri, Sep 07, 2018 at 12:47:45PM -0700, Dengcheng Zhu wrote:
> On cache issue, what if kexec_this_cpu() does local i$ flush and scache
> invalidation? This is done only on CPU0, no IPI needed. And only CUP0 will use
> reboot_code_buffer. In this way, marking other CPUs offline to prevent being
> sent IPI is not needed.

The problem is that the "only CPU0 will use reboot_code_buffer" part
isn't true because CPU0 might not be the one that writes to it. Though
perhaps if we moved the memcpy() from machine_kexec() to
kexec_this_cpu() that could work.

It still doesn't seem ideal to me that we'd have to even consider IPIs &
the fact that we might silently hang if we accidentally send one. I
really think it would be cleaner to mark CPUs offline & the problem is
solved naturally - we shouldn't IPI these CPUs, and marking them offline
means that we won't. Problem solved, and consistently with other
architectures.

> As to "the associated fragility of needing to avoid anything that might IPI
> them", I hope that's not a problem as the kexec sequence is determined: The last
> IPI received is to ask them to stand by on reboot signal, because other than
> kexec there is no other kernel code beyond our control, which might send IPIs.

But it does mean we can't call certain things, like __flush_cache_all(),
which means that developers need to 1) know that and 2) remember to
avoid any functions like this that perform an IPI behind the scenes. It
just feels like loading a gun & leaving it pointed at our feet - by
itself it's not necessarily going to cause a problem, but it would be oh
so easy to trigger problems later.

> > ...but the new kernel will have no knowledge of whether the old kernel
> had CPUs marked online or offline, so I don't follow the argument?
> 
> [Dengcheng] I meant the new kernel shouldn't need CPU online info from the old
> kernel. The new one is doing a "fresh" boot, provided CPUs 1+ have been halted.
> 
> Regarding the use of play_dead(), it's simple and generic - MIPS CPUs have
> implemented their own play_dead(), which we can use to stop execution. Other
> options may still come down to play_dead() to handle MT/MC details. The concern
> of running it in parallel is really about the online status, which has been
> explained above and in my last email.

But play_dead() really doesn't mean what you're suggesting it means.

What we want for kexec is that the CPU is stopped entirely - either
halted or powered down. Failing that it needs to be running a loop from
somewhere that we know isn't going to be overwritten, and the code it's
running needs to be able to hand over to the new kernel later (eg. the
existing kexec_smp_wait loop implements this latter approach).

Whilst the smp-cps.c implementation of play_dead() will currently halt
or power down the CPU, that's not universally true & doesn't necessarily
even need to remain true for smp-cps.c in the future (eg. we could
decide the halt/power down step would be cleaner to do in cps_cpu_die).

A quick look at the other play_dead() implementations we have shows that
both the cavium-octeon & loongson3 versions leave the CPU running a
loop (within the current/old kernel), whilst the bmips version just sits
at a wait instruction before jumping back to the fixed location of
bmips_secondary_reentry (in the current/old kernel) once interrupted.
None of those are suitable for kexec.

In general the CPU hotplug code just needs that when play_dead() runs on
the CPU going offline, and the struct plat_smp_ops cpu_die() callback
runs on some other CPU, the CPU being offlined will be quiesced to a
degree that it won't interfere with Linux. This is different to kexec
where we need the CPU to stop in such a way that it's fine that we might
overwrite the old kernel, and then be able to start it running the new
kernel later. As described before, that means it either needs to halt or
power down until the new kernel takes control of it or it needs to run
some loop from some location that we know won't be overwritten.

play_dead() is simple & already exists, it just doesn't do quite what we
need kexec to do outside of the one system you're looking at.

> A 'nicer' implementation stopping non-boot CPUs from one CPU might be available,
> but handling code duplication of play_dead() and saving CPU states could be a
> problem.

Code that can be shared between play_dead() & kexec can still be shared
if we have a different callback - the particular implementation of the
two would just have both call a common function for the part that's
common.

> For now, no __flush_cache_all() in machine_kexec() + no marking offline in
> kexec_this_cpu() + scache invalidation in kexec_this_cpu() might be a way to go.

For the system you're interested in, sure that works. But as I've
pointed out in my last few emails it does not work in general for other
systems that we also need to support in the kernel.

Thanks,
    Paul
    
