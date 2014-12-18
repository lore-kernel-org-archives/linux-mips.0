Received: from nivc-ms1.auriga.com ([80.240.102.146]:48877 "EHLO
        nivc-ms1.auriga.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009081AbaLRKVsulKkR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 11:21:48 +0100
From: Aleksey Makarov <aleksey.makarov@auriga.com>
Subject: [PATCH v2 06/12] MIPS: OCTEON: Implement the core-16057 workaround
Date: Thu, 18 Dec 2014 13:17:58 +0300
Message-ID: <1418897888-17669-7-git-send-email-aleksey.makarov@auriga.com>
In-Reply-To: <1418897888-17669-1-git-send-email-aleksey.makarov@auriga.com>
References: <1418897888-17669-1-git-send-email-aleksey.makarov@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <aleksey.makarov@auriga.com>
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
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Aleksey Makarov <aleksey.makarov@auriga.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20141218101758.GgfjiPEgFY6rTTpG5z7Hgp3l3FBcI9pDfw0Nf04IhqE@z>

From: David Daney <david.daney@cavium.com>

Disable ICache prefetch for certian Octeon II processors.

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Aleksey Makarov <aleksey.makarov@auriga.com>
---
 .../asm/mach-cavium-octeon/kernel-entry-init.h     | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
index 1668ee5..21732c3 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
@@ -63,6 +63,28 @@ skip:
 	li	v1, ~(7 << 7)
 	and	v0, v0, v1
 	ori	v0, v0, (6 << 7)
+
+	mfc0	v1, CP0_PRID_REG
+	and	t1, v1, 0xfff8
+	xor	t1, t1, 0x9000		# 63-P1
+	beqz	t1, 4f
+	and	t1, v1, 0xfff8
+	xor	t1, t1, 0x9008		# 63-P2
+	beqz	t1, 4f
+	and	t1, v1, 0xfff8
+	xor	t1, t1, 0x9100		# 68-P1
+	beqz	t1, 4f
+	and	t1, v1, 0xff00
+	xor	t1, t1, 0x9200		# 66-PX
+	bnez	t1, 5f			# Skip WAR for others.
+	and	t1, v1, 0x00ff
+	slti	t1, t1, 2		# 66-P1.2 and later good.
+	beqz	t1, 5f
+
+4:	# core-16057 work around
+	or	v0, v0, 0x2000		# Set IPREF bit.
+
+5:	# No core-16057 work around
 	# Write the cavium control register
 	dmtc0	v0, CP0_CVMCTL_REG
 	sync
-- 
2.1.3
