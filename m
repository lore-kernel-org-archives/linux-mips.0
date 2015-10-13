Received: from mailapp01.imgtec.com ([195.59.15.196]:22622 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009472AbbJMKQzZHuls (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 12:16:55 +0200
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [RFC v2 PATCH 05/14] irq: add struct ipi_mask to irq_data
Date: Tue, 13 Oct 2015 11:16:13 +0100
Message-ID: <1444731382-19313-6-git-send-email-qais.yousef@imgtec.com>
In-Reply-To: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
References: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151013101613.CAcOoOZMFc7XvwEjThaG1w6L5TauTa2XrcTT88ViXRE@z>

It has a similar role to affinity mask, but tracks the IPI affinity instead.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irq.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 504133671985..b000b217ea24 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -157,6 +157,7 @@ struct irq_common_data {
 	void			*handler_data;
 	struct msi_desc		*msi_desc;
 	cpumask_var_t		affinity;
+	struct ipi_mask		ipi_mask;
 };
 
 /**
-- 
2.1.0
