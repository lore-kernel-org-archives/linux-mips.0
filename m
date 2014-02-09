Received: from mail.sigma-star.at ([95.130.255.111]:52757 "EHLO
        mail.sigma-star.at" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6826064AbaBISscTCTDp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 9 Feb 2014 19:48:32 +0100
From: Richard Weinberger <richard@nod.at>
Subject: [PATCH 11/28] Remove ARCH_SUPPORTS_MSI
Date: Sun,  9 Feb 2014 19:47:49 +0100
Message-ID: <1391971686-9517-12-git-send-email-richard@nod.at>
In-Reply-To: <1391971686-9517-1-git-send-email-richard@nod.at>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
Return-Path: <richard@nod.at>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, "open list:MIPS" <linux-mips@linux-mips.org>, open list <linux-kernel@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Message-ID: <20140209184749.FJTvOB85o4l3YJAoYTwHG13RJ1XO0-jX-xVdVYvPI6g@z>

The symbol is an orphan, get rid of it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 792bd22..5b08fe9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -782,7 +782,6 @@ config NLM_XLP_BOARD
 	select CEVT_R4K
 	select CSRC_R4K
 	select IRQ_CPU
-	select ARCH_SUPPORTS_MSI
 	select ZONE_DMA32 if 64BIT
 	select SYNC_R4K
 	select SYS_HAS_EARLY_PRINTK
-- 
1.8.4.2
