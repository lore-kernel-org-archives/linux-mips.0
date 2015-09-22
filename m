Received: from mailapp01.imgtec.com ([195.59.15.196]:26600 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVTJiqZx8P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 21:09:38 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/2] MIPS: print MAAR configuration during boot
Date: Tue, 22 Sep 2015 12:08:47 -0700
Message-ID: <1442948929-15862-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442948929-15862-1-git-send-email-paul.burton@imgtec.com>
References: <1442948929-15862-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, David Hildenbrand <dahi@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Message-ID: <20150922190847.JyeK6j8MqoH_ggsfXrNdgszbMpQUc08J1SdPCkTHZS4@z>

Verifying that the MAAR configuration is as expected is useful when
debugging the performance of a system. Print out the memory regions
configured via MAAR along with their attributes.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mm/init.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 66d0f49..cbef5c2 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -373,6 +373,7 @@ unsigned __weak platform_maar_init(unsigned num_pairs)
 static void maar_init(void)
 {
 	unsigned num_maars, used, i;
+	phys_addr_t lower, upper, attr;
 
 	if (!cpu_has_maar)
 		return;
@@ -395,6 +396,34 @@ static void maar_init(void)
 		write_c0_maar(0);
 		back_to_back_c0_hazard();
 	}
+
+	pr_info("MAAR configuration:\n");
+	for (i = 0; i < num_maars; i += 2) {
+		write_c0_maari(i);
+		back_to_back_c0_hazard();
+		upper = read_c0_maar();
+
+		write_c0_maari(i + 1);
+		back_to_back_c0_hazard();
+		lower = read_c0_maar();
+
+		attr = lower & upper;
+		lower = (lower & MIPS_MAAR_ADDR) << 4;
+		upper = ((upper & MIPS_MAAR_ADDR) << 4) | 0xffff;
+
+		pr_info("  [%d]: ", i / 2);
+		if (!(attr & MIPS_MAAR_V)) {
+			pr_cont("disabled\n");
+			continue;
+		}
+
+		pr_cont("%pa-%pa", &lower, &upper);
+
+		if (attr & MIPS_MAAR_S)
+			pr_cont(" speculate");
+
+		pr_cont("\n");
+	}
 }
 
 void __init mem_init(void)
-- 
2.5.3
