Received: from mailapp01.imgtec.com ([195.89.28.114]:21002 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-FAIL-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S6837161AbaEGLV1r3oxV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 May 2014 13:21:27 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id B657E82C5BCAB
        for <linux-mips@linux-mips.org>; Wed,  7 May 2014 12:21:18 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/5] MIPS: define some more PIIX4 registers & values
Date: Wed, 7 May 2014 12:20:56 +0100
Message-ID: <1399461660-17623-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1399461660-17623-1-git-send-email-paul.burton@imgtec.com>
References: <1399461660-17623-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140507112056.Crzo_I6S80JSmQCcV0mrHzUul7FzfLPoUHLB3m4cR7o@z>

This patch simply adds definitions for some I/O registers in the PIIX4
PM device, and the magic data for a special cycle which must occur on
the PCI bus in order for the PIIX4 to enter a suspend state.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/mips-boards/piix4.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/include/asm/mips-boards/piix4.h b/arch/mips/include/asm/mips-boards/piix4.h
index 9cf5404..9e340be 100644
--- a/arch/mips/include/asm/mips-boards/piix4.h
+++ b/arch/mips/include/asm/mips-boards/piix4.h
@@ -55,4 +55,16 @@
 #define PIIX4_FUNC3_PMREGMISC			0x80
 #define   PIIX4_FUNC3_PMREGMISC_EN			(1 << 0)
 
+/* Power Management IO Space */
+#define PIIX4_FUNC3IO_PMSTS			0x00
+#define   PIIX4_FUNC3IO_PMSTS_PWRBTN_STS		(1 << 8)
+#define PIIX4_FUNC3IO_PMCNTRL			0x04
+#define   PIIX4_FUNC3IO_PMCNTRL_SUS_EN			(1 << 13)
+#define   PIIX4_FUNC3IO_PMCNTRL_SUS_TYP			(0x7 << 10)
+#define   PIIX4_FUNC3IO_PMCNTRL_SUS_TYP_SOFF		(0x0 << 10)
+#define   PIIX4_FUNC3IO_PMCNTRL_SUS_TYP_STR		(0x1 << 10)
+
+/* Data for magic special PCI cycle */
+#define PIIX4_SUSPEND_MAGIC			0x00120002
+
 #endif /* __ASM_MIPS_BOARDS_PIIX4_H */
-- 
1.8.5.3
