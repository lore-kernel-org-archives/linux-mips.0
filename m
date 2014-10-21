Received: from mailapp01.imgtec.com ([195.59.15.196]:41578 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012026AbaJUMXX2vYtK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Oct 2014 14:23:23 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9936AAB09631E
        for <linux-mips@linux-mips.org>; Tue, 21 Oct 2014 13:23:14 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: lasat: Add missing CONFIG_PROC_FS dependency to PICVUE_PROC
Date: Tue, 21 Oct 2014 13:23:11 +0100
Message-ID: <1413894191-27148-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20141021122311._jUf1RbWF0097Xvl8KH1VfJQWj0s9F9SajW5kJqp0U4@z>

The picvue_proc.c file creates the /proc interface for the PICVUE LCD
display driver. As a result of which, it needs to depend on the PROC_FS
symbol to avoid build problems like the following one when
CONFIG_PROC_FS is not enabled.

arch/mips/lasat/picvue_proc.c:26:14: error: 'pvc_linename'
defined but not used [-Werror=unused-variable]
 static char *pvc_linename[PVC_NLINES] = {"line1", "line2"};
              ^

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/lasat/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/lasat/Kconfig b/arch/mips/lasat/Kconfig
index 1d2ee8a9be13..8776d0a34274 100644
--- a/arch/mips/lasat/Kconfig
+++ b/arch/mips/lasat/Kconfig
@@ -4,7 +4,7 @@ config PICVUE
 
 config PICVUE_PROC
 	tristate "PICVUE LCD display driver /proc interface"
-	depends on PICVUE
+	depends on PICVUE && PROC_FS
 
 config DS1603
 	bool "DS1603 RTC driver"
-- 
2.1.2
