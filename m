Received: from mail-eopbgr700099.outbound.protection.outlook.com ([40.107.70.99]:26160
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990411AbeIGXbQKQT26 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 8 Sep 2018 01:31:16 +0200
From: Dengcheng Zhu <dzhu@wavecomp.com>
Subject: Re: [PATCH v4 0/6] MIPS: kexec/kdump: Fix smp reboot and other issues
Date: Fri, 7 Sep 2018 23:31:03 +0000
Message-ID: <CO2PR0801MB21518DC2B1D4993DFCCF21E6A2000@CO2PR0801MB2151.namprd08.prod.outlook.com>
References: <20180905155909.30454-1-dzhu@wavecomp.com>
 <20180905225455.luh32536uei5je6m@pburton-laptop>
 <5B917DD5.6020009@wavecomp.com>
 <20180906203455.pap7lh5itrbp7ed2@pburton-laptop>
 <5B91A8D1.4060206@wavecomp.com>
 <20180906232122.wp72jwfnsbb2ps7b@pburton-laptop>
 <CO2PR0801MB21512A2FA3A3A718725DC035A2000@CO2PR0801MB2151.namprd08.prod.outlook.com>
 <20180907214232.du2fh422uwzhdusm@pburton-laptop>
 <CO2PR0801MB2151111E37EDDB45D93F0F64A2000@CO2PR0801MB2151.namprd08.prod.outlook.com>,<20180907231154.hnnhi2kns77hdnr2@pburton-laptop>
In-Reply-To: <20180907231154.hnnhi2kns77hdnr2@pburton-laptop>
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
Message-ID: <20180907233103.DLxdPhtaTxPb-6Wucenr4IpzUrXIbXEt4QT28rmkn48@z>

> Well, if CPU 0 isn't running machine_kexec() then some other CPU is
doing the write to reboot_code_buffer and therefore CPU 0 isn't the only
one accessing/using it.

[Dengcheng]: I meant only CPU0 will jump to reboot_code_buffer. This buffer is
surely possibly written by another CPU. Any issue with the machine_kexec() CPU
flush "local" dache, and CPU0 invalidate "local" icache and scahe before jumping?


Thanks,

Dengcheng


From: Paul Burton
Sent: Friday, September 7, 2018 4:11 PM
To: Dengcheng Zhu
Cc: Paul Burton; ralf@linux-mips.org; linux-mips@linux-mips.org; rachel.mozes@intel.com
Subject: Re: [PATCH v4 0/6] MIPS: kexec/kdump: Fix smp reboot and other issues
  

On Fri, Sep 07, 2018 at 03:21:10PM -0700, Dengcheng Zhu wrote:
> Hi Paul,
> 
> 
> > The problem is that the "only CPU0 will use reboot_code_buffer" part
> isn't true because CPU0 might not be the one that writes to it.
> 
> [Dengcheng]: I didn't say CPU0 is always the one running machine_kexec().
> Actually, in my testing, I intentionally did something like:
> 
> taskset -c 3 echo c > /proc/sysrq-trigger

Well, if CPU 0 isn't running machine_kexec() then some other CPU is
doing the write to reboot_code_buffer and therefore CPU 0 isn't the only
one accessing/using it.

As I walked through in an earlier email, the safe way for this to happen
is for the machine_kexec() CPU to write back its dcache as far as needed
for a remote CPU's icache to observe the stores. Having CPU 0 be the
only one to do any cache maintenance will not achieve that.

As I mentioned before, if you're testing on I6x00 then you probably got
away with it because the icache fills from the dcache. You'd probably
also get away with having CPU 0 be the only one to do cache maintenance
since the CM globalizes hit cache ops. But not all MIPS CPUs would be so
lucky.

> And for "either halted or powered down", do you have any idea/plan for
> Octeon, Loognson and bmips?

Well like I said before if we add a callback to struct plat_smp_ops to
stop other CPUs, at least in the crash case, then we can check that &
refuse to kexec() on systems that haven't implemented it.

Octeon right now has kexec, so any changes like this should bring Octeon
along for the ride by implementing the new callback there. Loongson has
a patch pending [1] so that should probably be taken into account too.
bmips would just be left alone, and wouldn't support kexec until someone
implements the new callback.

[1] https://patchwork.linux-mips.org/patch/20432/

Thanks,
    Paul
    
