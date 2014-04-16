Received: from mailapp01.imgtec.com ([195.89.28.114]:34024 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837154AbaDPNAgREUl- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 15:00:36 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id CB6D23D3763A2
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 14:00:26 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 21/39] MIPS: uasm: add a label variant of beq
Date: Wed, 16 Apr 2014 13:53:12 +0100
Message-ID: <1397652810-4336-22-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
References: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140416125312.Aov1P8syF50kXttMis0QMlRhEWX4yzofrr5Y-GrjOU4@z>

This patch allows for use of the beq instruction with labels from uasm,
much as bne & others already do. It will be used by a subsequent patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/uasm.h | 2 ++
 arch/mips/mm/uasm.c          | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/mips/include/asm/uasm.h b/arch/mips/include/asm/uasm.h
index c33a956..d1275a2 100644
--- a/arch/mips/include/asm/uasm.h
+++ b/arch/mips/include/asm/uasm.h
@@ -264,6 +264,8 @@ void uasm_il_bbit0(u32 **p, struct uasm_reloc **r, unsigned int reg,
 		   unsigned int bit, int lid);
 void uasm_il_bbit1(u32 **p, struct uasm_reloc **r, unsigned int reg,
 		   unsigned int bit, int lid);
+void uasm_il_beq(u32 **p, struct uasm_reloc **r, unsigned int r1,
+		 unsigned int r2, int lid);
 void uasm_il_beqz(u32 **p, struct uasm_reloc **r, unsigned int reg, int lid);
 void uasm_il_beqzl(u32 **p, struct uasm_reloc **r, unsigned int reg, int lid);
 void uasm_il_bgezl(u32 **p, struct uasm_reloc **r, unsigned int reg, int lid);
diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
index b9d14b6..ae18b82 100644
--- a/arch/mips/mm/uasm.c
+++ b/arch/mips/mm/uasm.c
@@ -469,6 +469,14 @@ void ISAFUNC(uasm_il_b)(u32 **p, struct uasm_reloc **r, int lid)
 }
 UASM_EXPORT_SYMBOL(ISAFUNC(uasm_il_b));
 
+void ISAFUNC(uasm_il_beq)(u32 **p, struct uasm_reloc **r, unsigned int r1,
+			  unsigned int r2, int lid)
+{
+	uasm_r_mips_pc16(r, *p, lid);
+	ISAFUNC(uasm_i_beq)(p, r1, r2, 0);
+}
+UASM_EXPORT_SYMBOL(ISAFUNC(uasm_il_beq));
+
 void ISAFUNC(uasm_il_beqz)(u32 **p, struct uasm_reloc **r, unsigned int reg,
 			   int lid)
 {
-- 
1.8.5.3
