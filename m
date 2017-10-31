Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:44518 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992325AbdJaQmScvvTA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 31 Oct 2017 17:42:18 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v2 0/8] irqchip: mips-gic: Cleanups, fixes, prep for multi-cluster
Date: Tue, 31 Oct 2017 09:41:43 -0700
Message-ID: <20171031164151.6357-1-paul.burton@mips.com>
In-Reply-To: <867evc5cc9.fsf@arm.com>
References: <867evc5cc9.fsf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>
Message-ID: <20171031164143.ozDCTSBwZ7vo9h0JNupFXxRpRh0iFwxm0KjIrYbzXEw@z>

This series continues cleaning & fixing up the MIPS GIC irqchip driver
whilst laying groundwork to support multi-cluster systems.

Patch 1 refactors in order to reduce some duplication and prepare us for
the following patches.

Patches 2-4 move per-CPU GIC configuration away from being performed all
at once when the driver is probed or when interrupts are masked &
unmasked, instead performing configuration as CPUs are brought online.
This allows us to support reconfiguring after clusters are powered down
& back up, generally cleans up and fixes bugs in the process.

Patch 5 makes use of num_possible_cpus() to reserve IPIs, rather than
the gic_vpes variable. This prepares us for multi-cluster in which
gic_vpes is mostly meaningless since it only reflects the local cluster,
and it generally makes more sense to use the more standard
num_possible_cpus().

Patch 6 removes the now unused gic_vpes variable.

Patch 7 is a general clean up but also prepares us for later patches as
described in its commit message.

Patch 8 is a general clean up marking some variables static.

This series by itself continues along the path towards supporting
multi-cluster systems such as the MIPS I6500, but does not yet get us
the whole way there. If you wish to see my current work in progress
which builds out multi-cluster support atop these patches then that can
be found in the multicluster branch of:

  git://git.linux-mips.org/pub/scm/paul/linux.git

Or browsed at:

  https://git.linux-mips.org/cgit/paul/linux.git/log/?h=multicluster

This series applies cleanly atop v4.14-rc7.

Changes in v2:
- Add & use CPUHP_AP_IRQ_MIPS_GIC_STARTING state rather than reusing
  the generically-named CPUHP_AP_IRQ_GIC_STARTING used for the ARM GIC.

Paul Burton (8):
  irqchip: mips-gic: Inline gic_local_irq_domain_map()
  irqchip: mips-gic: Use irq_cpu_online to (un)mask all-VP(E) IRQs
  irqchip: mips-gic: Mask local interrupts when CPUs come online
  irqchip: mips-gic: Configure EIC when CPUs come online
  irqchip: mips-gic: Use num_possible_cpus() to reserve IPIs
  irqchip: mips-gic: Remove gic_vpes variable
  irqchip: mips-gic: Share register writes in gic_set_type()
  irqchip: mips-gic: Make IPI bitmaps static

 drivers/irqchip/irq-mips-gic.c | 213 ++++++++++++++++++++++-------------------
 include/linux/cpuhotplug.h     |   1 +
 2 files changed, 115 insertions(+), 99 deletions(-)

-- 
2.14.3
