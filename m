Received: from mailapp01.imgtec.com ([195.59.15.196]:34080 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993933AbdCMNdwT1OKT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Mar 2017 14:33:52 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 1/2] MIPS: mach-rm: Remove recursive include of cpu-feature-overrides.h
Date: Mon, 13 Mar 2017 14:33:37 +0100
Message-ID: <1489412018-30387-2-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1489412018-30387-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1489412018-30387-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170313133337.LUNmHO88RTzQsUooJmxOI6PypJtoOA6uscV4Mq-zvEI@z>

cpu-feautre-overrides.h in mach-rm unnecessarily includes itself, so
drop the pointless include

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/include/asm/mach-rm/cpu-feature-overrides.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-rm/cpu-feature-overrides.h b/arch/mips/include/asm/mach-rm/cpu-feature-overrides.h
index 98cf404..d38be66 100644
--- a/arch/mips/include/asm/mach-rm/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-rm/cpu-feature-overrides.h
@@ -10,8 +10,6 @@
 #ifndef __ASM_MACH_RM200_CPU_FEATURE_OVERRIDES_H
 #define __ASM_MACH_RM200_CPU_FEATURE_OVERRIDES_H
 
-#include <cpu-feature-overrides.h>
-
 #define cpu_has_tlb		1
 #define cpu_has_4kex		1
 #define cpu_has_4k_cache	1
-- 
2.7.4
