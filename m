Received: from mail-pw0-f49.google.com ([209.85.160.49]:60287 "EHLO
        mail-pw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491000Ab0ITNUB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 20 Sep 2010 15:20:01 +0200
Received: by pwj3 with SMTP id 3so1642754pwj.36
        for <linux-mips@linux-mips.org>; Mon, 20 Sep 2010 06:19:54 -0700 (PDT)
Subject: [PATCH] MIPS: Fix syscall 64 bit number comments
From: Philby John <pjohn@mvista.com>
Reply-To: pjohn@mvista.com
Content-Type: text/plain
Date: Mon, 20 Sep 2010 18:50:04 +0530
Message-ID: <1284988804.4442.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org
Cc: David Daney <ddaney@caviumnetworks.com>
Message-ID: <20100920132004.5SPx5I3ghyY_HPKE6Obd9V2zp_s2sRz3Fh-i5FY8Ss0@z>

From 4e2dbfb145d898b8f3fa1798e0ec10ac3f34d6c6 Mon Sep 17 00:00:00 2001
From: Philby John <pjohn@mvista.com>
Date: Mon, 20 Sep 2010 18:44:48 +0530
Subject: [PATCH] MIPS: Fix syscall 64 bit number comments

Signed-off-by: Philby John <pjohn@mvista.com>
Cc: David Daney <ddaney@caviumnetworks.com>
---
 arch/mips/kernel/scall64-64.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/kernel/scall64-64.S b/arch/mips/kernel/scall64-64.S
index a8a6c59..b16db4b 100644
--- a/arch/mips/kernel/scall64-64.S
+++ b/arch/mips/kernel/scall64-64.S
@@ -416,7 +416,7 @@ sys_call_table:
 	PTR	sys_pipe2
 	PTR	sys_inotify_init1
 	PTR	sys_preadv
-	PTR	sys_pwritev			/* 5390 */
+	PTR	sys_pwritev			/* 5290 */
 	PTR	sys_rt_tgsigqueueinfo
 	PTR	sys_perf_event_open
 	PTR	sys_accept4
-- 
1.6.3.3.333.g4d53f
