Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7643DAACE
	for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 03:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700473; cv=none; b=WyW+WMfG+ud2OKysOQuEHnJBm6cJJoVKTqCBux5In/5GyzagBscvr8rNyaOiZvb/VmM6Fym/6LgJM0aZg2LnEYXyA1/uybPHhF362pnz/mkHmmKjHrEsmkbNSnqm2bzeStSGhFxX1BKfyyNfhvfkqakR2CcM4pUMXgYo4OIYDkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700473; c=relaxed/simple;
	bh=+HddCpkGzaEhskuHGKat07n7DBKQwKJBHvQiq42RYUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sKWikkgVsmFrsJ/3876Goy763yEUopBlCn8KAwolY8kOReMDzeT6TTtyz9o7m8u7Xy9W34BMF6+PSC4kvlznwAVGyAG/ov5/plV8b11OwhxZKgC6fh6WkJdWyF4LUvOohxBBcSDUI3ZLuThlpuGVzDW1V5lh16a9/UlsSWY5FfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HO8rqLAS; arc=none smtp.client-ip=74.125.231.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HO8rqLAS"
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-6c7150a9098so116882eaf.0
        for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2026 20:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700467; x=1790305267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=njOTNoQxhdYDra+WY2QRBnoEXnWS/kdPZ6L+QpvvB8U=;
        b=HO8rqLASOvnFTG8jAJxtdHhQpgPfIKZjRb4Atu01YElgNli62R1HXiREgagX98brZ4
         UR4lcbAwPWRDGKdwNKX/Wpa1OuJhPMKa9q9eDXr7Ly8uZOky0AncF4/RnxGwkSTbvOHY
         9loY1i/QngpsezFbVaCBX1R0XuXIpLiyKZdwWqIqAvXOzD5Y3q9MgU+nw8ZS74mqq96U
         ynyJZVm3GNRAyO55h6a9Uo25Nt3fhJMn/7HNq6sWFZtBcLka55YJMKKeHKtpm3b1+J4i
         /5mybW1rt39wIVIglH/Wx1NdnIL2zihOjAOrp1sgwE/rIdg5XaN8U8Ix2FXc2fkIYA4i
         nE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700467; x=1790305267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njOTNoQxhdYDra+WY2QRBnoEXnWS/kdPZ6L+QpvvB8U=;
        b=GjmlaTFSBtd549PBMHdIUu5hJiVfvCc71fkeOzqaCyU+FlT/aCZBqOAO2rxNbCCdd6
         Vwsxjk/5Y77iGRuJ9J6mzSFRYhmxkbzNFQ7FO2og5i7Pdk+5lm6RPo1sy/mAAKjJLb9x
         p1lAzo9uzS5S2v1r9DKw8pYrIBqaMbQITQ/Vx+UFbJVheECYpBmwSSijIxTzacqskZf6
         I+kXjpST+UX6fRaCjmArcc9GGNTF29MzqSzELb5FrY06EuSU1JzFCkvtBxykTIK3QsVq
         L97bvPjUiGLeDX6yHuomUyQ1OfoeGncHPwZ441vzz2LUXjajmt2VyBoI5oKe5z3GSe5M
         Iz9A==
X-Gm-Message-State: AFuF++nudUuUgwqOVc0eNU546ktmFqjy/MqoKE2eqm3lHEXFaroxBv9C
	gByk1W6lPiRHfWvogbSU6fPRbmkSkmDsqdBMJKAlB9GlHcqGLYpUD9x8vowkvY8ItJA=
X-Gm-Gg: AYBFou1wWztEcBDGBC1GJqIr+FChzCu2hsefOq/ag09v08a5UHFxQTkqQqL+MFAsHFX
	7sK80+Ls1yZp4mq7sOOKdSzvSXaRkgzZwsiz+WcJTCwXLkpL1CbOEEhDkHjSZE3LY6/vW0fIuvf
	aHJhA7LXoG1zGlFtkad4W5Jc4rE4Rb61HkGCBp+6nAJ7lMjEodR6cFvTPcCYubnmn5jfMs0+9pJ
	zCLtx2laBeHRRbkPStueujby3JvrEQzk3Pp/UTJ32ND74B/kZ5x/Bgwi66ACrj1emKqnIZUFpmR
	xFuYKccscZapzE9xJvcI7HOmtauP2ORN8CnsmsJjhCmTUmtCc0MUMbA9PTNQVY81nf8wT/iWN3K
	IGrnayMJT/rSArFtpqVKAx1zqxbujG4CbHecVHkd+S99+2uKDy+QpB10Q07ZslQMI937OAhXqol
	Q3+jGoFhKEZtuWxCgpnE2DujRt59ncjGJ/WuT1phnVGVod/b94TrT1kRRTdo3J+yTdKh81ybm6m
	9vP17MUl5FRWYlF1YvZwRRTV5jj5ESJWixvGwP/gSM4HAdvT2QPJbAUigrYRqlgTmy7Yg/jlcWF
	S2t/vP5cpa59ffUeiTazU8OYPbW2tLHa8En11Hf7Ar8hS7M+4Y/z4xiIRezCdbybqGxyMyO6xkV
	8Yw==
X-Received: by 2002:a05:6820:3092:b0:6b7:83c5:fde3 with SMTP id 006d021491bc7-6ca9bd4512fmr1047706eaf.36.1789700467262;
        Thu, 17 Sep 2026 20:01:07 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cddb4cf8sm815225c88.1.2026.09.17.20.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:06 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] MIPS: remove unused <asm/mips-boards/sead3-addr.h> header
Date: Thu, 17 Sep 2026 20:00:35 -0700
Message-ID: <20260918030041.397914-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last use of arch/mips/include/asm/mips-boards/sead3-addr.h was
removed in commit 64601cb1343f ("leds: Remove SEAD-3 driver") but it
was left behind. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 .../mips/include/asm/mips-boards/sead3-addr.h | 83 -------------------
 1 file changed, 83 deletions(-)
 delete mode 100644 arch/mips/include/asm/mips-boards/sead3-addr.h

diff --git a/arch/mips/include/asm/mips-boards/sead3-addr.h b/arch/mips/include/asm/mips-boards/sead3-addr.h
deleted file mode 100644
index c0db57802f7c..000000000000
--- a/arch/mips/include/asm/mips-boards/sead3-addr.h
+++ /dev/null
@@ -1,83 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2015 Imagination Technologies, Inc.
- *   written by Ralf Baechle <ralf@linux-mips.org>
- */
-#ifndef __ASM_MIPS_BOARDS_SEAD3_ADDR_H
-#define __ASM_MIPS_BOARDS_SEAD3_ADDR_H
-
-/*
- * Target #0 Register Decode
- */
-#define SEAD3_SD_SPDCNF				0xbb000040
-#define SEAD3_SD_SPADDR				0xbb000048
-#define SEAD3_SD_DATA				0xbb000050
-
-/*
- * Target #1 Register Decode
- */
-#define SEAD3_CFG				0xbb100110
-#define SEAD3_GIC_BASE_ADDRESS			0xbb1c0000
-#define SEAD3_SHARED_SECTION			0xbb1c0000
-#define SEAD3_VPE_LOCAL_SECTION			0xbb1c8000
-#define SEAD3_VPE_OTHER_SECTION			0xbb1cc000
-#define SEAD3_USER_MODE_VISIBLE_SECTION		0xbb1d0000
-
-/*
- * Target #3 Register Decode
- */
-#define SEAD3_USB_HS_BASE			0xbb200000
-#define SEAD3_USB_HS_IDENTIFICATION_REGS	0xbb200000
-#define SEAD3_USB_HS_CAPABILITY_REGS		0xbb200100
-#define SEAD3_USB_HS_OPERATIONAL_REGS		0xbb200140
-#define SEAD3_RESERVED				0xbe800000
-
-/*
- * Target #3 Register Decode
- */
-#define SEAD3_SRAM				0xbe000000
-#define SEAD3_OPTIONAL_SRAM			0xbe400000
-#define SEAD3_FPGA				0xbf000000
-
-#define SEAD3_PI_PIC32_USB_STATUS		0xbf000060
-#define   SEAD3_PI_PIC32_USB_STATUS_IO_RDY	(1 << 0)
-#define   SEAD3_PI_PIC32_USB_STATUS_SPL_INT	(1 << 1)
-#define   SEAD3_PI_PIC32_USB_STATUS_GPIOA_INT	(1 << 2)
-#define   SEAD3_PI_PIC32_USB_STATUS_GPIOB_INT	(1 << 3)
-
-#define SEAD3_PI_SOFT_ENDIAN			0xbf000070
-
-#define SEAD3_CPLD_P_SWITCH			0xbf000200
-#define SEAD3_CPLD_F_SWITCH			0xbf000208
-#define SEAD3_CPLD_P_LED			0xbf000210
-#define SEAD3_CPLD_F_LED			0xbf000218
-#define SEAD3_NEWSC_LIVE			0xbf000220
-#define SEAD3_NEWSC_REG				0xbf000228
-#define SEAD3_NEWSC_CTRL			0xbf000230
-
-#define SEAD3_LCD_CONTROL			0xbf000400
-#define SEAD3_LCD_DATA				0xbf000408
-#define SEAD3_CPLD_LCD_STATUS			0xbf000410
-#define SEAD3_CPLD_LCD_DATA			0xbf000418
-
-#define SEAD3_CPLD_PI_DEVRST			0xbf000480
-#define SEAD3_CPLD_PI_DEVRST_IC32_RST		(1 << 0)
-#define SEAD3_RESERVED_0			0xbf000500
-
-#define SEAD3_PIC32_REGISTERS			0xbf000600
-#define SEAD3_RESERVED_1			0xbf000700
-#define SEAD3_UART_CH_0				0xbf000800
-#define SEAD3_UART_CH_1				0xbf000900
-#define SEAD3_RESERVED_2			0xbf000a00
-#define SEAD3_ETHERNET				0xbf010000
-#define SEAD3_RESERVED_3			0xbf020000
-#define SEAD3_USER_EXPANSION			0xbf400000
-#define SEAD3_RESERVED_4			0xbf800000
-#define SEAD3_BOOT_FLASH_EXTENSION		0xbfa00000
-#define SEAD3_BOOT_FLASH			0xbfc00000
-#define SEAD3_REVISION_REGISTER			0xbfc00010
-
-#endif /* __ASM_MIPS_BOARDS_SEAD3_ADDR_H  */
-- 
2.43.0

