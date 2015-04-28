Received: from mailapp01.imgtec.com ([195.59.15.196]:51971 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011991AbbD1J5qSnuNY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 11:57:46 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/2] MIPS: Fix CDMM to use native endian MMIO reads
Date: Tue, 28 Apr 2015 10:57:29 +0100
Message-ID: <1430215050-4995-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1430215050-4995-1-git-send-email-james.hogan@imgtec.com>
References: <1430215050-4995-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20150428095729.4OSmWglGEMOhv-dsY1_Nc7TN02tfVKbWfzSQwSJ0BBs@z>

The MIPS Common Device Memory Map (CDMM) is internal to the core and has
native endianness. There is therefore no need to byte swap the accesses
on big endian targets, so convert the CDMM bus driver to use
__raw_readl() rather than readl().

Fixes: 8286ae03308c ("MIPS: Add CDMM bus support")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 drivers/bus/mips_cdmm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mips_cdmm.c b/drivers/bus/mips_cdmm.c
index 5bd792c68f9b..ab3bde16ecb4 100644
--- a/drivers/bus/mips_cdmm.c
+++ b/drivers/bus/mips_cdmm.c
@@ -453,7 +453,7 @@ void __iomem *mips_cdmm_early_probe(unsigned int dev_type)
 
 	/* Look for a specific device type */
 	for (; drb < bus->drbs; drb += size + 1) {
-		acsr = readl(cdmm + drb * CDMM_DRB_SIZE);
+		acsr = __raw_readl(cdmm + drb * CDMM_DRB_SIZE);
 		type = (acsr & CDMM_ACSR_DEVTYPE) >> CDMM_ACSR_DEVTYPE_SHIFT;
 		if (type == dev_type)
 			return cdmm + drb * CDMM_DRB_SIZE;
@@ -500,7 +500,7 @@ static void mips_cdmm_bus_discover(struct mips_cdmm_bus *bus)
 	bus->discovered = true;
 	pr_info("cdmm%u discovery (%u blocks)\n", cpu, bus->drbs);
 	for (; drb < bus->drbs; drb += size + 1) {
-		acsr = readl(cdmm + drb * CDMM_DRB_SIZE);
+		acsr = __raw_readl(cdmm + drb * CDMM_DRB_SIZE);
 		type = (acsr & CDMM_ACSR_DEVTYPE) >> CDMM_ACSR_DEVTYPE_SHIFT;
 		size = (acsr & CDMM_ACSR_DEVSIZE) >> CDMM_ACSR_DEVSIZE_SHIFT;
 		rev  = (acsr & CDMM_ACSR_DEVREV)  >> CDMM_ACSR_DEVREV_SHIFT;
-- 
2.0.5
