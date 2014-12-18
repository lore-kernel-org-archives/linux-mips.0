Received: from mailapp01.imgtec.com ([195.59.15.196]:38716 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009214AbaLRPNdOdDwA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 18 Dec 2014 16:13:33 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 727296A7CAAA5
        for <linux-mips@linux-mips.org>; Thu, 18 Dec 2014 15:13:24 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH RFC 62/67] MIPS: asm: mipsregs: Add support for the LLADDR register
Date: Thu, 18 Dec 2014 15:10:11 +0000
Message-ID: <1418915416-3196-63-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141218151011.offar8P2GFnQpECNIvwlbdLxM4Gl2k6-6aEhtC7akdg@z>

If Config5/LLB is set in the core, then software can write the LLB
bit in the LLADDR register.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/mipsregs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 8b27e17c1cad..1746a039a491 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1085,6 +1085,8 @@ do {									\
 #define write_c0_config6(val)	__write_32bit_c0_register($16, 6, val)
 #define write_c0_config7(val)	__write_32bit_c0_register($16, 7, val)
 
+#define read_c0_lladdr()	__read_ulong_c0_register($17, 0)
+#define write_c0_lladdr(val)	__write_ulong_c0_register($17, 0, val)
 #define read_c0_maar()		__read_ulong_c0_register($17, 1)
 #define write_c0_maar(val)	__write_ulong_c0_register($17, 1, val)
 #define read_c0_maari()		__read_32bit_c0_register($17, 2)
-- 
2.2.0
