Received: from mailapp01.imgtec.com ([195.59.15.196]:7357 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861346AbaGILstEu7et (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 9 Jul 2014 13:48:49 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E21262A22D1AB
        for <linux-mips@linux-mips.org>; Wed,  9 Jul 2014 12:48:39 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/5] MIPS: fix potential build failures using cpu_vpe_id on non-MT
Date: Wed, 9 Jul 2014 12:48:20 +0100
Message-ID: <1404906502-10702-4-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1404906502-10702-1-git-send-email-paul.burton@imgtec.com>
References: <1404906502-10702-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140709114820.-Fgy4DekFRcrE5XSw36hUMtlPDyRfoLj2Y7ak-YDhDw@z>

When used in a non-MT kernel, the cpu_vpe_id macro never made use of
its cpuinfo argument. It doesn't actually need to since it is returning
a constant 0. However not using the argument can lead to build failures
if the compiler then notices that a variable used as part of the
argument is unused. Prevent that problem by "using" the argument as far
as the compiler is concerned, whilst still returning 0 as before.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/cpu-info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index 47d5967..a28e3de 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -115,7 +115,7 @@ struct proc_cpuinfo_notifier_args {
 #ifdef CONFIG_MIPS_MT_SMP
 # define cpu_vpe_id(cpuinfo)	((cpuinfo)->vpe_id)
 #else
-# define cpu_vpe_id(cpuinfo)	0
+# define cpu_vpe_id(cpuinfo)	({ (void)cpuinfo; 0; })
 #endif
 
 #endif /* __ASM_CPU_INFO_H */
-- 
2.0.1
