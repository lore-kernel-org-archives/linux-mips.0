Return-Path: <SRS0=7qnU=3X=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA28CC33C9E
	for <linux-mips@archiver.kernel.org>; Mon,  3 Feb 2020 03:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBD4120661
	for <linux-mips@archiver.kernel.org>; Mon,  3 Feb 2020 03:46:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="azZJcnvw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgBCDqc (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 2 Feb 2020 22:46:32 -0500
Received: from [115.28.160.31] ([115.28.160.31]:36214 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727347AbgBCDqc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Feb 2020 22:46:32 -0500
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8E4886014B;
        Mon,  3 Feb 2020 11:46:29 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1580701589; bh=CNzU9EEK2oqmzPj5vVHJIha/6hi4mr07hmSczWyOnEY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=azZJcnvw9arMXJGZlvoTpPGBnREneiFl3xdcj47iZnBKdKS525rmhw6uCUbWLYg7e
         6htASAyRGvXLE3JnDJ7KuKhRpjLn5AUp8m9JSQe74GdDgi3oFuIKC71petVbUuvAco
         Cq1S8HFEacGoXzl2afoOpRjMbzJTybqFhrP5mldc=
From:   Wang Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     Huacai Chen <chenhc@lemote.com>, Wang Xuerui <git@xen0n.name>
Subject: [PATCH 2/2] Revert "MIPS: asm: local: add barriers for Loongson"
Date:   Mon,  3 Feb 2020 01:00:52 +0800
Message-Id: <20200202170052.14012-2-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200202170052.14012-1-git@xen0n.name>
References: <20200202170052.14012-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhc@lemote.com>

This reverts commit 3e86460ebe2340df6a33b35a55312cc369bdcbd0.

Local ops don't need SYNCs before LL because there is only one writer,
the erratum is not triggered.

The LLSCCHK violations are made not to fail the build in the previous
patch so just revert the additions.

[git@xen0n.name: Massaged commit message.]

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Wang Xuerui <git@xen0n.name>
---
 arch/mips/include/asm/local.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index fef0fda8f82f..02783e141c32 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -37,7 +37,6 @@ static __inline__ long local_add_return(long i, local_t * l)
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=r4000				\n"
-			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_add_return	\n"
 		"	addu	%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
@@ -53,7 +52,6 @@ static __inline__ long local_add_return(long i, local_t * l)
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
-			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_add_return	\n"
 		"	addu	%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
@@ -86,7 +84,6 @@ static __inline__ long local_sub_return(long i, local_t * l)
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=r4000				\n"
-			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_sub_return	\n"
 		"	subu	%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
@@ -102,7 +99,6 @@ static __inline__ long local_sub_return(long i, local_t * l)
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
-			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_sub_return	\n"
 		"	subu	%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
-- 
2.21.0

