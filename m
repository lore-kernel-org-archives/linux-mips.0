Received: from multi.imgtec.com ([194.200.65.239]:9595 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827367AbaAOKiMAuAPN (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 15 Jan 2014 11:38:12 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 15/15] MIPS: deprecate CONFIG_MIPS_CMP
Date: Wed, 15 Jan 2014 10:32:00 +0000
Message-ID: <1389781920-31151-16-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1389781920-31151-1-git-send-email-paul.burton@imgtec.com>
References: <1389781920-31151-1-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140115103200.aWwnzFQ7SouTBjSeBAHNtNICMCNFBaDTYC5pEdF4-YI@z>

CONFIG_MIPS_CPS is a better option for systems where it is supported,
which as far as I am aware should be all systems where CONFIG_MIPS_CMP
could provide any value (ie. where there are multiple cores for YAMON to
bring up). This option is therefore deprecated, and marked as such. It
is left intact for the time being in order to provide a fallback should
someone find a system where CONFIG_MIPS_CPS will not function (ie. where
the reset vector cannot be moved), and should be removed entirely in the
future assuming that does not happen.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index bdf4012..5bc27c0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1980,7 +1980,7 @@ config MIPS_VPE_APSP_API_MT
 	depends on MIPS_VPE_APSP_API && !MIPS_CMP
 
 config MIPS_CMP
-	bool "MIPS CMP framework support"
+	bool "MIPS CMP framework support (DEPRECATED)"
 	depends on SYS_SUPPORTS_MIPS_CMP && !MIPS_MT_SMTC
 	select MIPS_GIC_IPI
 	select SYNC_R4K
@@ -1991,6 +1991,9 @@ config MIPS_CMP
 	  framework" protocol (ie. YAMON) and want your kernel to make use of
 	  its ability to start secondary CPUs.
 
+	  Unless you have a specific need, you should use CONFIG_MIPS_CPS
+	  instead of this.
+
 config MIPS_CPS
 	bool "MIPS Coherent Processing System support"
 	depends on SYS_SUPPORTS_MIPS_CPS
-- 
1.8.4.2
