Received: from mail-bl2lp0205.outbound.protection.outlook.com ([207.46.163.205]:59443
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855093AbaETOtbn09EU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:49:31 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 09/15] MIPS: Add functions for hypervisor call
Date: Tue, 20 May 2014 16:47:10 +0200
Message-ID: <1400597236-11352-10-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1400597236-11352-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140520144710.aFzL9XoIYyLIfz4xqVpOy3sC2nPk_m_71ba5m0P0h6Y@z>

From: David Daney <david.daney@cavium.com>

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/mipsregs.h |   67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index f110d48..e12a518 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1916,6 +1916,73 @@ __BUILD_SET_C0(brcm_cmt_ctrl)
 __BUILD_SET_C0(brcm_config)
 __BUILD_SET_C0(brcm_mode)
 
+static inline unsigned long hypcall0(unsigned long num)
+{
+	register unsigned long n asm("v0");
+	register unsigned long r asm("v0");
+
+	n = num;
+	__asm__ __volatile__(
+		".word 0x42000028"	/* HYPCALL */
+		: "=r" (r) : "r" (n) : "memory"
+		);
+
+	return r;
+}
+static inline unsigned long hypcall1(unsigned long num, unsigned long arg0)
+{
+	register unsigned long n asm("v0");
+	register unsigned long r asm("v0");
+	register unsigned long a0 asm("a0");
+
+	n = num;
+	a0 = arg0;
+	__asm__ __volatile__(
+		".word 0x42000028"	/* HYPCALL */
+		: "=r" (r) : "r" (n), "r" (a0) : "memory"
+		);
+
+	return r;
+}
+static inline unsigned long hypcall2(unsigned long num, unsigned long arg0,
+				     unsigned long arg1)
+{
+	register unsigned long n asm("v0");
+	register unsigned long r asm("v0");
+	register unsigned long a0 asm("a0");
+	register unsigned long a1 asm("a1");
+
+	n = num;
+	a0 = arg0;
+	a1 = arg1;
+	__asm__ __volatile__(
+		".word 0x42000028"	/* HYPCALL */
+		: "=r" (r) : "r" (n), "r" (a0), "r" (a1) : "memory"
+		);
+
+	return r;
+}
+static inline unsigned long hypcall3(unsigned long num, unsigned long arg0,
+				     unsigned long arg1, unsigned long arg2)
+{
+	register unsigned long n asm("v0");
+	register unsigned long r asm("v0");
+	register unsigned long a0 asm("a0");
+	register unsigned long a1 asm("a1");
+	register unsigned long a2 asm("a2");
+
+	n = num;
+	a0 = arg0;
+	a1 = arg1;
+	a2 = arg2;
+	__asm__ __volatile__(
+		".word 0x42000028"	/* HYPCALL */
+		: "=r" (r) : "r" (n), "r" (a0), "r" (a1), "r" (a2) : "memory"
+		);
+
+	return r;
+}
+
 static inline unsigned int mips_cpunum(void)
 {
 	return read_c0_ebase() & 0x3ff; /* Low 10 bits of ebase. */
-- 
1.7.9.5
