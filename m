Received: from mailapp01.imgtec.com ([195.59.15.196]:15944 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009935AbbGIJlmNOQth (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:42 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 753C0BCAF6C3
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:34 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 09/19] MIPS: Add platform callback before initializing the L2 cache
Date: Thu, 9 Jul 2015 10:40:43 +0100
Message-ID: <1436434853-30001-10-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150709094043.KDi4CoP5ioPiMgwUFYrrVx2CPuRzjO4NcI35GnH8N9Q@z>

Allow platforms to perform platform-specific steps before configuring
the L2 cache. This is necessary for platforms with CM3 since the L2
parameters no longer live in the Config2 register.

Cc: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/mips-cm.c       |  7 +++++++
 arch/mips/mm/sc-mips.c           | 10 ++++++++++
 arch/mips/mti-malta/malta-init.c |  7 +++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 85bbe9b96759..42602f30949f 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -81,6 +81,13 @@ int mips_cm_probe(void)
 	phys_addr_t addr;
 	u32 base_reg;
 
+	/*
+	 * No need to probe again if we have already been
+	 * here before.
+	 */
+	if (mips_cm_base)
+		return 0;
+
 	addr = mips_cm_phys_base();
 	BUG_ON((addr & CM_GCR_BASE_GCRBASE_MSK) != addr);
 	if (!addr)
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 5fa452e8cff9..53ea8391f9bb 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -123,6 +123,10 @@ static int __init mips_sc_probe_cm3(void)
 	return 1;
 }
 
+void __weak platform_early_l2_init(void)
+{
+}
+
 static inline int __init mips_sc_probe(void)
 {
 	struct cpuinfo_mips *c = &current_cpu_data;
@@ -132,6 +136,12 @@ static inline int __init mips_sc_probe(void)
 	/* Mark as not present until probe completed */
 	c->scache.flags |= MIPS_CACHE_NOT_PRESENT;
 
+	/*
+	 * Do we need some platform specific probing before
+	 * we configure L2?
+	 */
+	platform_early_l2_init();
+
 	if (mips_cm_revision() >= CM_REV_CM3)
 		return mips_sc_probe_cm3();
 
diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
index cec3e187c48f..53c24784a2f7 100644
--- a/arch/mips/mti-malta/malta-init.c
+++ b/arch/mips/mti-malta/malta-init.c
@@ -303,3 +303,10 @@ mips_pci_controller:
 	if (!register_vsmp_smp_ops())
 		return;
 }
+
+void platform_early_l2_init(void)
+{
+	/* L2 configuration lives in the CM3 */
+	if (mips_cm_revision() >= CM_REV_CM3)
+		mips_cm_probe();
+}
-- 
2.4.5
