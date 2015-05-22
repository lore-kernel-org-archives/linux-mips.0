Received: from mailapp01.imgtec.com ([195.59.15.196]:47675 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006683AbbEVPwo10WYp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 17:52:44 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 02/15] MIPS: include errno.h for ENODEV in mips-cm.h
Date: Fri, 22 May 2015 16:51:01 +0100
Message-ID: <1432309875-9712-3-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20150522155101.2E3CoaHYr8CFrH0Zao-vFWg0YEHz4zWilWSTKVxdDI4@z>

A later patch in this series will include mips-cm.h but does not require
errno.h. This leads to a build failure with ENODEV undeclared. Include
errno.h from mips-cm.h to pull in the appropriate definition and avoid
the build failure.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mips-cm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 1cb11fb..edc7ee9 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -11,6 +11,7 @@
 #ifndef __MIPS_ASM_MIPS_CM_H__
 #define __MIPS_ASM_MIPS_CM_H__
 
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/types.h>
 
-- 
2.4.1
