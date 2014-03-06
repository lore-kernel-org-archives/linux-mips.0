Received: from mailapp01.imgtec.com ([195.89.28.114]:38863 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6853544AbaCFSE5xRVcq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Mar 2014 19:04:57 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 5689116F94D1D
        for <linux-mips@linux-mips.org>; Thu,  6 Mar 2014 18:04:49 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: clear hazard barrier after changing MSAEn
Date: Thu, 6 Mar 2014 18:04:27 +0000
Message-ID: <1394129067-20457-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140306180427.9_WbPxb0okHvGpCxKKAX3VRaRAOdso6ctKKy4r99DQg@z>

Changing MSAEn on the MIPS P5600 core creates an execution hazard which
must be cleared before any subsequent MSA instructions are executed.
This is similar to the FPU with which MSA is linked. Since all cores
with MSA support are >MIPSR2 the {en,dis}able_fpu_hazard macros will
always expand to the ehb instruction required, so they are simply
re-used.

Reported-by: James Hogan <james.hogan@imgtec.com>
Reviewed-by: James Hogan <james.hogan@imgtec.com>
Tested-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
This patch would ideally be applied as a fixup to "mips: add MSA
register definitions & access".
---
 arch/mips/include/asm/msa.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/msa.h b/arch/mips/include/asm/msa.h
index d7fd8e1..a2aba6c 100644
--- a/arch/mips/include/asm/msa.h
+++ b/arch/mips/include/asm/msa.h
@@ -17,14 +17,18 @@ extern void _restore_msa(struct task_struct *);
 
 static inline void enable_msa(void)
 {
-	if (cpu_has_msa)
+	if (cpu_has_msa) {
 		set_c0_config5(MIPS_CONF5_MSAEN);
+		enable_fpu_hazard();
+	}
 }
 
 static inline void disable_msa(void)
 {
-	if (cpu_has_msa)
+	if (cpu_has_msa) {
 		clear_c0_config5(MIPS_CONF5_MSAEN);
+		disable_fpu_hazard();
+	}
 }
 
 static inline int is_msa_enabled(void)
-- 
1.8.5.3
