Received: from mailapp01.imgtec.com ([195.59.15.196]:47215 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861343AbaGRJwBTmUUs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Jul 2014 11:52:01 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 1F68526265F3C
        for <linux-mips@linux-mips.org>; Fri, 18 Jul 2014 10:51:52 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 2/4] MIPS: pgtable-bits: Define the CCA bit for WC writes on Ingenic cores
Date: Fri, 18 Jul 2014 10:51:31 +0100
Message-ID: <1405677093-22591-3-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405677093-22591-1-git-send-email-markos.chandras@imgtec.com>
References: <1405677093-22591-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140718095131._X9-6T56OtE7JPVawrNJ1mXExt5U0dCEmqtXi3aeiXI@z>

Ingenic uses the CCA:1 bit to achieve write-combine memory writes.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
As found in the following git repository
https://github.com/IngenicSemiconductor/KERNEL-WARRIOR/blob/master/arch/mips/include/asm/pgtable.h#L342
---
 arch/mips/include/asm/pgtable-bits.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index 011b0dcf306e..e747bfa0be7e 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -240,6 +240,11 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 #define _CACHE_CACHABLE_NONCOHERENT (3<<_CACHE_SHIFT)  /* LOONGSON       */
 #define _CACHE_CACHABLE_COHERENT    (3<<_CACHE_SHIFT)  /* LOONGSON-3     */
 
+#elif defined(CONFIG_MACH_JZ4740)
+
+/* Ingenic uses the WA bit to achieve write-combine memory writes */
+#define _CACHE_UNCACHED_ACCELERATED (1<<_CACHE_SHIFT)
+
 #endif
 
 #ifndef _CACHE_CACHABLE_NO_WA
-- 
2.0.0
