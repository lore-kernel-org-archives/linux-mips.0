Received: from mailapp01.imgtec.com ([195.59.15.196]:45327 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012309AbbA3ML2aB8dq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2015 13:11:28 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9E34D485465A2
        for <linux-mips@linux-mips.org>; Fri, 30 Jan 2015 12:11:20 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 05/10] MIPS: clear MSACSR cause bits when handling MSA FP exception
Date: Fri, 30 Jan 2015 12:09:34 +0000
Message-ID: <1422619779-9940-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1422619779-9940-1-git-send-email-paul.burton@imgtec.com>
References: <1422619779-9940-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20150130120934.Efiu-DiamnCQJ80GW6jHgXoFI_AeXGhWjLmd839orec@z>

Much like for traditional scalar FP exceptions, the cause bits in the
MSACSR register need to be cleared following an MSA FP exception.
Without doing so the exception will simply be raised again whenever
the kernel restores MSACSR from a tasks saved context, leading to
undesirable spurious exceptions. Clear the cause bits from the
handle_msa_fpe function, mirroring the way handle_fpe clears the
cause bits in FCSR.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
Changes in v2:
  - Rebase atop v3.19-rc6.
---
 arch/mips/kernel/genex.S | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index a5e26dd..6c49541 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -368,6 +368,15 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	STI
 	.endm
 
+	.macro	__build_clear_msa_fpe
+	_cfcmsa	a1, MSA_CSR
+	li	a2, ~(0x3f << 12)
+	and	a1, a1, a2
+	_ctcmsa	MSA_CSR, a1
+	TRACE_IRQS_ON
+	STI
+	.endm
+
 	.macro	__build_clear_ade
 	MFC0	t0, CP0_BADVADDR
 	PTR_S	t0, PT_BVADDR(sp)
@@ -426,7 +435,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	BUILD_HANDLER cpu cpu sti silent		/* #11 */
 	BUILD_HANDLER ov ov sti silent			/* #12 */
 	BUILD_HANDLER tr tr sti silent			/* #13 */
-	BUILD_HANDLER msa_fpe msa_fpe sti silent	/* #14 */
+	BUILD_HANDLER msa_fpe msa_fpe msa_fpe silent	/* #14 */
 	BUILD_HANDLER fpe fpe fpe silent		/* #15 */
 	BUILD_HANDLER ftlb ftlb none silent		/* #16 */
 	BUILD_HANDLER msa msa sti silent		/* #21 */
-- 
2.2.2
