Received: from mailapp01.imgtec.com ([195.59.15.196]:8084 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006697AbbFXI3a11FJx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 Jun 2015 10:29:30 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E8C27E1A2ABE6
        for <linux-mips@linux-mips.org>; Wed, 24 Jun 2015 09:29:22 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: kernel: traps: Fix broken indentation
Date: Wed, 24 Jun 2015 09:29:20 +0100
Message-ID: <1435134560-5840-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150624082920.WsT4tKuLvDVXi4kQypku4vbZui3GipZrMpRo8edtngM@z>

Fix broken indentation caused by the SMTC removal
commit b633648c5ad3cfbda0b3daea50d2135d44899259
("MIPS: MT: Remove SMTC support")

Fixes: b633648c5ad3c ("MIPS: MT: Remove SMTC support")
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/traps.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index d2d1c1933bc9..232a6a942b8b 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2129,10 +2129,10 @@ void per_cpu_trap_init(bool is_boot_cpu)
 	BUG_ON(current->mm);
 	enter_lazy_tlb(&init_mm, current);
 
-		/* Boot CPU's cache setup in setup_arch(). */
-		if (!is_boot_cpu)
-			cpu_cache_init();
-		tlb_init();
+	/* Boot CPU's cache setup in setup_arch(). */
+	if (!is_boot_cpu)
+		cpu_cache_init();
+	tlb_init();
 	TLBMISS_HANDLER_SETUP();
 }
 
-- 
2.4.4
