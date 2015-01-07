Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:25502 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010454AbbAGLVecywxU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Jan 2015 12:21:34 +0100
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 11/17] MIPS: Netlogic: Added HugeTLB as default
Date: Wed, 7 Jan 2015 16:58:32 +0530
Message-ID: <1420630118-17198-12-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <jchandra@broadcom.com>
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
Cc: Prem Mallappa <pmallapp@broadcom.com>, ralf@linux-mips.org, Jayachandran C <jchandra@broadcom.com>
Message-ID: <20150107112832._kf25OTUg3b36y4Gz5A2f3aawd951x_WazJyLg2hoO4@z>

From: Prem Mallappa <pmallapp@broadcom.com>

Enable CPU_SUPPORTS_HUGEPAGES for XLP processors.

Signed-off-by: Prem Mallappa <pmallapp@broadcom.com>
Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3289969..74a76da 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1532,6 +1532,7 @@ config CPU_XLP
 	select WEAK_REORDERING_BEYOND_LLSC
 	select CPU_HAS_PREFETCH
 	select CPU_MIPSR2
+	select CPU_SUPPORTS_HUGEPAGES
 	help
 	  Netlogic Microsystems XLP processors.
 endchoice
-- 
1.9.1
