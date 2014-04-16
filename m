Received: from mailapp01.imgtec.com ([195.89.28.115]:54995 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837159AbaDPMztE6fx6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 14:55:49 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 824E2689F6F03
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 13:55:40 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 09/39] MIPS: mark R4K clockevent device with CLOCK_EVT_FEAT_PERCPU
Date: Wed, 16 Apr 2014 13:53:00 +0100
Message-ID: <1397652810-4336-10-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140416125300.sz8z7hI09fkXLiL13mP0IDeqIZVehViq5hoCSmkN82A@z>

The CLOCK_EVT_FEAT_PERCPU flag indicates that a clockevent device is
only configurable by the CPU for which it is registered, and thus cannot
be used as the tick broadcast device. That property is true of the R4K
timer, which is inaccessible from other cores.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/cevt-r4k.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 7820d5d..f3c549c 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -196,7 +196,8 @@ int r4k_clockevent_init(void)
 
 	cd->name		= "MIPS";
 	cd->features		= CLOCK_EVT_FEAT_ONESHOT |
-				  CLOCK_EVT_FEAT_C3STOP;
+				  CLOCK_EVT_FEAT_C3STOP |
+				  CLOCK_EVT_FEAT_PERCPU;
 
 	clockevent_set_clock(cd, mips_hpt_frequency);
 
-- 
1.8.5.3
