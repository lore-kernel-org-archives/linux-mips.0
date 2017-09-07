Received: from mailapp01.imgtec.com ([195.59.15.196]:44298 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994827AbdIGX1AoSp0k (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 8 Sep 2017 01:27:00 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [RFC PATCH v1 3/9] genirq: Introduce irq_is_percpu_devid()
Date: Thu, 7 Sep 2017 16:25:36 -0700
Message-ID: <20170907232542.20589-4-paul.burton@imgtec.com>
In-Reply-To: <20170907232542.20589-1-paul.burton@imgtec.com>
References: <1682867.tATABVWsV9@np-p-burton>
 <20170907232542.20589-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>, Ralf Baechle <ralf@linux-mips.org>
Cc: dianders@chromium.org, James Hogan <james.hogan@imgtec.com>, Brian Norris <briannorris@chromium.org>, Jason Cooper <jason@lakedaemon.net>, jeffy.chen@rock-chips.com, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, tfiga@chromium.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170907232536.vOp7KVDuRU7JkCkH842thkuwctlsbN9nbYqTKV_cB1k@z>

In preparation for allowing code to handle both percpu_devid interrupts
using the percpu interrupt APIs, and non-percpu_devid but still percpu
interrupts with the regular interrupt APIs, introduce a new
irq_is_percpu_devid() helper function to allow callers to check whether
an interrupt has the IRQ_PER_CPU_DEVID flag set.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org
---

 include/linux/irqdesc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index 3e90a094798d..93960cf36e23 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -244,6 +244,14 @@ static inline int irq_is_percpu(unsigned int irq)
 	return desc->status_use_accessors & IRQ_PER_CPU;
 }
 
+static inline int irq_is_percpu_devid(unsigned int irq)
+{
+	struct irq_desc *desc;
+
+	desc = irq_to_desc(irq);
+	return desc->status_use_accessors & IRQ_PER_CPU_DEVID;
+}
+
 static inline void
 irq_set_lockdep_class(unsigned int irq, struct lock_class_key *class)
 {
-- 
2.14.1
