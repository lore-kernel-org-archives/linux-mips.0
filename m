Received: from mailapp01.imgtec.com ([195.59.15.196]:21683 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012515AbbBDPWwrzjfL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 4 Feb 2015 16:22:52 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V2 30/34] MIPS: jz4740: add jz4780 interrupt controller support
Date: Wed, 4 Feb 2015 15:21:59 +0000
Message-ID: <1423063323-19419-31-git-send-email-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <1423063323-19419-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1423063323-19419-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com, gregkh@linuxfoundation.org, mturquette@linaro.org, sboyd@codeaurora.org, ralf@linux-mips.org, jslaby@suse.cz, tglx@linutronix.de, jason@lakedaemon.net, lars@metafoo.de, paul.burton@imgtec.com
Message-ID: <20150204152159.WZj6itD1LnmxvQ1fY9XivIlMAkexTvv7wdEDY8fVTo0@z>

From: Paul Burton <paul.burton@imgtec.com>

Allow the jz4780 interrupt controller to be probed from devicetree,
supporting the 64 interrupts it provides.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/mips/jz4740/irq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
index 3e53a32..de1c03e 100644
--- a/arch/mips/jz4740/irq.c
+++ b/arch/mips/jz4740/irq.c
@@ -137,6 +137,13 @@ static int __init jz4740_intc_of_init(struct device_node *node,
 }
 IRQCHIP_DECLARE(jz4740_intc, "ingenic,jz4740-intc", jz4740_intc_of_init);
 
+static int __init jz4780_intc_of_init(struct device_node *node,
+	struct device_node *parent)
+{
+	return jz47xx_intc_of_init(node, 2);
+}
+IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", jz4780_intc_of_init);
+
 #ifdef CONFIG_DEBUG_FS
 
 static inline void intc_seq_reg(struct seq_file *s, const char *name,
-- 
1.9.1
