Received: from smtpgw2.netlogicmicro.com ([12.203.210.54]:52726 "EHLO
        smtpgw2.netlogicmicro.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1904104Ab2BBOjY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Feb 2012 15:39:24 +0100
From: Jayachandran C <jayachandranc@netlogicmicro.com>
Subject: [PATCH 07/11] MIPS: Netlogic: Remove NETLOGIC_ prefix
Date: Thu, 2 Feb 2012 20:13:01 +0530
Message-ID: <1b5af3a93c9e4ff3721b233c7c897825ff783d4b.1328189941.git.jayachandranc@netlogicmicro.com>
In-Reply-To: <cover.1328189941.git.jayachandranc@netlogicmicro.com>
References: <cover.1328189941.git.jayachandranc@netlogicmicro.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Jayachandran C <jayachandranc@netlogicmicro.com>
Message-ID: <20120202144301.ANc03XvQAk8i0JAdFh1Sg5Nm7tw9fR9tuE26q_7aPos@z>

Remove NETLOGIC_ prefix from gpio register definitions, this will
bring it in-line with the other Netlogic headers.

Having NETLOGIC prefix here is misleading because these are XLR/XLS
specific register definitions.

Signed-off-by: Jayachandran C <jayachandranc@netlogicmicro.com>
---
 arch/mips/include/asm/netlogic/xlr/gpio.h |   59 +++++++++++++++--------------
 arch/mips/netlogic/xlr/setup.c            |    2 +-
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/arch/mips/include/asm/netlogic/xlr/gpio.h b/arch/mips/include/asm/netlogic/xlr/gpio.h
index 51f6ad4..8492e83 100644
--- a/arch/mips/include/asm/netlogic/xlr/gpio.h
+++ b/arch/mips/include/asm/netlogic/xlr/gpio.h
@@ -35,39 +35,40 @@
 #ifndef _ASM_NLM_GPIO_H
 #define _ASM_NLM_GPIO_H
 
-#define NETLOGIC_GPIO_INT_EN_REG		0
-#define NETLOGIC_GPIO_INPUT_INVERSION_REG	1
-#define NETLOGIC_GPIO_IO_DIR_REG		2
-#define NETLOGIC_GPIO_IO_DATA_WR_REG		3
-#define NETLOGIC_GPIO_IO_DATA_RD_REG		4
+#define GPIO_INT_EN_REG			0
+#define GPIO_INPUT_INVERSION_REG	1
+#define GPIO_IO_DIR_REG			2
+#define GPIO_IO_DATA_WR_REG		3
+#define GPIO_IO_DATA_RD_REG		4
 
-#define NETLOGIC_GPIO_SWRESET_REG		8
-#define NETLOGIC_GPIO_DRAM1_CNTRL_REG		9
-#define NETLOGIC_GPIO_DRAM1_RATIO_REG		10
-#define NETLOGIC_GPIO_DRAM1_RESET_REG		11
-#define NETLOGIC_GPIO_DRAM1_STATUS_REG		12
-#define NETLOGIC_GPIO_DRAM2_CNTRL_REG		13
-#define NETLOGIC_GPIO_DRAM2_RATIO_REG		14
-#define NETLOGIC_GPIO_DRAM2_RESET_REG		15
-#define NETLOGIC_GPIO_DRAM2_STATUS_REG		16
+#define GPIO_SWRESET_REG		8
+#define GPIO_DRAM1_CNTRL_REG		9
+#define GPIO_DRAM1_RATIO_REG		10
+#define GPIO_DRAM1_RESET_REG		11
+#define GPIO_DRAM1_STATUS_REG		12
+#define GPIO_DRAM2_CNTRL_REG		13
+#define GPIO_DRAM2_RATIO_REG		14
+#define GPIO_DRAM2_RESET_REG		15
+#define GPIO_DRAM2_STATUS_REG		16
 
-#define NETLOGIC_GPIO_PWRON_RESET_CFG_REG	21
-#define NETLOGIC_GPIO_BIST_ALL_GO_STATUS_REG	24
-#define NETLOGIC_GPIO_BIST_CPU_GO_STATUS_REG	25
-#define NETLOGIC_GPIO_BIST_DEV_GO_STATUS_REG	26
+#define GPIO_PWRON_RESET_CFG_REG	21
+#define GPIO_BIST_ALL_GO_STATUS_REG	24
+#define GPIO_BIST_CPU_GO_STATUS_REG	25
+#define GPIO_BIST_DEV_GO_STATUS_REG	26
 
-#define NETLOGIC_GPIO_FUSE_BANK_REG		35
-#define NETLOGIC_GPIO_CPU_RESET_REG		40
-#define NETLOGIC_GPIO_RNG_REG			43
+#define GPIO_FUSE_BANK_REG		35
+#define GPIO_CPU_RESET_REG		40
+#define GPIO_RNG_REG			43
 
-#define NETLOGIC_PWRON_RESET_PCMCIA_BOOT	17
-#define NETLOGIC_GPIO_LED_BITMAP	0x1700000
-#define NETLOGIC_GPIO_LED_0_SHIFT		20
-#define NETLOGIC_GPIO_LED_1_SHIFT		24
+#define PWRON_RESET_PCMCIA_BOOT		17
 
-#define NETLOGIC_GPIO_LED_OUTPUT_CODE_RESET	0x01
-#define NETLOGIC_GPIO_LED_OUTPUT_CODE_HARD_RESET 0x02
-#define NETLOGIC_GPIO_LED_OUTPUT_CODE_SOFT_RESET 0x03
-#define NETLOGIC_GPIO_LED_OUTPUT_CODE_MAIN	0x04
+#define GPIO_LED_BITMAP			0x1700000
+#define GPIO_LED_0_SHIFT		20
+#define GPIO_LED_1_SHIFT		24
+
+#define GPIO_LED_OUTPUT_CODE_RESET	0x01
+#define GPIO_LED_OUTPUT_CODE_HARD_RESET 0x02
+#define GPIO_LED_OUTPUT_CODE_SOFT_RESET 0x03
+#define GPIO_LED_OUTPUT_CODE_MAIN	0x04
 
 #endif
diff --git a/arch/mips/netlogic/xlr/setup.c b/arch/mips/netlogic/xlr/setup.c
index c9d066d..81b1d31 100644
--- a/arch/mips/netlogic/xlr/setup.c
+++ b/arch/mips/netlogic/xlr/setup.c
@@ -85,7 +85,7 @@ static void nlm_linux_exit(void)
 
 	gpiobase = nlm_mmio_base(NETLOGIC_IO_GPIO_OFFSET);
 	/* trigger a chip reset by writing 1 to GPIO_SWRESET_REG */
-	nlm_write_reg(gpiobase, NETLOGIC_GPIO_SWRESET_REG, 1);
+	nlm_write_reg(gpiobase, GPIO_SWRESET_REG, 1);
 	for ( ; ; )
 		cpu_wait();
 }
-- 
1.7.5.4
