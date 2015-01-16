Received: from mailapp01.imgtec.com ([195.59.15.196]:37123 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010872AbbAPKx3UFi2J (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:53:29 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9BE0FF55DD51
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:53:21 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 43/70] MIPS: mm: scache: Add secondary cache support for MIPS R6 cores
Date: Fri, 16 Jan 2015 10:49:22 +0000
Message-ID: <1421405389-15512-44-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20150116104922.8jwqU2BQimrtC_BRk2mC-S5yS7zsZb0QzwSgCFF_RF8@z>

The secondary cache initialization and configuration code is processor
specific so we need to handle MIPS R6 cores as well.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/mm/c-r4k.c   | 3 ++-
 arch/mips/mm/sc-mips.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 7ecee761ae2d..3f8059602765 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1473,7 +1473,8 @@ static void setup_scache(void)
 
 	default:
 		if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M32R2 |
-				    MIPS_CPU_ISA_M64R1 | MIPS_CPU_ISA_M64R2)) {
+				    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R1 |
+				    MIPS_CPU_ISA_M64R2 | MIPS_CPU_ISA_M64R6)) {
 #ifdef CONFIG_MIPS_CPU_SCACHE
 			if (mips_sc_init ()) {
 				scache_size = c->scache.ways * c->scache.sets * c->scache.linesz;
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index fd9b5d45e91b..4ceafd13870c 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -105,7 +105,8 @@ static inline int __init mips_sc_probe(void)
 
 	/* Ignore anything but MIPSxx processors */
 	if (!(c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M32R2 |
-			      MIPS_CPU_ISA_M64R1 | MIPS_CPU_ISA_M64R2)))
+			      MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R1 |
+			      MIPS_CPU_ISA_M64R2 | MIPS_CPU_ISA_M64R6)))
 		return 0;
 
 	/* Does this MIPS32/MIPS64 CPU have a config2 register? */
-- 
2.2.1
