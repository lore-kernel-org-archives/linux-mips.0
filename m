Received: from mailapp01.imgtec.com ([195.59.15.196]:40048 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860076AbaGKPr3X4xij (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Jul 2014 17:47:29 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3DA8A89E1DF2A
        for <linux-mips@linux-mips.org>; Fri, 11 Jul 2014 16:47:20 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 12/13] MIPS: don't build MSA support unless it can be used
Date: Fri, 11 Jul 2014 16:47:14 +0100
Message-ID: <1405093634-5329-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1405093479-5123-1-git-send-email-paul.burton@imgtec.com>
References: <1405093479-5123-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140711154714.0G9v1cwBYw5PRkCxCJjUVsQq8-Wm0U9I4Of0Pod7JV0@z>

MSA requires that Status.FR == 1, so for MIPS32 tasks MSA can only be
used if CONFIG_MIPS_O32_FP64_SUPPORT is enabled. If it is not & the
kernel is 32bit, there's no point including support for MSA.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4e238e6..857a49c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2112,6 +2112,7 @@ config CPU_MICROMIPS
 config CPU_HAS_MSA
 	bool "Support for the MIPS SIMD Architecture"
 	depends on CPU_SUPPORTS_MSA
+	depends on 64BIT || MIPS_O32_FP64_SUPPORT
 	default y
 	help
 	  MIPS SIMD Architecture (MSA) introduces 128 bit wide vector registers
-- 
2.0.1
