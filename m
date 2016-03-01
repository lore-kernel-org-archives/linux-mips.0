Received: from mailapp01.imgtec.com ([195.59.15.196]:33802 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27024626AbcCAWT65XNH- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Mar 2016 23:19:58 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 2/4] MIPS: Enable ptrace hw watchpoints on MIPS R6
Date: Tue, 1 Mar 2016 22:19:37 +0000
Message-ID: <1456870779-21007-3-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1456870779-21007-1-git-send-email-james.hogan@imgtec.com>
References: <1456870779-21007-1-git-send-email-james.hogan@imgtec.com>
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
Message-ID: <20160301221937.C8r9PvTPAMXBzG4jN_6GxUr7RH1XhOi0t1likMZ2rms@z>

HARDWARE_WATCHPOINTS isn't being enabled for CPU_MIPSR6, even though it
has an identical hardware watchpoint interface to CPU_MIPSR2, which
prevents ptrace watchpoints from being loaded when executing a ptraced
process even though the watchpoints are described in /proc/cpuinfo.

Enable HARDWARE_WATCHPOINTS for CPU_MIPSR6 too.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 74a3db92da1b..e9053ab1a847 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2000,7 +2000,7 @@ config MIPS_PGD_C0_CONTEXT
 #
 config HARDWARE_WATCHPOINTS
        bool
-       default y if CPU_MIPSR1 || CPU_MIPSR2
+       default y if CPU_MIPSR1 || CPU_MIPSR2 || CPU_MIPSR6
 
 menu "Kernel type"
 
-- 
2.4.10
