Received: from mailapp01.imgtec.com ([195.59.15.196]:1965 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010539AbbGXPQfxyTJG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 24 Jul 2015 17:16:35 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 34FEAA19DD271
        for <linux-mips@linux-mips.org>; Fri, 24 Jul 2015 16:16:27 +0100 (IST)
From: Alex Smith <alex.smith@imgtec.com>
Subject: [PATCH 3/3] MIPS: Use Ingenic-specific write combine attribute on all Ingenic platforms
Date: Fri, 24 Jul 2015 16:16:12 +0100
Message-ID: <1437750972-3659-3-git-send-email-alex.smith@imgtec.com>
In-Reply-To: <1437750972-3659-1-git-send-email-alex.smith@imgtec.com>
References: <1437750972-3659-1-git-send-email-alex.smith@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Alex.Smith@imgtec.com>
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
Cc: Alex Smith <alex.smith@imgtec.com>
Message-ID: <20150724151612.4DAARydBagQ81EinzVtNAwjSjuTf4ezUX3Rj_8E9UxY@z>

The Ingenic-specific write combining cache attribute was defined based
on CONFIG_MACH_JZ4740 and therefore not used on JZ4780. Change this to
CONFIG_MACH_INGENIC so that it gets used on all Ingenic platforms.

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
---
 arch/mips/include/asm/pgtable-bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index c28a8499aec7..002eeb224733 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -249,7 +249,7 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 #define _CACHE_CACHABLE_NONCOHERENT (3<<_CACHE_SHIFT)  /* LOONGSON       */
 #define _CACHE_CACHABLE_COHERENT    (3<<_CACHE_SHIFT)  /* LOONGSON-3     */
 
-#elif defined(CONFIG_MACH_JZ4740)
+#elif defined(CONFIG_MACH_INGENIC)
 
 /* Ingenic uses the WA bit to achieve write-combine memory writes */
 #define _CACHE_UNCACHED_ACCELERATED (1<<_CACHE_SHIFT)
-- 
2.4.6
