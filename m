Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8671FEB64D7
	for <linux-mips@archiver.kernel.org>; Mon, 26 Jun 2023 07:51:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjFZHvR (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 26 Jun 2023 03:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjFZHvQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Jun 2023 03:51:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131E610DB;
        Mon, 26 Jun 2023 00:50:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A192660B5A;
        Mon, 26 Jun 2023 07:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06365C433C0;
        Mon, 26 Jun 2023 07:50:54 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] MIPS: Loongson: Fix build error when make modules_install
Date:   Mon, 26 Jun 2023 15:50:47 +0800
Message-Id: <20230626075047.1872818-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of
cc-ifversion") we get a build error when make modules_install:

cc1: error: '-mloongson-mmi' must be used with '-mhard-float'

The reason is when make modules_install, 'call cc-option' doesn't work
in $(KBUILD_CFLAGS) of 'CHECKFLAGS'. Then there is no -mno-loongson-mmi
applied and -march=loongson3a enable MMI instructions.

Fix this by partially reverting to the old logic, use 'call cc-option'
to conditionally apply -march=loongson3a and -march=mips64r2.

Fixes: 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of cc-ifversion")
Cc: stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/mips/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index a7a4ee66a9d3..7fb76d12829e 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -186,11 +186,8 @@ cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f -Wa,--trap
 # Some -march= flags enable MMI instructions, and GCC complains about that
 # support being enabled alongside -msoft-float. Thus explicitly disable MMI.
 cflags-$(CONFIG_CPU_LOONGSON2EF) += $(call cc-option,-mno-loongson-mmi)
-ifdef CONFIG_CPU_LOONGSON64
 cflags-$(CONFIG_CPU_LOONGSON64)	+= -Wa,--trap
-cflags-$(CONFIG_CC_IS_GCC) += -march=loongson3a
-cflags-$(CONFIG_CC_IS_CLANG) += -march=mips64r2
-endif
+cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-march=loongson3a,-march=mips64r2)
 cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-mno-loongson-mmi)
 
 cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)	+= $(call cc-option,-mfix-r4000,)
-- 
2.39.3

