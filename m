Received: from mailapp01.imgtec.com ([195.59.15.196]:54765 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27027784AbcD2NxWgo3pi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 29 Apr 2016 15:53:22 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/6] MIPS: Avoid magic numbers probing kscratch_mask
Date: Fri, 29 Apr 2016 14:53:03 +0100
Message-ID: <1461937988-13787-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1461937988-13787-1-git-send-email-james.hogan@imgtec.com>
References: <1461937988-13787-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160429135303.zqbLJhaHw27PWHmEl9TOZQ8f0H67R0FHy7C_fC5nO1Q@z>

The decode_config4() function reads kscratch_mask from
CP0_Config4.KScrExist using a hard coded shift and mask. We already have
a definition for the mask in mipsregs.h, so add a definition for the
shift and make use of them.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 3 ++-
 arch/mips/kernel/cpu-probe.c     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index ac194bf5444b..f46646a093f0 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -613,7 +613,8 @@
 #define MIPS_CONF4_MMUEXTDEF_MMUSIZEEXT (_ULCAST_(1) << 14)
 #define MIPS_CONF4_MMUEXTDEF_FTLBSIZEEXT	(_ULCAST_(2) << 14)
 #define MIPS_CONF4_MMUEXTDEF_VTLBSIZEEXT	(_ULCAST_(3) << 14)
-#define MIPS_CONF4_KSCREXIST	(_ULCAST_(255) << 16)
+#define MIPS_CONF4_KSCREXIST_SHIFT	(16)
+#define MIPS_CONF4_KSCREXIST	(_ULCAST_(255) << MIPS_CONF4_KSCREXIST_SHIFT)
 #define MIPS_CONF4_VTLBSIZEEXT_SHIFT	(24)
 #define MIPS_CONF4_VTLBSIZEEXT	(_ULCAST_(15) << MIPS_CONF4_VTLBSIZEEXT_SHIFT)
 #define MIPS_CONF4_AE		(_ULCAST_(1) << 28)
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index a0b7ff3353bd..0ccec160e913 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -798,7 +798,8 @@ static inline unsigned int decode_config4(struct cpuinfo_mips *c)
 		}
 	}
 
-	c->kscratch_mask = (config4 >> 16) & 0xff;
+	c->kscratch_mask = (config4 & MIPS_CONF4_KSCREXIST)
+				>> MIPS_CONF4_KSCREXIST_SHIFT;
 
 	return config4 & MIPS_CONF_M;
 }
-- 
2.4.10
