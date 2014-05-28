Received: from dns-bn1lp0143.outbound.protection.outlook.com ([207.46.163.143]:30848
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854787AbaE1WL5yxtO7 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:11:57 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 12/13] MIPS: Enable build for new system 'paravirt'
Date: Wed, 28 May 2014 23:52:15 +0200
Message-ID: <1401313936-11867-13-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20140528215215.ZUyicJqzJAbfLTI4aTHJFWdhvlPLSZbf0tqrc2x4wgk@z>

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
index 1f836d8..df16e1e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -803,6 +803,25 @@ config NLM_XLP_BOARD
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
