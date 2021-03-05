Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750D7C433E0
	for <linux-mips@archiver.kernel.org>; Fri,  5 Mar 2021 04:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 472016500C
	for <linux-mips@archiver.kernel.org>; Fri,  5 Mar 2021 04:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCEEW5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 4 Mar 2021 23:22:57 -0500
Received: from smtp.h3c.com ([60.191.123.50]:4132 "EHLO h3cspam02-ex.h3c.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229463AbhCEEW5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 23:22:57 -0500
X-Greylist: delayed 4144 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Mar 2021 23:22:56 EST
Received: from h3cspam02-ex.h3c.com (localhost [127.0.0.2] (may be forged))
        by h3cspam02-ex.h3c.com with ESMTP id 1253Dpjk075701;
        Fri, 5 Mar 2021 11:13:51 +0800 (GMT-8)
        (envelope-from deng.hongjie@h3c.com)
Received: from DAG2EX05-BASE.srv.huawei-3com.com ([10.8.0.68])
        by h3cspam02-ex.h3c.com with ESMTP id 1253D5Q3072525;
        Fri, 5 Mar 2021 11:13:05 +0800 (GMT-8)
        (envelope-from deng.hongjie@h3c.com)
Received: from localhost.localdomain (10.114.40.30) by
 DAG2EX05-BASE.srv.huawei-3com.com (10.8.0.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Mar 2021 11:13:06 +0800
From:   HongJieDeng <deng.hongjie@h3c.com>
To:     <tsbogend@alpha.franken.de>
CC:     <paulburton@kernel.org>, <chenhc@lemote.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <liulichao@loongson.cn>, <denghongjie@h3c.com>,
        Hongjie Deng <deng.hongjie@h3c.com>
Subject: [PATCH] MIPS: Support large stack.
Date:   Fri, 5 Mar 2021 11:12:57 +0800
Message-ID: <20210305031257.14936-1-deng.hongjie@h3c.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.114.40.30]
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG2EX05-BASE.srv.huawei-3com.com (10.8.0.68)
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 1253D5Q3072525
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Hongjie Deng <deng.hongjie@h3c.com>

We need more stack space, xori/ori no longer apply when
 _THREAD_MASK exceeds 16 bits

Signed-off-by: Hongjie Deng <deng.hongjie@h3c.com>
---
 arch/mips/include/asm/stackframe.h | 8 ++++++++
 arch/mips/kernel/genex.S           | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index aa430a6..6ebc39f 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -278,8 +278,16 @@
 		sll	k0, 3		/* extract cu0 bit */
 		bltz	k0, 9f
 
+#if    _THREAD_MASK  < (1 << 16 - 1)
 		ori	$28, sp, _THREAD_MASK
 		xori	$28, _THREAD_MASK
+#else
+		li      $28,   _THREAD_MASK
+		or  $28,  sp,  $28
+		li  $24, _THREAD_MASK
+		xor   $28, $28, $24
+#endif
+
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
 		.set    mips64
 		pref    0, 0($28)       /* Prefetch the current pointer */
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index bcce32a..5ea4fe4 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -662,8 +662,14 @@ isrdhwr:
 #endif
 	MTC0	k0, CP0_EPC
 	/* I hope three instructions between MTC0 and ERET are enough... */
+#if    _THREAD_MASK  < (1 << 16 - 1)
 	ori	k1, _THREAD_MASK
 	xori	k1, _THREAD_MASK
+#else
+	li  $24 ,_THREAD_MASK
+	or   k1, k1, $24
+	xor   k1, k1, $24
+#endif
 	LONG_L	v1, TI_TP_VALUE(k1)
 	.set	push
 	.set	arch=r4000
-- 
1.8.3.1

