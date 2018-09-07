Received: from mail-eopbgr680135.outbound.protection.outlook.com ([40.107.68.135]:51136
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23994656AbeIGTr6pIaaB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Sep 2018 21:47:58 +0200
From: Dengcheng Zhu <dzhu@wavecomp.com>
Subject: Re: [PATCH v4 0/6] MIPS: kexec/kdump: Fix smp reboot and other issues
Date: Fri, 7 Sep 2018 19:47:45 +0000
Message-ID: <CO2PR0801MB21512A2FA3A3A718725DC035A2000@CO2PR0801MB2151.namprd08.prod.outlook.com>
References: <20180905155909.30454-1-dzhu@wavecomp.com>
 <20180905225455.luh32536uei5je6m@pburton-laptop>
 <5B917DD5.6020009@wavecomp.com>
 <20180906203455.pap7lh5itrbp7ed2@pburton-laptop>
 <5B91A8D1.4060206@wavecomp.com>,<20180906232122.wp72jwfnsbb2ps7b@pburton-laptop>
In-Reply-To: <20180906232122.wp72jwfnsbb2ps7b@pburton-laptop>
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
Message-ID: <20180907194745.E_6JxO1-Aco_MZGo2HUnqdmUyGV_25zOICm2fHeQTm8@z>

Hi Paul,


On cache issue, what if kexec_this_cpu() does local i$ flush and scache
invalidation? This is done only on CPU0, no IPI needed. And only CUP0 will use
reboot_code_buffer. In this way, marking other CPUs offline to prevent being
sent IPI is not needed.

As to "the associated fragility of needing to avoid anything that might IPI
them", I hope that's not a problem as the kexec sequence is determined: The last
IPI received is to ask them to stand by on reboot signal, because other than
kexec there is no other kernel code beyond our control, which might send IPIs.

> ...but the new kernel will have no knowledge of whether the old kernel
had CPUs marked online or offline, so I don't follow the argument?

[Dengcheng] I meant the new kernel shouldn't need CPU online info from the old
kernel. The new one is doing a "fresh" boot, provided CPUs 1+ have been halted.

Regarding the use of play_dead(), it's simple and generic - MIPS CPUs have
implemented their own play_dead(), which we can use to stop execution. Other
options may still come down to play_dead() to handle MT/MC details. The concern
of running it in parallel is really about the online status, which has been
explained above and in my last email.

A 'nicer' implementation stopping non-boot CPUs from one CPU might be available,
but handling code duplication of play_dead() and saving CPU states could be a
problem.

For now, no __flush_cache_all() in machine_kexec() + no marking offline in
kexec_this_cpu() + scache invalidation in kexec_this_cpu() might be a way to go.


Thanks,

Dengcheng

---

From: Paul Burton
Sent: Thursday, September 6, 2018 4:21 PM
To: Dengcheng Zhu
Cc: Paul Burton; ralf@linux-mips.org; linux-mips@linux-mips.org; rachel.mozes@intel.com
Subject: Re: [PATCH v4 0/6] MIPS: kexec/kdump: Fix smp reboot and other issues
  

Hi Dengcheng,

On Thu, Sep 06, 2018 at 03:23:13PM -0700, Dengcheng Zhu wrote:
> Regarding cache flushing in machine_kexec(), I recommend simply removing
> __flush_cache_all() as CPU0 will do local icache flush before jumping to
> reboot_code_buffer, and other CPUs don't jump at all.

Unfortunately that doesn't work - what if CPU 1 runs machine_kexec() &
writes to reboot_code_buffer, then CPU 0 fetches stale/garbage code from
L2 into its icache?

The icache flush I added in kexec_this_cpu() isn't enough in all systems
unless the CPU that wrote the code writes it back far enough for a
remote CPU to observe. The existing __flush_cache_all() is one
heavy-handed way to achieve that.

> Re: marking CPU offline in kexec_this_cpu(), it's probably good NOT doing
> it either, as the system is going to reboot from CPU0 soon.

...but the new kernel will have no knowledge of whether the old kernel
had CPUs marked online or offline, so I don't follow the argument?

Marking CPUs offline does have the advantage that we won't try to IPI
them. This just makes perfect sense to me, and note that both arch/arm &
arch/x86 offline CPUs during kexec too (I *really* like the way arch/arm
just uses disable_nonboot_cpus() to go through the usual hotplug
sequence in the non-crash case).

> HALT is good enough, no need to gate core power.
> As to whether it's safe running play_dead() in parallel, it shouldn't
> be a problem, as the loop is based
> on cpu online mask (which we don't mark offline as mentioned above) -- The
> CPU will simply halt itself. For non-MT CPUs, play_dead() does make sense
> as well, as it's supposed to stop this CPU's execution, getting ready to
> reboot from CPU0.

That feels like relying on play_dead() accidentally working rather than
doing something it's designed for though, and it would come at the
expense of not marking CPUs offline & the associated fragility of
needing to avoid anything that might IPI them (like some cache flush
functions, as we've seen). I'd much rather we figure out a way to do
this without all that.

One option might be to add something like arch/x86's stop_other_cpus &
crash_stop_other_cpus callbacks in struct plat_smp_ops, which we can
then implement as appropriate. We'd hopefully still reuse some of the
code from play_dead() implementations, but have the separation to allow
them to function differently where needed (eg. the new callbacks could
halt all threads in MT systems without caring about cpu_online_mask).

This would also give us a natural way to check whether a system actually
supports kexec properly, as we could just return with an error from
machine_kexec_prepare() if the stop_other_cpus callback isn't
implemented for the system (ie. is NULL).

Thanks,
    Paul
    
