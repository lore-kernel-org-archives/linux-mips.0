Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890C5C433DB
	for <linux-mips@archiver.kernel.org>; Sat, 13 Feb 2021 14:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A6E664DBA
	for <linux-mips@archiver.kernel.org>; Sat, 13 Feb 2021 14:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhBMODY (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 13 Feb 2021 09:03:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:43440 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229672AbhBMODX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Feb 2021 09:03:23 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6100FAE19;
        Sat, 13 Feb 2021 14:02:40 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kernel: Drop kgdb_call_nmi_hook
Date:   Sat, 13 Feb 2021 15:02:31 +0100
Message-Id: <20210213140231.23985-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With the removal of set_fs() calls kgdb_call_nmi_hook() is now the same as
the default implementation, so we can remove it.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/kgdb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/kernel/kgdb.c b/arch/mips/kernel/kgdb.c
index de779e23faf2..09a2d7bb9eef 100644
--- a/arch/mips/kernel/kgdb.c
+++ b/arch/mips/kernel/kgdb.c
@@ -207,11 +207,6 @@ void arch_kgdb_breakpoint(void)
 		".set\treorder");
 }
 
-void kgdb_call_nmi_hook(void *ignored)
-{
-	kgdb_nmicallback(raw_smp_processor_id(), get_irq_regs());
-}
-
 static int compute_signal(int tt)
 {
 	struct hard_trap_info *ht;
-- 
2.29.2

