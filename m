Received: from multi.imgtec.com ([194.200.65.239]:10819 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827348AbaAOKdAoDDc8 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 15 Jan 2014 11:33:00 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 04/15] MIPS: introduce _EXT assembler macro
Date: Wed, 15 Jan 2014 10:31:49 +0000
Message-ID: <1389781920-31151-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1389781920-31151-1-git-send-email-paul.burton@imgtec.com>
References: <1389781920-31151-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140115103149.T_PHTjWxe-BPztuNHb3p0MjmMSitPojrY94bPm2t9AE@z>

This patch adds a simple macro to wrap the ext instruction which was
introduced with MIPSR2, and fall back to a shift & and pair for
pre-MIPSR2 CPUs. This will be used in a subsequent patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/asmmacro.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 6c8342a..1d2c9c2 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -62,6 +62,17 @@
 	.endm
 #endif /* CONFIG_MIPS_MT_SMTC */
 
+#ifdef CONFIG_CPU_MIPSR2
+	.macro	_EXT	rd, rs, p, s
+	ext	\rd, \rs, \p, \s
+	.endm
+#else /* !CONFIG_CPU_MIPSR2 */
+	.macro	_EXT	rd, rs, p, s
+	srl	\rd, \rs, \p
+	andi	\rd, \rd, (1 << \s) - 1
+	.endm
+#endif /* !CONFIG_CPU_MIPSR2 */
+
 /*
  * Temporary until all gas have MT ASE support
  */
-- 
1.8.4.2
