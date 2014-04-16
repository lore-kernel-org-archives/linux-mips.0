Received: from mailapp01.imgtec.com ([195.89.28.114]:60601 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6834698AbaDPM5LuBlOZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 14:57:11 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 783D8FA341AE6
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 13:57:02 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 13/39] MIPS: CPC: provide functions to retrieve register addresses
Date: Wed, 16 Apr 2014 13:53:04 +0100
Message-ID: <1397652810-4336-14-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
References: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140416125304.CfwuROs5hH_lqKv80cejMimNkOWkt8dcB6E2pB5uN0U@z>

This patch introduces addr_ functions in addition to the existing read_
& write_ functions. The new functions simply return the address of the
appropriate CPC register rather than performing a memory access. This
will be used in a subsequent patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/asm/mips-cpc.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cpc.h b/arch/mips/include/asm/mips-cpc.h
index 988507e..c5bb609 100644
--- a/arch/mips/include/asm/mips-cpc.h
+++ b/arch/mips/include/asm/mips-cpc.h
@@ -72,7 +72,12 @@ static inline bool mips_cpc_present(void)
 #define MIPS_CPC_COCB_OFS	0x4000
 
 /* Macros to ease the creation of register access functions */
-#define BUILD_CPC_R_(name, off) \
+#define BUILD_CPC_R_(name, off)					\
+static inline u32 *addr_cpc_##name(void)			\
+{								\
+	return (u32 *)(mips_cpc_base + (off));			\
+}								\
+								\
 static inline u32 read_cpc_##name(void)				\
 {								\
 	return __raw_readl(mips_cpc_base + (off));		\
-- 
1.8.5.3
