Received: from mailapp01.imgtec.com ([195.59.15.196]:52618 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012172AbcBCMG6Ge4lM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 13:06:58 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH] MIPS: SEAD3 can support MIPS32r6 CPUs
Date: Wed, 3 Feb 2016 12:06:35 +0000
Message-ID: <1454501195-6693-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20160203120635.xyeEDuKcGdkaZ3_hOcPrLQr0mYbj7N31np1FftRYYXg@z>

There are CPUs/bitfiles available for use with SEAD3 boards which
implement release 6 of the MIPS architecture. Allow building the kernel
for such a system.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 57a945e..6154138 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -507,6 +507,7 @@ config MIPS_SEAD3
 	select MIPS_MSC
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_HAS_CPU_MIPS32_R6
 	select SYS_HAS_CPU_MIPS64_R1
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_32BIT_KERNEL
-- 
2.7.0
