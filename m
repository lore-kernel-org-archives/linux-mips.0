Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187083;
	b=G/Pu1BrAlxwzlHe78r/9CPufvBGu69RyIiurgHKf5tnHjJcs21nRPTLk+hbnTrF97aU6
	 NakBwNBuR+Z/zl8Bx0+3Lwymf4lR5wiqs5r+BFENNEqacpd4VeXd1jzINBCa2mCetwAyn
	 swOvIk3GGRWdZqOTGwFNgXoc7b8LTKRIWo7y1bHmCSSO2tXsZYLotHYrRRPNjPJJu+CJc
	 41g6FFu8ngzZqz/JsU95ctTWZgufH5D10nW9LRxZiBFaIfqYJnITC0ZjrYuEHcOu5saAC
	 f1xUEW6UHvj9r2cuQmR+82JyO8tFZclmOzJK3bO7sgXPSz0zPDIB4k6lK9plj/lRxig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187083;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=0UQFTxkw/HfIqjISqbAkKNzK2A8OXExXXoUPu8/3b00=;
	b=CdrCKHwLlzd8eq10EnUg6u+CAc4MXhF45y/zbpEf6hokdFYD4srg0s2NUSkMpVtIDzpr
	 idfSKT99tPBT56VoF74HtHlJKW9dhnx9VvfE8/qKaHg6K0epK82aFDkqKTEUYNgclKC6S
	 J6BFPp0ZZmFaZ8lVVAQyoCcohkI0rTvV5v0zvJYhsW5aBoi595hs6ev8peFdcveEgXbbe
	 mA7dP2edlAtXNLeYQuxDmbIyze2JZV4TeBPByDpUq1Vbkkh2Itbq+VefWqOW/j0vTHtft
	 srz+/lHbmrBbiq0K0BKaxlhyvhJWMqv7A2wRn5VEoYQpKoPAxlRzNSF/YU0l5xvgSlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=PhwYHtuA;
	arc=none smtp.remote-ip=62.149.156.116
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7691B606A334
	for <linux-mips@vger.kernel.org>; Mon,  9 Nov 2026 01:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7691B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=PhwYHtuA
Received: from [127.0.0.1] ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE1AxMsH06VShQE1BxPovR; Mon, 09 Nov 2026 02:17:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187074; bh=M8e1E3AFMBy9iSve8rW+kLzKE99lCoOKdT27fT8i/1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=PhwYHtuAnuosncd9JRZg5BscUzbHpzd87Y4jwh8dRUm/QUNUGT9zB7omY+2Um1YFJ
	 3nUYd3bjIZIGBXHQWJHXrN4z8IbqHxadFCer0s1QAaW0Y0brqsDYeIQ0mp39xLu5DC
	 5QxJUEYHDoSg4vk2+wPJHNq8nTVnmVeC4qFk6xeUgxXgxISwie8C1lGzxWQKDId2Rh
	 vFYybUv+ZbmltZ9HT/g4N/4xLMZiIp4mvFcWBQJdZY/fptEhLpnS/XWrIvs+p7FLsU
	 pIZeK3nzMRrbkZb4ZBjNeiiZ7JUJnjUErOL8x8MFI91LqSok37v2WaNyTsTgkPQR9t
	 SfjOHjFRMK4hA==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Mon, 09 Nov 2026 02:17:52 +0100
Subject: [PATCH wireless-next v4 02/10] bcma: pmu: init PLL and resources
 on BCM4352/BCM4360
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-bcma-ac-rev1-v4-2-de1262c18b54@mythread.it>
References: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
In-Reply-To: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Alessio Ferri <alessio.ferri@mythread.it>, 
 b43-dev@lists.infradead.org
X-Mailer: b4 0.15.2
X-CMAE-Envelope: MS4xfA0SHnp7/o1kd6yqNJOwxQ9vhGBL4ANMkZqJ/MlRU6NcbLTLJG6wQLJXR978HuYWEYipWWphXGxbozZm8p1w++CcEwuVs3pTkD1lBJ20cKs7x66LY7ZO
 lPPxLcppsYWEvc99HGnRnIC1KkYsC01OvWhZjoF/A16my8XfcvPZtQinQ6hyBPO/54IZ57QV5xdcM4Cs2fG7IUipQQ3UyGsuZ/zSXSby5FILX0qafbbGO0s2
 lJyGypyqM5VPyry4Ig6v819AhE5kzGniuKo+kLbJqeAtozKB6ffkUgvuCRTaLm7+Q7V+5QN4gE2pGL0AGwffg9h0/VoBw3JAKiZjd3Ipe0WVfCgxB1BOh69R
 MRv+wSUc4/Ab1VnwNi7LQ57g0F53Qbmbk2v4s0EvLv29tM00yMnMLi6zhSQy0jWpm9SrVS847vMEtoc9SHjv6a/bgJBL8cz4NnEs/D2REzNpbRwn1oyKCn3F
 ylYWEYsSklBQcXBVXSj93DAHrMOimmP33IBBzA==

Program the PMU as Broadcom's driver does (hndpmu.c):

- on chip rev 3 and later, set the BBPLL to a 960.0098 MHz fractional
  VCO from the 40 MHz crystal, unless the backplane runs on HT already;
- set the resource up/down times and, on rev 4 and later, a min
  resource mask of 0x103;
- with chipstatus RSRC_INIT_MODE0 clear, program PLL controls 6 and 14,
  and on rev 4 and later 7 and 15 with REFCLK enabled in chipcontrol 1;
  on rev 3 and later, set max_res_mask to 0x1ff.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/driver_chipcommon_pmu.c        | 81 +++++++++++++++++++++++++++++
 include/linux/bcma/bcma_driver_chipcommon.h | 14 +++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/bcma/driver_chipcommon_pmu.c b/drivers/bcma/driver_chipcommon_pmu.c
index 263ef6fa1..7a226fcd2 100644
--- a/drivers/bcma/driver_chipcommon_pmu.c
+++ b/drivers/bcma/driver_chipcommon_pmu.c
@@ -11,6 +11,7 @@
 
 #include "bcma_private.h"
 #include <linux/export.h>
+#include <linux/math64.h>
 #include <linux/bcma/bcma.h>
 
 u32 bcma_chipco_pll_read(struct bcma_drv_cc *cc, u32 offset)
@@ -145,6 +146,78 @@ static void bcma_pmu2_pll_init0(struct bcma_drv_cc *cc, u32 xtalfreq)
 	/* TODO: Do we need to update OTP? */
 }
 
+static void bcma_pmu_4360_pll_init(struct bcma_drv_cc *cc)
+{
+	struct bcma_bus *bus = cc->core->bus;
+	const u32 xtal_hz = 40000000, vco_hz = 960009800;
+	u32 ctl2;
+
+	if (bus->chipinfo.rev < 3)
+		return;
+	/* The backplane may be running from the BBPLL. */
+	if (bcma_cc_read32(cc, BCMA_CLKCTLST) & BCMA_CLKCTLST_HAVEHT)
+		return;
+	if (bcma_pmu_get_alp_clock(cc) != xtal_hz) {
+		bcma_warn(bus, "No 40 MHz crystal, BBPLL left as is\n");
+		return;
+	}
+
+	ctl2 = (vco_hz / xtal_hz) << BCMA_CC_PMU4360_NDIV_INT_SHIFT |
+	       BCMA_CC_PMU4360_NDIV_MODE_FRAC << BCMA_CC_PMU4360_NDIV_MODE_SHIFT |
+	       1 << BCMA_CC_PMU4360_P1DIV_SHIFT;
+	bcma_chipco_pll_write(cc, BCMA_CC_PMU_PLL_CTL2, ctl2);
+	bcma_chipco_pll_write(cc, BCMA_CC_PMU_PLL_CTL3,
+			      div_u64((u64)(vco_hz % xtal_hz) << 24, xtal_hz));
+	bcma_pmu_set32(cc, BCMA_CC_PMU_CTL, BCMA_CC_PMU_CTL_PLL_UPD);
+}
+
+/* Up/down times of resources 0-8 on chip rev 4 and later */
+static const u32 bcma_pmu_4360b1_res_updown[] = {
+	0x00000001, 0x00000001, 0x00000001, 0x00000001, 0x00860002,
+	0x00000000, 0x00020001, 0x00080001, 0x00000000,
+};
+
+static void bcma_pmu_4360_resources_init(struct bcma_drv_cc *cc,
+					 u32 *min_msk, u32 *max_msk)
+{
+	u8 rev = cc->core->bus->chipinfo.rev;
+	bool init_mode0 = cc->status & BCMA_CC_CHIPST_4360_RSRC_INIT_MODE0;
+	unsigned int i;
+
+	if (rev < 4) {
+		bcma_pmu_write32(cc, BCMA_CC_PMU_RES_TABSEL, 6);
+		bcma_pmu_write32(cc, BCMA_CC_PMU_RES_UPDNTM, 0x00200001);
+	} else {
+		for (i = 0; i < ARRAY_SIZE(bcma_pmu_4360b1_res_updown); i++) {
+			bcma_pmu_write32(cc, BCMA_CC_PMU_RES_TABSEL, i);
+			bcma_pmu_write32(cc, BCMA_CC_PMU_RES_UPDNTM,
+					 bcma_pmu_4360b1_res_updown[i]);
+		}
+		*min_msk = 0x103;
+		/* The max mask must cover the min mask before it is written. */
+		bcma_pmu_set32(cc, BCMA_CC_PMU_MAXRES_MSK, *min_msk);
+	}
+
+	if (init_mode0)
+		return;
+
+	if (rev < 4) {
+		bcma_chipco_pll_write(cc, BCMA_CC_PMU_PLL_CTL6, 0x09048562);
+		bcma_chipco_pll_write(cc, BCMA_CC_PMU_PLL_CTL14, 0x09048562);
+	} else {
+		bcma_chipco_chipctl_maskset(cc, 1, ~0,
+					    BCMA_CHIPCTL1_4360_REFCLK_EN);
+		bcma_chipco_pll_write(cc, BCMA_CC_PMU_PLL_CTL6, 0x080004e2);
+		bcma_chipco_pll_write(cc, BCMA_CC_PMU_PLL_CTL7, 0xe);
+		bcma_chipco_pll_write(cc, BCMA_CC_PMU_PLL_CTL14, 0x080004e2);
+		bcma_chipco_pll_write(cc, BCMA_CC_PMU_PLL_CTL15, 0xe);
+	}
+	bcma_pmu_set32(cc, BCMA_CC_PMU_CTL, BCMA_CC_PMU_CTL_PLL_UPD);
+
+	if (rev >= 3)
+		*max_msk = 0x1ff;
+}
+
 static void bcma_pmu_pll_init(struct bcma_drv_cc *cc)
 {
 	struct bcma_bus *bus = cc->core->bus;
@@ -156,6 +229,10 @@ static void bcma_pmu_pll_init(struct bcma_drv_cc *cc)
 			xtalfreq = 20000;
 		bcma_pmu2_pll_init0(cc, xtalfreq);
 		break;
+	case BCMA_CHIP_ID_BCM4352:
+	case BCMA_CHIP_ID_BCM4360:
+		bcma_pmu_4360_pll_init(cc);
+		break;
 	}
 }
 
@@ -188,6 +265,10 @@ static void bcma_pmu_resources_init(struct bcma_drv_cc *cc)
 			  BCMA_RES_4314_WL_CORE_READY;
 		max_msk = 0x3FFFFFFF;
 		break;
+	case BCMA_CHIP_ID_BCM4352:
+	case BCMA_CHIP_ID_BCM4360:
+		bcma_pmu_4360_resources_init(cc, &min_msk, &max_msk);
+		break;
 	default:
 		bcma_debug(bus, "PMU resource config unknown or not needed for device 0x%04X\n",
 			   bus->chipinfo.id);
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index 0cb6638b5..525155658 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -107,6 +107,7 @@
 #define  BCMA_CC_CHIPST_4706_PCIE1_DISABLE	BIT(5) /* PCIE1 enable strap pin */
 #define  BCMA_CC_CHIPST_5357_NAND_BOOT		BIT(4) /* NAND boot, valid for CC rev 38 and/or BCM5357 */
 #define  BCMA_CC_CHIPST_4360_XTAL_40MZ		0x00000001
+#define  BCMA_CC_CHIPST_4360_RSRC_INIT_MODE0	0x00000020
 #define BCMA_CC_JCMD			0x0030		/* Rev >= 10 only */
 #define  BCMA_CC_JCMD_START		0x80000000
 #define  BCMA_CC_JCMD_BUSY		0x80000000
@@ -500,6 +501,16 @@
 #define BCMA_CC_PMU_PLL_CTL3		3
 #define BCMA_CC_PMU_PLL_CTL4		4
 #define BCMA_CC_PMU_PLL_CTL5		5
+#define BCMA_CC_PMU_PLL_CTL6		6
+#define BCMA_CC_PMU_PLL_CTL7		7
+#define BCMA_CC_PMU_PLL_CTL14		14
+#define BCMA_CC_PMU_PLL_CTL15		15
+
+/* BCM4360 PLL control 2 */
+#define BCMA_CC_PMU4360_P1DIV_SHIFT		0
+#define BCMA_CC_PMU4360_NDIV_MODE_SHIFT		4
+#define  BCMA_CC_PMU4360_NDIV_MODE_FRAC		3
+#define BCMA_CC_PMU4360_NDIV_INT_SHIFT		7
 
 #define BCMA_CC_PMU1_PLL0_PC0_P1DIV_MASK	0x00f00000
 #define BCMA_CC_PMU1_PLL0_PC0_P1DIV_SHIFT	20
@@ -527,6 +538,9 @@
 #define BCMA_CHIPCTL_4331_BT_SHD0_ON_GPIO4	BIT(16)	/* enable bt_shd0 at gpio4 */
 #define BCMA_CHIPCTL_4331_BT_SHD1_ON_GPIO5	BIT(17)	/* enable bt_shd1 at gpio5 */
 
+/* BCM4360 ChipControl 1 */
+#define BCMA_CHIPCTL1_4360_REFCLK_EN		BIT(11)
+
 /* 43224 chip-specific ChipControl register bits */
 #define BCMA_CCTRL_43224_GPIO_TOGGLE		0x8000		/* gpio[3:0] pins as btcoex or s/w gpio */
 #define BCMA_CCTRL_43224A0_12MA_LED_DRIVE	0x00F000F0	/* 12 mA drive strength */

-- 
2.34.1

