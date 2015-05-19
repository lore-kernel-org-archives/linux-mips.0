Received: from mailapp01.imgtec.com ([195.59.15.196]:51671 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013547AbbESIvON89r4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 May 2015 10:51:14 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 08/10] MIPS: dump_tlb: Take EHINV bit into account
Date: Tue, 19 May 2015 09:50:36 +0100
Message-ID: <1432025438-26431-9-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1432025438-26431-1-git-send-email-james.hogan@imgtec.com>
References: <1432025438-26431-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: James Hogan <james.hogan@imgtec.com>
Message-ID: <20150519085036.RMQdnwGxw47IcRT-ektWqHGar-NqZKoThPaaLNGj__4@z>

The EHINV bit in EntryHi allows a TLB entry to be properly marked
invalid so that EntryHi doesn't have to be set to a unique value to
avoid machine check exceptions due to multiple matching entries.

Unfortunately dump_tlb() doesn't take this into account so it will print
all the uninteresting invalid TLB entries if the current ASID happens to
be 00. Therefore add a condition to skip entries which are marked
invalid with the EHINV bit.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/lib/dump_tlb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/lib/dump_tlb.c b/arch/mips/lib/dump_tlb.c
index 995c393e3342..3bcdd53c832f 100644
--- a/arch/mips/lib/dump_tlb.c
+++ b/arch/mips/lib/dump_tlb.c
@@ -67,6 +67,9 @@ static void dump_tlb(int first, int last)
 		entrylo0 = read_c0_entrylo0();
 		entrylo1 = read_c0_entrylo1();
 
+		/* EHINV bit marks entire entry as invalid */
+		if (cpu_has_tlbinv && entryhi & MIPS_ENTRYHI_EHINV)
+			continue;
 		/*
 		 * Prior to tlbinv, unused entries have a virtual address of
 		 * CKSEG0.
-- 
2.3.6
