Received: from mailapp01.imgtec.com ([195.59.15.196]:7514 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012710AbbKYMH4M8DPf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Nov 2015 13:07:56 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v2 03/19] genirq: Add GENERIC_IRQ_IPI Kconfig symbol
Date: Wed, 25 Nov 2015 12:06:41 +0000
Message-ID: <1448453217-3874-4-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1448453217-3874-1-git-send-email-qais.yousef@imgtec.com>
References: <1448453217-3874-1-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151125120641.z-XlilawtjtoAhK2-KruKbXMurAB0dUwlHMpB4BVsdE@z>

irqchip should select this config to denote it supports generic IPI.

This will aid generic arch code to know when it can use generic IPI layer.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 kernel/irq/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 3b48dab80164..3bbfd6a9c475 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -64,6 +64,10 @@ config IRQ_DOMAIN_HIERARCHY
 	bool
 	select IRQ_DOMAIN
 
+# Generic IRQ IPI support
+config GENERIC_IRQ_IPI
+	bool
+
 # Generic MSI interrupt support
 config GENERIC_MSI_IRQ
 	bool
-- 
2.1.0
