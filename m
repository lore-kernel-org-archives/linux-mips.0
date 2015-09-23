Received: from mailapp01.imgtec.com ([195.59.15.196]:42335 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008527AbbIWOtnid00n (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 23 Sep 2015 16:49:43 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH 0/6] Implement generic IPI support mechanism
Date: Wed, 23 Sep 2015 15:49:12 +0100
Message-ID: <1443019758-20620-1-git-send-email-qais.yousef@imgtec.com>
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
To: linux-kernel@vger.kernel.org, tglx@linutronix.de
Cc: marc.zyngier@arm.com, jason@lakedaemon.net, jiang.liu@linux.intel.com, linux-mips@linux-mips.org, Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20150923144912.K14Rjuy7uNMvlB0nWP7YYYiPCstf8fm965ZoG4L9vgk@z>

This RFC series attempts to implement a generic IPI layer for reserving and sending IPI.

It is based on the discussion in this link

	https://lkml.org/lkml/2015/8/26/713

This series deals with points #1 and #2 only. Since I'm not the irq expert, I'm hoping this
series will give me early feedback and drive the discussion further about any potential
tricky points.

I tried to keep changes clean and small, but since this is just an RFC I might have missed
few things.

Thomas I hope I didn't stray far from what you had in mind :-)

My only testing so far is having SMP linux booting.

Qais Yousef (6):
  irqdomain: add new IRQ_DOMAIN_FLAGS_IPI
  irqdomain: add a new send_ipi() to irq_domain_ops
  irqdomain: add struct irq_hwcfg and helper functions
  irq: add a new generic IPI handling code to irq core
  irqchip: mips-gic: add a IPI hierarchy domain
  irqchip: mips-gic: use the new generic IPI API

 arch/mips/kernel/smp-gic.c       |  37 ++--
 drivers/irqchip/Kconfig          |   1 +
 drivers/irqchip/irq-mips-gic.c   | 189 ++++++++++++++++++---
 include/linux/irqchip/mips-gic.h |   3 +-
 include/linux/irqdomain.h        |  67 ++++++++
 kernel/irq/irqdomain.c           | 352 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 601 insertions(+), 48 deletions(-)

-- 
2.1.0
