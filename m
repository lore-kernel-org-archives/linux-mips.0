Received: from mailapp01.imgtec.com ([195.59.15.196]:64349 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012940AbbLCKIeB5RvZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Dec 2015 11:08:34 +0100
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
        by Websense Email Security Gateway with ESMTPS id B8FF6EF7A1C8D
        for <linux-mips@linux-mips.org>; Thu,  3 Dec 2015 10:08:26 +0000 (GMT)
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 8/9] MIPS: Add CONFIG_RELOCATABLE Kconfig option
Date: Thu, 3 Dec 2015 10:08:16 +0000
Message-ID: <1449137297-30464-9-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
References: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
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
Cc: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20151203100816.3PcIVpQkzAUVGmXJaGBo1poruTk7laRTGftaCKfxZrU@z>

Add option to KConfig to enable the kernel to relocate itself at
runtime.

Relocation is supported on R2 of the MIPS architecture, 32bit and 64bit.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---
 arch/mips/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b8ed64dfaafc..5b0339c91a33 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2431,6 +2431,15 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
+config RELOCATABLE
+	bool "Relocatable kernel"
+	depends on CPU_MIPS32_R2 || CPU_MIPS64_R2
+	help
+	  This builds a kernel image that retains relocation information
+	  so it can be loaded someplace besides the default 1MB.
+	  The relocations make the kernel binary about 15% larger,
+	  but are discarded at runtime
+
 config RELOCATION_TABLE_SIZE
 	hex "Relocation table size"
 	depends on RELOCATABLE
-- 
2.1.4
