Received: from mailapp01.imgtec.com ([195.59.15.196]:2032 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010797AbbKYMHdSTX5f (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Nov 2015 13:07:33 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v2 00/19] Implement generic IPI support mechanism
Date: Wed, 25 Nov 2015 12:06:38 +0000
Message-ID: <1448453217-3874-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20151125120638.5HOLVwFwATu8n7PA28W3vyd9NdhZA7togzZVc5aJgtY@z>

This series adds support for a generic IPI mechanism that can be used by both
arch and drivers to send IPIs to other CPUs.

v2 introduces a big change over v1 and should have addressed all review comments.

List of changes:
	- We now have 2 IPI flags to distinguish per cpu IPIs from single ones.
	- IPI functions are in ipi.c
	- Added offset to ipi_mask to cater for masks starting at non-zero.
	- New API for sending IPIs.
	- Added device hierarchy to mips-gic.
	- Added a new patch to reserve mips-gic IPIs from DT.
	- Dropped the Docs help for now till API stabilises.

It's hard to detail every change done but these are the headlines.
It would be good to look at all patches again. Hopefully I broke them down in
an away that is easy to review.

I hope this is close enough to how it should be done and I didn't stray off.

I tested this on Malta platform which effectively doesn't have DT support.
Unfortunately I don't have access to a platform with DT support that can run on
latest kernel. The recent changes in irq/core makes backporting the patches non
trivial.

Thanks in advance.

Qais

Qais Yousef (19):
  genirq: Add new IRQ_DOMAIN_FLAGS_IPI
  genirq: Add DOMAIN_BUS_IPI
  genirq: Add GENERIC_IRQ_IPI Kconfig symbol
  genirq: Add new struct ipi_mask and helper functions
  genirq: Add struct ipi_mask to irq_data
  genirq: Add struct ipi_mapping and its helper functions
  genirq: Make irq_domain_alloc_descs() non static
  genirq: Add a new generic IPI reservation code to irq core
  genirq: Add a new function to get IPI reverse mapping
  genirq: Add a new irq_send_ipi() to irq_chip
  genirq: Implement ipi_send_{mask, single}()
  irqchip/mips-gic: Add a IPI hierarchy domain
  irqchip/mips-gic: Add device hierarchy domain
  irqchip/mips-gic: Use gic_vpes instead of NR_CPUS
  irqchip/mips-gic: Clear percpu_masks correctly when mapping
  MIPS: Add generic SMP IPI support
  MIPS: Make smp CMP, CPS and MT use the new generic IPI functions
  MIPS: Delete smp-gic.c
  irqchip/mips-gic: Add new DT property to reserve IPIs

 .../bindings/interrupt-controller/mips-gic.txt     |   7 +
 arch/mips/Kconfig                                  |   6 -
 arch/mips/include/asm/smp-ops.h                    |   5 +-
 arch/mips/kernel/Makefile                          |   1 -
 arch/mips/kernel/smp-cmp.c                         |   4 +-
 arch/mips/kernel/smp-cps.c                         |   4 +-
 arch/mips/kernel/smp-gic.c                         |  64 ---
 arch/mips/kernel/smp-mt.c                          |   2 +-
 arch/mips/kernel/smp.c                             | 139 ++++++
 drivers/irqchip/Kconfig                            |   2 +
 drivers/irqchip/irq-mips-gic.c                     | 354 +++++++++++----
 include/linux/irq.h                                | 152 +++++++
 include/linux/irqchip/mips-gic.h                   |   3 -
 include/linux/irqdomain.h                          |  46 ++
 kernel/irq/Kconfig                                 |   4 +
 kernel/irq/Makefile                                |   1 +
 kernel/irq/ipi.c                                   | 478 +++++++++++++++++++++
 kernel/irq/irqdomain.c                             |   6 +-
 18 files changed, 1102 insertions(+), 176 deletions(-)
 delete mode 100644 arch/mips/kernel/smp-gic.c
 create mode 100644 kernel/irq/ipi.c

-- 
2.1.0
