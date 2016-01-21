Received: from smtpbgsg2.qq.com ([54.254.200.128]:35420 "EHLO smtpbgsg2.qq.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27009614AbcAUNIEZCsyu (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 21 Jan 2016 14:08:04 +0100
From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 6/6] MIPS: Fix some missing CONFIG_CPU_MIPSR6 #ifdefs
Date: Thu, 21 Jan 2016 21:09:52 +0800
Message-ID: <1453381793-8357-7-git-send-email-chenhc@lemote.com>
In-Reply-To: <1453381793-8357-1-git-send-email-chenhc@lemote.com>
References: <1453381793-8357-1-git-send-email-chenhc@lemote.com>
Return-Path: <chenhc@lemote.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Huacai Chen <chenhc@lemote.com>, stable@vger.kernel.org
Message-ID: <20160121130952.Diq4c0FzZ37ehJyzhQM10KPLMO549BnoYdT2CYdU7os@z>

Commit be0c37c985eddc4 (MIPS: Rearrange PTE bits into fixed positions.)
defines fixed PTE bits for MIPS R2. Then, commit d7b631419b3d230a4d383
(MIPS: pgtable-bits: Fix XPA damage to R6 definitions.) adds the MIPS
R6 definitions in the same way as MIPS R2. But some R6 #ifdefs in the
later commit are missing, so in this patch I fix that.

Cc: <stable@vger.kernel.org>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/pgtable.h | 4 ++--
 arch/mips/mm/tlbex.c            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 8957f15..18826aa 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -353,7 +353,7 @@ static inline pte_t pte_mkdirty(pte_t pte)
 static inline pte_t pte_mkyoung(pte_t pte)
 {
 	pte_val(pte) |= _PAGE_ACCESSED;
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	if (!(pte_val(pte) & _PAGE_NO_READ))
 		pte_val(pte) |= _PAGE_SILENT_READ;
 	else
@@ -560,7 +560,7 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 {
 	pmd_val(pmd) |= _PAGE_ACCESSED;
 
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	if (!(pmd_val(pmd) & _PAGE_NO_READ))
 		pmd_val(pmd) |= _PAGE_SILENT_READ;
 	else
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 32e0be2..29f73e0 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -242,7 +242,7 @@ static void output_pgtable_bits_defines(void)
 	pr_define("_PAGE_HUGE_SHIFT %d\n", _PAGE_HUGE_SHIFT);
 	pr_define("_PAGE_SPLITTING_SHIFT %d\n", _PAGE_SPLITTING_SHIFT);
 #endif
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
 	if (cpu_has_rixi) {
 #ifdef _PAGE_NO_EXEC_SHIFT
 		pr_define("_PAGE_NO_EXEC_SHIFT %d\n", _PAGE_NO_EXEC_SHIFT);
-- 
2.4.6
