Received: from mail-bl2lp0204.outbound.protection.outlook.com ([207.46.163.204]:30437
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855107AbaETOuENuLQ1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:50:04 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 15/15] MIPS: paravirt: Provide _machine_halt function to exit VM on shutdown of guest
Date: Tue, 20 May 2014 16:47:16 +0200
Message-ID: <1400597236-11352-16-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org
Message-ID: <20140520144716.QZbEIqiwx3R5FMX0aev3T-DzptMJKFYz7edXvmBQ5d0@z>

Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/paravirt/setup.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/paravirt/setup.c b/arch/mips/paravirt/setup.c
index f80c3bc..6d2781c 100644
--- a/arch/mips/paravirt/setup.c
+++ b/arch/mips/paravirt/setup.c
@@ -8,6 +8,7 @@
 
 #include <linux/kernel.h>
 
+#include <asm/reboot.h>
 #include <asm/bootinfo.h>
 #include <asm/mipsregs.h>
 #include <asm/smp-ops.h>
@@ -27,6 +28,11 @@ void __init plat_time_init(void)
 	preset_lpj = mips_hpt_frequency / (2 * HZ);
 }
 
+static void pv_machine_halt(void)
+{
+	hypcall0(1 /* Exit VM */);
+}
+
 /*
  * Early entry point for arch setup
  */
@@ -47,6 +53,7 @@ void __init prom_init(void)
 		if (i < argc - 1)
 			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
 	}
+	_machine_halt = pv_machine_halt;
 	register_smp_ops(&paravirt_smp_ops);
 }
 
-- 
1.7.9.5
