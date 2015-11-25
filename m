Received: from mailapp01.imgtec.com ([195.59.15.196]:45785 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012703AbbKYMHw2MjPf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Nov 2015 13:07:52 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v2 02/19] genirq: Add DOMAIN_BUS_IPI
Date: Wed, 25 Nov 2015 12:06:40 +0000
Message-ID: <1448453217-3874-3-git-send-email-qais.yousef@imgtec.com>
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
Message-ID: <20151125120640.y0dvKF2CaZvpWCoR86Gz9CrvelzgXy5xhl-iAeCzIf0@z>

We need a way to search and match IPI domains.

Using the new enum we can use irq_find_matching_host() to do that.

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
---
 include/linux/irqdomain.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index c1a59f37674d..f717796a4d5e 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -73,6 +73,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_PCI_MSI,
 	DOMAIN_BUS_PLATFORM_MSI,
 	DOMAIN_BUS_NEXUS,
+	DOMAIN_BUS_IPI,
 };
 
 /**
-- 
2.1.0
