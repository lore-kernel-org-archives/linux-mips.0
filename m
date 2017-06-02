Received: from mailapp01.imgtec.com ([195.59.15.196]:45762 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993940AbdFBWjxheHO3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Jun 2017 00:39:53 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/6] MIPS: Use current_cpu_type() in m4kc_tlbp_war()
Date: Fri, 2 Jun 2017 15:38:04 -0700
Message-ID: <20170602223806.5078-5-paul.burton@imgtec.com>
In-Reply-To: <20170602223806.5078-1-paul.burton@imgtec.com>
References: <20170602223806.5078-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170602223804.9nn01eZXlMOWXqO3cvzmsUapjEp_TJPJH1agN10CDZg@z>

Use current_cpu_type() to check for 4Kc processors instead of checking
the PRID directly. This will allow for the 4Kc case to be optimised out
of kernels that can't run on 4KC processors, thanks to __get_cpu_type()
and its unreachable() call.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/mm/tlbex.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index e6499209b81c..5aadc69c8ce3 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -153,8 +153,7 @@ static int scratchpad_offset(int i)
  */
 static int m4kc_tlbp_war(void)
 {
-	return (current_cpu_data.processor_id & 0xffff00) ==
-	       (PRID_COMP_MIPS | PRID_IMP_4KC);
+	return current_cpu_type() == CPU_4KC;
 }
 
 /* Handle labels (which must be positive integers). */
-- 
2.13.0
