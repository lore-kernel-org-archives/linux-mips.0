Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:61063 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6816005AbaHAFnjndQ3V (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 1 Aug 2014 07:43:39 +0200
Date: Fri, 1 Aug 2014 11:17:40 +0530
From: Jayachandran C. <jchandra@broadcom.com>
Subject: Re: [next:master
 9246/10000]arch/mips/include/asm/mach-netlogic/topology.h:14:0:
 warning:"topology_physical_package_id" redefined
Message-ID: <20140801054739.GF12788@jayachandranc.netlogicmicro.com>
References: <53dac64a.+6998x07jTwh9JtK%fengguang.wu@intel.com>
 <tencent_4DD2F4897C8F21F621E1333A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_4DD2F4897C8F21F621E1333A@qq.com>
Return-Path: <jchandra@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?utf-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, Ralf Baechle <ralf@linux-mips.org>, kbuild-all <kbuild-all@01.org>, linux-mips@linux-mips.org
Message-ID: <20140801054740.mxEnoDxyNs9e26SOwyi35CQBsjdDCxlGJrtmVX6dDLM@z>

Hi Huacai,

On Fri, Aug 01, 2014 at 09:19:11AM +0800, 陈华才 wrote:
> Hi, Jayachandran
> 
> I think I introduce a more *general* method of MIPS CPU's topology in commit bda4584cd94 (MIPS: Support CPU topology files in sysfs). So, could you please modify the Netlogic's code to adaptive the new framework? If you can't do that, I'll send a new version of my patch by adding some #ifndef.

You have added the definitions for topology in asm/smp.h

+#define topology_physical_package_id(cpu)      (cpu_data[cpu].package)
+#define topology_core_id(cpu)                  (cpu_data[cpu].core)
+#define topology_core_cpumask(cpu)             (&cpu_core_map[cpu])
+#define topology_thread_cpumask(cpu)           (&cpu_sibling_map[cpu])

These changes have to be in asm/topology.h and should only change the
definitions if mach-<platform>/topology.h does not define them.

Can you please look at fixing this?

Thanks,
JC.
