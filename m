Received: from mailapp01.imgtec.com ([195.89.28.114]:49577 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6824764AbaCXKVw2bDnq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Mar 2014 11:21:52 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id EEB5577CEFEF8
        for <linux-mips@linux-mips.org>; Mon, 24 Mar 2014 10:21:44 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 10/12] MIPS: fix warning when including smp-ops.h with CONFIG_SMP=n
Date: Mon, 24 Mar 2014 10:19:33 +0000
Message-ID: <1395656375-9300-11-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140324101933.afhW3XWFpDLXmqL94IrEEGmZqIHpH6OzwxknwvA-X8M@z>

The gic_send_ipi_mask function declared in smp-ops.h takes a struct
cpumask argument, but linux/cpumask.h is only included within an #ifdef
CONFIG_SMP. Move the gic_ function declarations within that #ifdef too
to fix warnings during build such as:

In file included from arch/mips/fw/arc/init.c:15:0:
/mnt/buildbot/kernel/mips/slave/mips-linux__allno_/build/arch/mips/include/asm/smp-ops.h:62:44:
warning: 'struct cpumask' declared inside parameter list [enabled by
default]
 extern void gic_send_ipi_mask(const struct cpumask *mask, unsigned int
action);

Reported-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/smp-ops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/smp-ops.h b/arch/mips/include/asm/smp-ops.h
index a042d24..73d35b1 100644
--- a/arch/mips/include/asm/smp-ops.h
+++ b/arch/mips/include/asm/smp-ops.h
@@ -45,6 +45,9 @@ static inline void plat_smp_setup(void)
 	mp_ops->smp_setup();
 }
 
+extern void gic_send_ipi_single(int cpu, unsigned int action);
+extern void gic_send_ipi_mask(const struct cpumask *mask, unsigned int action);
+
 #else /* !CONFIG_SMP */
 
 struct plat_smp_ops;
@@ -60,9 +63,6 @@ static inline void register_smp_ops(struct plat_smp_ops *ops)
 
 #endif /* !CONFIG_SMP */
 
-extern void gic_send_ipi_single(int cpu, unsigned int action);
-extern void gic_send_ipi_mask(const struct cpumask *mask, unsigned int action);
-
 static inline int register_up_smp_ops(void)
 {
 #ifdef CONFIG_SMP_UP
-- 
1.8.5.3
