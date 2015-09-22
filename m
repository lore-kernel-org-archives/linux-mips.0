Received: from mailapp01.imgtec.com ([195.59.15.196]:60895 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009088AbbIVR2OwolfU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 19:28:14 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/5] MIPS: allow read64 GCR accessors to work on MIPS32 kernels
Date: Tue, 22 Sep 2015 10:26:40 -0700
Message-ID: <1442942801-2883-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442942801-2883-1-git-send-email-paul.burton@imgtec.com>
References: <1442942801-2883-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922172640.MCt0zEvTrgrlkOeqgueNKqQX_TG3G0KzRAxA0r-YgC4@z>

If we run a MIPS32 kernel on a system using CM3 we may still need to
access 64 bit GCRs, as will be done in later patches. Allow this by
having the read64_gcr_* accessor functions perform 2 x 32 bit reads on
those systems.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mips-cm.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 2a70b76..b9df4b2 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -125,7 +125,17 @@ static inline u32 read32_gcr_##name(void)			\
 								\
 static inline u64 read64_gcr_##name(void)			\
 {								\
-	return __raw_readq(addr_gcr_##name());			\
+	void __iomem *addr = addr_gcr_##name();			\
+	u64 ret;						\
+								\
+	if (mips_cm_is64) {					\
+		ret = __raw_readq(addr);			\
+	} else {						\
+		ret = __raw_readl(addr);			\
+		ret |= (u64)__raw_readl(addr + 0x4) << 32;	\
+	}							\
+								\
+	return ret;						\
 }								\
 								\
 static inline unsigned long read_gcr_##name(void)		\
-- 
2.5.3
