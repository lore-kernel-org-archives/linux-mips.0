Return-Path: <SRS0=Dyp6=65=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0D0C433E0
	for <linux-mips@archiver.kernel.org>; Fri, 15 May 2020 03:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A0FA206F4
	for <linux-mips@archiver.kernel.org>; Fri, 15 May 2020 03:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgEODY0 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 14 May 2020 23:24:26 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:43282 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728165AbgEODY0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 23:24:26 -0400
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH] MIPS: SGI-IP27: Use the _AC() macro in spaces.h
Openpgp: preference=signencrypt
Message-ID: <132be102-33ab-a70a-217b-7dbbecbca9be@gentoo.org>
Date:   Thu, 14 May 2020 23:24:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Joshua Kinard <kumba@gentoo.org>

The attached patch wraps several of the macros in IP27's spaces.h
header file with the _AC() macro.  This matches most of the other
spaces.h files in the MIPS tree.

Signed-off-by: Joshua Kinard <kumba@gentoo.org>
---
 arch/mips/include/asm/mach-ip27/spaces.h |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/spaces.h b/arch/mips/include/asm/mach-ip27/spaces.h
index 24d5e31bcfa6..66421e9a6aa6 100644
--- a/arch/mips/include/asm/mach-ip27/spaces.h
+++ b/arch/mips/include/asm/mach-ip27/spaces.h
@@ -10,17 +10,19 @@
 #ifndef _ASM_MACH_IP27_SPACES_H
 #define _ASM_MACH_IP27_SPACES_H
 
+#include <linux/const.h>
+
 /*
  * IP27 uses the R10000's uncached attribute feature.  Attribute 3 selects
  * uncached memory addressing. Hide the definitions on 32-bit compilation
  * of the compat-vdso code.
  */
 #ifdef CONFIG_64BIT
-#define HSPEC_BASE		0x9000000000000000
-#define IO_BASE			0x9200000000000000
-#define MSPEC_BASE		0x9400000000000000
-#define UNCAC_BASE		0x9600000000000000
-#define CAC_BASE		0xa800000000000000
+#define HSPEC_BASE		_AC(0x9000000000000000, UL)
+#define IO_BASE			_AC(0x9200000000000000, UL)
+#define MSPEC_BASE		_AC(0x9400000000000000, UL)
+#define UNCAC_BASE		_AC(0x9600000000000000, UL)
+#define CAC_BASE		_AC(0xa800000000000000, UL)
 #endif
 
 #define TO_MSPEC(x)		(MSPEC_BASE | ((x) & TO_PHYS_MASK))

