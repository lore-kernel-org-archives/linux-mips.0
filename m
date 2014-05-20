Received: from mail-bl2lp0204.outbound.protection.outlook.com ([207.46.163.204]:30437
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6855105AbaETOt6eZxrE (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 May 2014 16:49:58 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 12/15] MIPS: Enable build for new system 'paravirt'.
Date: Tue, 20 May 2014 16:47:13 +0200
Message-ID: <1400597236-11352-13-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Message-ID: <20140520144713.WrA3MuyYKYBuuJrgAMbMXS0WnsP5KhwJANFCmnuncB8@z>

From: David Daney <david.daney@cavium.com>

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/Kbuild.platforms |    1 +
 arch/mips/Kconfig          |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 6e23912..f5e18bf 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -18,6 +18,7 @@ platforms += loongson1
 platforms += mti-malta
 platforms += mti-sead3
 platforms += netlogic
+platforms += paravirt
 platforms += pmcs-msp71xx
 platforms += pnx833x
 platforms += ralink
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3621b4d..f957637 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -794,6 +794,25 @@ config NLM_XLP_BOARD
 	  This board is based on Netlogic XLP Processor.
 	  Say Y here if you have a XLP based board.
 
+config MIPS_PARAVIRT
+	bool "Para-Virtualized guest system"
+	select CEVT_R4K
+	select CSRC_R4K
+	select DMA_COHERENT
+	select SYS_SUPPORTS_64BIT_KERNEL
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_BIG_ENDIAN
+	select SYS_SUPPORTS_SMP
+	select NR_CPUS_DEFAULT_4
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_HAS_CPU_MIPS64_R2
+	select SYS_HAS_CPU_CAVIUM_OCTEON
+	select HW_HAS_PCI
+	select SWAP_IO_SPACE
+	help
+	  This option supports guest running under ????
+
 endchoice
 
 source "arch/mips/alchemy/Kconfig"
-- 
1.7.9.5
