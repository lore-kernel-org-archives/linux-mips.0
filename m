Return-Path: <SRS0=vgrG=DN=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A438FC4363D
	for <linux-mips@archiver.kernel.org>; Tue,  6 Oct 2020 14:00:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A19020760
	for <linux-mips@archiver.kernel.org>; Tue,  6 Oct 2020 14:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgJFOAL (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:00:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:40072 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgJFOAL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Oct 2020 10:00:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8DB3DB25C;
        Tue,  6 Oct 2020 14:00:09 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: dec: fix section mismatch
Date:   Tue,  6 Oct 2020 16:00:03 +0200
Message-Id: <20201006140003.10046-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Drop inline for memory setup functions and mark them __init to
fix section mismatch of pmax_setup_memory_region.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/dec/prom/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/dec/prom/memory.c b/arch/mips/dec/prom/memory.c
index 5073d2ed78bb..df8e1af20eb7 100644
--- a/arch/mips/dec/prom/memory.c
+++ b/arch/mips/dec/prom/memory.c
@@ -28,7 +28,7 @@ volatile unsigned long mem_err;		/* So we know an error occurred */
 
 #define CHUNK_SIZE 0x400000
 
-static inline void pmax_setup_memory_region(void)
+static __init void pmax_setup_memory_region(void)
 {
 	volatile unsigned char *memory_page, dummy;
 	char old_handler[0x80];
@@ -58,7 +58,7 @@ static inline void pmax_setup_memory_region(void)
  * Use the REX prom calls to get hold of the memory bitmap, and thence
  * determine memory size.
  */
-static inline void rex_setup_memory_region(void)
+static __init void rex_setup_memory_region(void)
 {
 	int i, bitmap_size;
 	unsigned long mem_start = 0, mem_size = 0;
-- 
2.16.4

