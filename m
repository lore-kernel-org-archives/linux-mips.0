Received: from mailapp01.imgtec.com ([195.89.28.115]:45052 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6823033AbaCXKU6xmmW8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Mar 2014 11:20:58 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id A4A60496353D7
        for <linux-mips@linux-mips.org>; Mon, 24 Mar 2014 10:20:47 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 05/12] MIPS: smp-cmp: remove incorrect core number probe
Date: Mon, 24 Mar 2014 10:19:28 +0000
Message-ID: <1395656375-9300-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
References: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140324101928.cQtbzo8fTs_sakwIr0XXYjruABn83NBTjdubSQaPI0Y@z>

This probing is already done by decode_configs as part of cpu_probe, and
furthermore the implementation here was incorrect for any MT core with
a number of VPEs other than 2.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/smp-cmp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/smp-cmp.c b/arch/mips/kernel/smp-cmp.c
index 594660e..3ef55fb7 100644
--- a/arch/mips/kernel/smp-cmp.c
+++ b/arch/mips/kernel/smp-cmp.c
@@ -41,7 +41,7 @@
 
 static void cmp_init_secondary(void)
 {
-	struct cpuinfo_mips *c = &current_cpu_data;
+	struct cpuinfo_mips *c __maybe_unused = &current_cpu_data;
 
 	/* Assume GIC is present */
 	change_c0_status(ST0_IM, STATUSF_IP3 | STATUSF_IP4 | STATUSF_IP6 |
@@ -49,7 +49,6 @@ static void cmp_init_secondary(void)
 
 	/* Enable per-cpu interrupts: platform specific */
 
-	c->core = (read_c0_ebase() >> 1) & 0x1ff;
 #if defined(CONFIG_MIPS_MT_SMP) || defined(CONFIG_MIPS_MT_SMTC)
 	if (cpu_has_mipsmt)
 		c->vpe_id = (read_c0_tcbind() >> TCBIND_CURVPE_SHIFT) &
-- 
1.8.5.3
