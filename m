Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E94C43381
	for <linux-mips@archiver.kernel.org>; Wed, 23 Dec 2020 02:57:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABFEC206F6
	for <linux-mips@archiver.kernel.org>; Wed, 23 Dec 2020 02:57:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgLWCUp (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 22 Dec 2020 21:20:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:49532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729070AbgLWCUo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Dec 2020 21:20:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C00822573;
        Wed, 23 Dec 2020 02:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608690004;
        bh=EsNvLFz5OMm3fi/Rz/8846BS5lwNO6VkQMdzcAwBS5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hpAJM4JT5lPTuYnu/gsebWwGLlHT7w7iR8p5KGBdsRm8y09az0TVrKr5thdqPPa2E
         DqK73g4OIiOSfYkOp96qE0QxFn2OfQsGQtNxN8jMnS7EszCcu0lEfaYGknalRZ/HCO
         sJxYe7BqYg3e1vVMaJZzokLG+3i76lMQ86ip0ZjyaK2nm9yXTpqSm82gmA77USk+9p
         oeIQPB9fvhxjXdTzfh/akHAENeEf1bfDPkI6svXc4L08xvQUnqQyWBA8JM2O/Gp+jI
         mmk6bzEiC2Q46Z7Z/m+WYJDizak9i8XZttPrlQ5KKesTJ7lysxB35Xgur3Skac9k6h
         B0xaFxsi3eZDA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 085/130] MIPS: KASLR: Avoid endless loop in sync_icache if synci_step is zero
Date:   Tue, 22 Dec 2020 21:17:28 -0500
Message-Id: <20201223021813.2791612-85-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jinyang He <hejinyang@loongson.cn>

[ Upstream commit c0aac3a51cb6364bed367ee3e1a96ed414f386b4 ]

Most platforms do not need to do synci instruction operations when
synci_step is 0. But for example, the synci implementation on Loongson64
platform has some changes. On the one hand, it ensures that the memory
access instructions have been completed. On the other hand, it guarantees
that all prefetch instructions need to be fetched again. And its address
information is useless. Thus, only one synci operation is required when
synci_step is 0 on Loongson64 platform. I guess that some other platforms
have similar implementations on synci, so add judgment conditions in
`while` to ensure that at least all platforms perform synci operations
once. For those platforms that do not need synci, they just do one more
operation similar to nop.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/relocate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 3d80a51256de6..cf92196ab6145 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -64,7 +64,7 @@ static void __init sync_icache(void *kbase, unsigned long kernel_length)
 			: "r" (kbase));
 
 		kbase += step;
-	} while (kbase < kend);
+	} while (step && kbase < kend);
 
 	/* Completion barrier */
 	__sync();
-- 
2.27.0

