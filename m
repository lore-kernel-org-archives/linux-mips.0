Received: from mailapp01.imgtec.com ([195.59.15.196]:13116 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990522AbcIBINzybcfm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Sep 2016 10:13:55 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: select HAVE_REGS_AND_STACK_ACCESS_API
Date: Fri, 2 Sep 2016 10:13:21 +0200
Message-ID: <1472804001-1060-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20160902081321.NfoDENV1qY3qZG4I0f2Uq_HDc3Uj31F1uSYg4JvMIVY@z>

All the required methods for HAVE_REGS_AND_STACK_ACCESS_API symbol have
been available in the MIPS tree since commit
40e084a506eb ('MIPS: Add uprobes support.'), but the required config symbol
had not been selected

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2638856..212ff92 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -65,6 +65,7 @@ config MIPS
 	select ARCH_CLOCKSOURCE_DATA
 	select HANDLE_DOMAIN_IRQ
 	select HAVE_EXIT_THREAD
+	select HAVE_REGS_AND_STACK_ACCESS_API
 
 menu "Machine selection"
 
-- 
2.7.4
