Received: from mailapp01.imgtec.com ([195.59.15.196]:57660 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009131AbbIVSpQM506P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:45:16 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 6/6] MIPS: allow RIXI for 32-bit kernels on MIPS64
Date: Tue, 22 Sep 2015 11:42:53 -0700
Message-ID: <1442947373-13345-7-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442947373-13345-1-git-send-email-paul.burton@imgtec.com>
References: <1442947373-13345-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Joshua Kinard <kumba@gentoo.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922184253.MM6GR6Y7V1ZX-3imSLtjhnSJ8iPVj-yinjpPvksRUZY@z>

Commit a68d09a156b2 ("MIPS: Don't use RI/XI with 32-bit kernels on
64-bit CPUs") prevented use of RIXI on MIPS64 systems, stating that the
"TLB handlers cannot handle this case". What they actually couldn't
handle was cases where there were less fill bits in the Entry{Lo,Hi}
registers than bits used by software in PTEs. The handlers can now deal
with this case, so enable RIXI for MIPS32 kernels on MIPS64 systems.

Note that beyond the obvious benefits provided by having RIXI on such
systems, this is required for systems implementing MIPSr6 where RIXI
cannot be disabled.

This reverts commit a68d09a156b2 ("MIPS: Don't use RI/XI with 32-bit
kernels on 64-bit CPUs").

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

 arch/mips/include/asm/cpu-features.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 9801ac9..7cb7c10 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -128,11 +128,7 @@
 #endif
 
 #ifndef cpu_has_rixi
-# ifdef CONFIG_64BIT
-# define cpu_has_rixi		(cpu_data[0].options & MIPS_CPU_RIXI)
-# else /* CONFIG_32BIT */
-# define cpu_has_rixi		((cpu_data[0].options & MIPS_CPU_RIXI) && !cpu_has_64bits)
-# endif
+#define cpu_has_rixi		(cpu_data[0].options & MIPS_CPU_RIXI)
 #endif
 
 #ifndef cpu_has_mmips
-- 
2.5.3
