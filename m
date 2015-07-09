Received: from mailapp01.imgtec.com ([195.59.15.196]:51403 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009938AbbGIJlpKei2h (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:45 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id C0F304CAF9B76
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:37 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 11/19] MIPS: kernel: mips-cm: The CMGCRBase register is 64-bit on MIPS64
Date: Thu, 9 Jul 2015 10:40:45 +0100
Message-ID: <1436434853-30001-12-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150709094045.OSgO7SocEJ1zNAY38BjYt75GmNW6R3lc0RcREZqry1U@z>

The CMGCRBase register (CP0, 15, 3) register is 64-bit on MIPS64
so we change its type to unsigned long.

Cc: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/mips-cm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 7e460e09661a..37a9885ef0da 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -20,7 +20,7 @@ int mips_cm_is64;
 phys_addr_t __mips_cm_phys_base(void)
 {
 	u32 config3 = read_c0_config3();
-	u32 cmgcr;
+	unsigned long cmgcr;
 
 	/* Check the CMGCRBase register is implemented */
 	if (!(config3 & MIPS_CONF3_CMGCR))
-- 
2.4.5
