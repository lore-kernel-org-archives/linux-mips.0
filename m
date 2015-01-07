Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:25502 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010216AbbAGLV0Z86r3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:26 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 06/17] MIPS: Netlogic: Fix frequency calculation register
Date: Wed, 7 Jan 2015 16:58:27 +0530
Message-ID: <1420630118-17198-7-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Ganesan Ramalingam <ganesanr@broadcom.com>, ralf@linux-mips.org, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150107112827.iVlUaAdFtNknQDsSNBb-QeS0GxOKoA0qo_RR9TmxvxI@z>

From: Ganesan Ramalingam <ganesanr@broadcom.com>

Change the PIC frequency calculation to use the register that has the
current configuration. The existing code used the register that is
written to change frequency, which can have an invalid value if the
firmware did not set it up correctly.

Signed-off-by: Ganesan Ramalingam <ganesanr@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/include/asm/netlogic/xlp-hal/sys.h | 3 +++
 arch/mips/netlogic/xlp/nlm_hal.c             | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/netlogic/xlp-hal/sys.h b/arch/mips/include/asm/netlogic/xlp-hal/sys.h
index bc7bddf..6bcf395 100644
--- a/arch/mips/include/asm/netlogic/xlp-hal/sys.h
+++ b/arch/mips/include/asm/netlogic/xlp-hal/sys.h
@@ -177,6 +177,9 @@
 #define SYS_9XX_CLK_DEV_DIV			0x18d
 #define SYS_9XX_CLK_DEV_CHG			0x18f
 
+#define SYS_9XX_CLK_DEV_SEL_REG			0x1a4
+#define SYS_9XX_CLK_DEV_DIV_REG			0x1a6
+
 /* Registers changed on 9XX */
 #define SYS_9XX_POWER_ON_RESET_CFG		0x00
 #define SYS_9XX_CHIP_RESET			0x01
diff --git a/arch/mips/netlogic/xlp/nlm_hal.c b/arch/mips/netlogic/xlp/nlm_hal.c
index de41fb5..b80d893 100644
--- a/arch/mips/netlogic/xlp/nlm_hal.c
+++ b/arch/mips/netlogic/xlp/nlm_hal.c
@@ -332,7 +332,7 @@ static unsigned int nlm_xlp2_get_pic_frequency(int node)
 	/* Find the clock source PLL device for PIC */
 	if (cpu_xlp9xx) {
 		reg_select = nlm_read_sys_reg(clockbase,
-				SYS_9XX_CLK_DEV_SEL) & 0x3;
+				SYS_9XX_CLK_DEV_SEL_REG) & 0x3;
 		switch (reg_select) {
 		case 0:
 			ctrl_val0 = nlm_read_sys_reg(clockbase,
@@ -361,7 +361,7 @@ static unsigned int nlm_xlp2_get_pic_frequency(int node)
 		}
 	} else {
 		reg_select = (nlm_read_sys_reg(sysbase,
-					SYS_CLK_DEV_SEL) >> 22) & 0x3;
+					SYS_CLK_DEV_SEL_REG) >> 22) & 0x3;
 		switch (reg_select) {
 		case 0:
 			ctrl_val0 = nlm_read_sys_reg(sysbase,
@@ -425,10 +425,10 @@ static unsigned int nlm_xlp2_get_pic_frequency(int node)
 	/* PIC post divider, which happens after PLL */
 	if (cpu_xlp9xx)
 		pic_div = nlm_read_sys_reg(clockbase,
-				SYS_9XX_CLK_DEV_DIV) & 0x3;
+				SYS_9XX_CLK_DEV_DIV_REG) & 0x3;
 	else
 		pic_div = (nlm_read_sys_reg(sysbase,
-					SYS_CLK_DEV_DIV) >> 22) & 0x3;
+					SYS_CLK_DEV_DIV_REG) >> 22) & 0x3;
 	do_div(pll_out_freq_num, 1 << pic_div);
 
 	return pll_out_freq_num;
-- 
1.9.1
