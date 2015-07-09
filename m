Received: from mailapp01.imgtec.com ([195.59.15.196]:14241 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009596AbbGIJlbUBIvh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:31 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id EC21EAC579A5E
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:23 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 01/19] MIPS: Add MIPS I6400 PRid and cputype identifiers
Date: Thu, 9 Jul 2015 10:40:35 +0100
Message-ID: <1436434853-30001-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150709094035.Ho9PwqDlDwq-Va8RLAC-gicBIHyBGYs4LfP7Io-0yG0@z>

Add a Processor ID and CPU type for the MIPS I6400 core.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index e46e40602af3..5fa7b8ba48a9 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -120,6 +120,7 @@
 #define PRID_IMP_PROAPTIV_MP	0xa300
 #define PRID_IMP_M5150		0xa700
 #define PRID_IMP_P5600		0xa800
+#define PRID_IMP_I6400		0xa900
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_SIBYTE
@@ -307,6 +308,7 @@ enum cpu_type_enum {
 	CPU_ALCHEMY, CPU_PR4450, CPU_BMIPS32, CPU_BMIPS3300, CPU_BMIPS4350,
 	CPU_BMIPS4380, CPU_BMIPS5000, CPU_JZRISC, CPU_LOONGSON1, CPU_M14KC,
 	CPU_M14KEC, CPU_INTERAPTIV, CPU_P5600, CPU_PROAPTIV, CPU_1074K, CPU_M5150,
+	CPU_I6400,
 
 	/*
 	 * MIPS64 class processors
-- 
2.4.5
