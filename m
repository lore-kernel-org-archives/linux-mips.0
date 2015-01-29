Received: from mailapp01.imgtec.com ([195.59.15.196]:4919 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012105AbbA2LOgtyIgG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Jan 2015 12:14:36 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/9] MIPS: Add architectural FDC IRQ fields
Date: Thu, 29 Jan 2015 11:14:06 +0000
Message-ID: <1422530054-7976-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
References: <1422530054-7976-1-git-send-email-james.hogan@imgtec.com>
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
Cc: linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20150129111406.-FvT3LQtJWdSPtoalW3giU1rVH5FPB-LtIrCXj7aA60@z>

Add architectural field definitions relating to the Fast Debug Channel
(FDC) interrupt, namely the pending bit in Cause and the field in
IntCtl to specify which CPU IRQ line the FDC interrupt is routed to.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/mipsregs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 2969ceaecfd3..9de5a3221c01 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -428,6 +428,8 @@
  *
  * Refer to your MIPS R4xx0 manual, chapter 5 for explanation.
  */
+#define INTCTLB_IPFDC		23
+#define INTCTLF_IPFDC		(_ULCAST_(7) << INTCTLB_IPFDC)
 #define INTCTLB_IPPCI		26
 #define INTCTLF_IPPCI		(_ULCAST_(7) << INTCTLB_IPPCI)
 #define INTCTLB_IPTI		29
@@ -458,6 +460,8 @@
 #define	 CAUSEF_IP6		(_ULCAST_(1)   << 14)
 #define	 CAUSEB_IP7		15
 #define	 CAUSEF_IP7		(_ULCAST_(1)   << 15)
+#define	 CAUSEB_FDCI		21
+#define	 CAUSEF_FDCI		(_ULCAST_(1)   << 21)
 #define	 CAUSEB_IV		23
 #define	 CAUSEF_IV		(_ULCAST_(1)   << 23)
 #define	 CAUSEB_PCI		26
-- 
2.0.5
