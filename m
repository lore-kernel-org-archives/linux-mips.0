Return-Path: <SRS0=VPWm=6R=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F925C28CBC
	for <linux-mips@archiver.kernel.org>; Sun,  3 May 2020 10:35:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D17562075B
	for <linux-mips@archiver.kernel.org>; Sun,  3 May 2020 10:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="YcfU/Paa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgECKfr (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 3 May 2020 06:35:47 -0400
Received: from [115.28.160.31] ([115.28.160.31]:57426 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727125AbgECKfr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 06:35:47 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DB61C600B4;
        Sun,  3 May 2020 18:35:43 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588502144; bh=/Cdf57xJ/xIdBp8bMbuMoFQL6Kr5I+HS2hPKeglyOw8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YcfU/Paa+jz0AW8Lo2fNeQbPZaCEUg25eunZgFA5vfi0dn/SfrkkI3reMbeUa3a3N
         KZzAobhWAUZ/d6SbTQaMCnjqU9RRi64mX/5x5t3zJkgBba8TdxYrTNs13LvoeD3Bo2
         0KE8TYFNgrGtgEN0ucA3XkHKxGxPLaeImfHdbUGI=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 1/4] MIPS: Loongson64: fix typos in loongson_regs.h
Date:   Sun,  3 May 2020 18:33:02 +0800
Message-Id: <20200503103304.40678-2-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200502133846.40590-1-git@xen0n.name>
References: <20200502133846.40590-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix some symbol names to align with Loongson's User Manual wording. Also
correct the comment in csr_readq() suggesting the wrong instruction in
use.

Fixes: 6a6f9b7dafd50efc ("MIPS: Loongson: Add CFUCFG&CSR support")
Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-loongson64/loongson_regs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
index 363a47a5d26e..07aab3c5b22c 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
@@ -77,12 +77,12 @@ static inline u32 read_cpucfg(u32 reg)
 #define LOONGSON_CFG2_LBT3	BIT(6)
 #define LOONGSON_CFG2_LBTMMU	BIT(7)
 #define LOONGSON_CFG2_LPMP	BIT(8)
-#define LOONGSON_CFG2_LPMPREV	GENMASK(11, 9)
+#define LOONGSON_CFG2_LPMREV	GENMASK(11, 9)
 #define LOONGSON_CFG2_LAMO	BIT(12)
 #define LOONGSON_CFG2_LPIXU	BIT(13)
-#define LOONGSON_CFG2_LPIXUN	BIT(14)
-#define LOONGSON_CFG2_LZVP	BIT(15)
-#define LOONGSON_CFG2_LZVREV	GENMASK(18, 16)
+#define LOONGSON_CFG2_LPIXNU	BIT(14)
+#define LOONGSON_CFG2_LVZP	BIT(15)
+#define LOONGSON_CFG2_LVZREV	GENMASK(18, 16)
 #define LOONGSON_CFG2_LGFTP	BIT(19)
 #define LOONGSON_CFG2_LGFTPREV	GENMASK(22, 20)
 #define LOONGSON_CFG2_LLFTP	BIT(23)
@@ -139,7 +139,7 @@ static inline u64 csr_readq(u32 reg)
 {
 	u64 __res;
 
-	/* DWRCSR reg, val */
+	/* DRDCSR reg, val */
 	__asm__ __volatile__(
 		"parse_r __res,%0\n\t"
 		"parse_r reg,%1\n\t"
-- 
2.21.0

