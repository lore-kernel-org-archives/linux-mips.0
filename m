Received: from mailapp01.imgtec.com ([195.89.28.114]:49609 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6820484AbaCXKWCdFKrW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Mar 2014 11:22:02 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 254E0792494A5
        for <linux-mips@linux-mips.org>; Mon, 24 Mar 2014 10:21:55 +0000 (GMT)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 11/12] MIPS: CM: use __raw_ memory access functions
Date: Mon, 24 Mar 2014 10:19:34 +0000
Message-ID: <1395656375-9300-12-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
References: <1395656375-9300-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140324101934.tvzdjn6IELciSVLDBjIF8l2W1HAbjaccJ6mpLiC-L48@z>

The CM registers use native endianness, so using plain readl & writel
will produce incorrect results on big endian systems.

Reported-by: Jeffrey Deans <jeffrey.deans@imgtec.com>
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
Feel free to apply as a fixup for "MIPS: Add generic CM probe & access
code".
---
 arch/mips/include/asm/mips-cm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 12cae5e..6a9d2dd 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -96,13 +96,13 @@ static inline u32 *addr_gcr_##name(void)			\
 								\
 static inline u32 read_gcr_##name(void)				\
 {								\
-	return readl(addr_gcr_##name());			\
+	return __raw_readl(addr_gcr_##name());			\
 }
 
 #define BUILD_CM__W(name, off)					\
 static inline void write_gcr_##name(u32 value)			\
 {								\
-	writel(value, addr_gcr_##name());			\
+	__raw_writel(value, addr_gcr_##name());			\
 }
 
 #define BUILD_CM_RW(name, off)					\
-- 
1.8.5.3
