Received: from mailapp01.imgtec.com ([195.59.15.196]:10707 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008780AbbIVSNPyiqDU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:13:15 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 02/10] MIPS: CPS: set Status.KX on entry for MIPS64 kernels
Date: Tue, 22 Sep 2015 11:12:10 -0700
Message-ID: <1442945538-26141-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442945538-26141-1-git-send-email-paul.burton@imgtec.com>
References: <1442945538-26141-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150922181210.A0V9Adpqh2d0tO2XOcP5YTVNIzZuodV_D6bVJBobjx0@z>

If the kernel may make use of 64 bit addresses outside of the
compatibility address space then we need to set KX such that those
accesses can succeed. Do so for MIPS64 kernels.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/cps-vec.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 9710db5..99bf6aa 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -25,6 +25,12 @@
 
 .set noreorder
 
+#ifdef CONFIG_64BIT
+# define STATUS_BITDEPS		ST0_KX
+#else
+# define STATUS_BITDEPS		0
+#endif
+
 	/*
 	 * Set dest to non-zero if the core supports the MT ASE, else zero. If
 	 * MT is not supported then branch to nomt.
@@ -70,7 +76,7 @@ not_nmi:
 	mtc0	t0, CP0_CAUSE
 
 	/* Setup Status */
-	li	t0, ST0_CU1 | ST0_CU0 | ST0_BEV
+	li	t0, ST0_CU1 | ST0_CU0 | ST0_BEV | STATUS_BITDEPS
 	mtc0	t0, CP0_STATUS
 
 	/*
-- 
2.5.3
