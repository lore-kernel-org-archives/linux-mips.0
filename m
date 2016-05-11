Received: from mailapp01.imgtec.com ([195.59.15.196]:39561 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27029027AbcEKOu6DqWpz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 May 2016 16:50:58 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 6/6] MIPS: Print GuestCtl1 on machine check exception
Date: Wed, 11 May 2016 15:50:32 +0100
Message-ID: <1462978232-10670-7-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1462978232-10670-1-git-send-email-james.hogan@imgtec.com>
References: <1462978232-10670-1-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20160511145032.PDYZEqQNq5Pw6itUvj5prIZB59o0ncmpy-qU3Yd6W3U@z>

The GuestCtl1 CP0 register can contain the GuestID used for root TLB
operations, which affects TLB matching. The other TLB registers are
already dumped out to the log on a machine check exception due to
multiple matching TLB entries, so also dump the value of the GuestCtl1
register if GuestIDs are supported.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/lib/dump_tlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
index 2cb10dba8838..0f80b936e75e 100644
--- a/arch/mips/lib/dump_tlb.c
+++ b/arch/mips/lib/dump_tlb.c
@@ -19,6 +19,8 @@ void dump_tlb_regs(void)
 
 	pr_info("Index    : %0x\n", read_c0_index());
 	pr_info("PageMask : %0x\n", read_c0_pagemask());
+	if (cpu_has_guestid)
+		pr_info("GuestCtl1: %0x\n", read_c0_guestctl1());
 	pr_info("EntryHi  : %0*lx\n", field, read_c0_entryhi());
 	pr_info("EntryLo0 : %0*lx\n", field, read_c0_entrylo0());
 	pr_info("EntryLo1 : %0*lx\n", field, read_c0_entrylo1());
-- 
2.4.10
