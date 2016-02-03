Received: from mailapp01.imgtec.com ([195.59.15.196]:23913 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010012AbcBCDUDKjuY0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:20:03 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 15/15] MIPS: smp-cps: Stop printing EJTAG exceptions to UART
Date: Wed, 3 Feb 2016 03:15:35 +0000
Message-ID: <1454469335-14778-16-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
References: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20160203031535.ZtQCprcG2DjNWScMvCUUvBvB0ukK3hKDLecQBvaUYpA@z>

When CONFIG_MIPS_CPS_NS16550 is enabled, some register state is dumped
to the UART when an exception is taken via the BEV on secondary cores.
EJTAG exceptions are architecturally expected to be handled by the BEV
even when Status.BEV is 0. This effectively means that if userland
executes an sdbbp instruction on a secondary core then the kernel dumps
register state to the UART even though the exception is perfectly normal
& expected. Prevent this by simply not dumping information to the UART
for EJTAG exceptions.

Fixes: 609cf6f2291a ("MIPS: CPS: Early debug using an ns16550-compatible UART")
Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/cps-vec.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index c28138d..51b98dc 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -223,7 +223,6 @@ LEAF(excep_intex)
 
 .org 0x480
 LEAF(excep_ejtag)
-	DUMP_EXCEP("EJTAG")
 	PTR_LA	k0, ejtag_debug_handler
 	jr	k0
 	 nop
-- 
2.7.0
