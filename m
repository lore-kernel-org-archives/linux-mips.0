Received: from mail-pa0-f54.google.com ([209.85.220.54]:36108 "EHLO
        mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27012124AbbERXV1Oknd4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 May 2015 01:21:27 +0200
From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] MIPS: netlogic: remove unnecessary MTD partition probe specification
Date: Mon, 18 May 2015 16:21:12 -0700
Message-ID: <1431991272-22200-1-git-send-email-computersforpeace@gmail.com>
Return-Path: <computersforpeace@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20150518232112.3OP_ySAN4Tt0TpZwYT7jizWlPRCR3b61qxr9qcjTVdg@z>

The cmdlinepart parser is already supported in the default probe.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 arch/mips/netlogic/xlr/platform-flash.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/netlogic/xlr/platform-flash.c b/arch/mips/netlogic/xlr/platform-flash.c
index 6d3c727e0ef8..f03131fec41d 100644
--- a/arch/mips/netlogic/xlr/platform-flash.c
+++ b/arch/mips/netlogic/xlr/platform-flash.c
@@ -78,8 +78,6 @@ static struct platform_device xlr_nor_dev = {
 	.resource	= xlr_nor_res,
 };
 
-const char *xlr_part_probes[] = { "cmdlinepart", NULL };
-
 /*
  * Use "gen_nand" driver for NAND flash
  *
@@ -111,7 +109,6 @@ struct platform_nand_data xlr_nand_data = {
 		.nr_partitions	= ARRAY_SIZE(xlr_nand_parts),
 		.chip_delay	= 50,
 		.partitions	= xlr_nand_parts,
-		.part_probe_types = xlr_part_probes,
 	},
 	.ctrl = {
 		.cmd_ctrl	= xlr_nand_ctrl,
-- 
1.9.1
