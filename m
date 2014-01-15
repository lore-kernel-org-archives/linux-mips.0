Received: from multi.imgtec.com ([194.200.65.239]:38397 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827443AbaAOOA45zZrc (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 15 Jan 2014 15:00:56 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 07/10] MIPS: uasm: add a label variant of beq
Date: Wed, 15 Jan 2014 13:55:34 +0000
Message-ID: <1389794137-11361-8-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1389794137-11361-1-git-send-email-paul.burton@imgtec.com>
References: <1389794137-11361-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140115135534.uBWy6EpvFT0Dqm2oWYYdsUIbQZdEaXzspu9Ukv3_Qd0@z>

This patch allows for use of the beq instruction with labels from uasm,
much as bne & others already do. It will be used by a subsequent patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/uasm.h | 2 ++
 arch/mips/mm/uasm.c          | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/mips/include/asm/uasm.h b/arch/mips/include/asm/uasm.h
index 86c3535..53bb110 100644
--- a/arch/mips/include/asm/uasm.h
+++ b/arch/mips/include/asm/uasm.h
@@ -269,6 +269,8 @@ void uasm_il_bbit0(u32 **p, struct uasm_reloc **r, unsigned int reg,
 		   unsigned int bit, int lid);
 void uasm_il_bbit1(u32 **p, struct uasm_reloc **r, unsigned int reg,
 		   unsigned int bit, int lid);
+void uasm_il_beq(u32 **p, struct uasm_reloc **r, unsigned int reg1,
+		 unsigned int reg2, int lid);
 void uasm_il_beqz(u32 **p, struct uasm_reloc **r, unsigned int reg, int lid);
 void uasm_il_beqzl(u32 **p, struct uasm_reloc **r, unsigned int reg, int lid);
 void uasm_il_bgezl(u32 **p, struct uasm_reloc **r, unsigned int reg, int lid);
diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
index 99cb34b..15fc233 100644
--- a/arch/mips/mm/uasm.c
+++ b/arch/mips/mm/uasm.c
@@ -474,6 +474,14 @@ void ISAFUNC(uasm_il_b)(u32 **p, struct uasm_reloc **r, int lid)
 }
 UASM_EXPORT_SYMBOL(ISAFUNC(uasm_il_b));
 
+void ISAFUNC(uasm_il_beq)(u32 **p, struct uasm_reloc **r, unsigned int reg1,
+			  unsigned int reg2, int lid)
+{
+	uasm_r_mips_pc16(r, *p, lid);
+	ISAFUNC(uasm_i_beq)(p, reg1, reg2, 0);
+}
+UASM_EXPORT_SYMBOL(ISAFUNC(uasm_il_beq));
+
 void ISAFUNC(uasm_il_beqz)(u32 **p, struct uasm_reloc **r, unsigned int reg,
 			   int lid)
 {
-- 
1.8.4.2
