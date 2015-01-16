Received: from mailapp01.imgtec.com ([195.59.15.196]:29487 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011682AbbAPKyQL2xd5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 11:54:16 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 92D0E94BD1262
        for <linux-mips@linux-mips.org>; Fri, 16 Jan 2015 10:54:08 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC v2 69/70] MIPS: Malta: Add support for building MIPS R6 kernel
Date: Fri, 16 Jan 2015 10:49:48 +0000
Message-ID: <1421405389-15512-70-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150116104948.EMB9HUPJWhMd3wGgKDaF1JcMVmq8FI0hR03BWCoNaLU@z>

The Malta platform supports MIPS R6 (via QEMU or real bitstreams)
so add support for it.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index bfc817770e74..be42028e11a6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -376,8 +376,10 @@ config MIPS_MALTA
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_HAS_CPU_MIPS32_R3_5
+	select SYS_HAS_CPU_MIPS32_R6
 	select SYS_HAS_CPU_MIPS64_R1
 	select SYS_HAS_CPU_MIPS64_R2
+	select SYS_HAS_CPU_MIPS64_R6
 	select SYS_HAS_CPU_NEVADA
 	select SYS_HAS_CPU_RM7000
 	select SYS_SUPPORTS_32BIT_KERNEL
-- 
2.2.1
