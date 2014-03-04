Received: from mailapp01.imgtec.com ([195.89.28.114]:44131 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6823120AbaCDNfJaM1YR (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 4 Mar 2014 14:35:09 +0100
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E98DCF41E69D9
        for <linux-mips@linux-mips.org>; Tue,  4 Mar 2014 13:35:00 +0000 (GMT)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 1/3] MIPS: Add processor identifier for the M5150 processor
Date: Tue, 4 Mar 2014 13:34:42 +0000
Message-ID: <1393940084-29518-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1393940084-29518-1-git-send-email-markos.chandras@imgtec.com>
References: <1393940084-29518-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140304133442.dYEqk5C-LY-VT7izSvs8cN4VrPr245jLWEbkU7P6aGE@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index c12d997..1611132 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -115,6 +115,7 @@
 #define PRID_IMP_INTERAPTIV_MP	0xa100
 #define PRID_IMP_PROAPTIV_UP	0xa200
 #define PRID_IMP_PROAPTIV_MP	0xa300
+#define PRID_IMP_M5150		0xa700
 #define PRID_IMP_P5600		0xa800
 
 /*
-- 
1.9.0
