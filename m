Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:29457 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6843081AbaD2Obwr9kKF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Apr 2014 16:31:52 +0200
From: Jayachandran C <jchandra@broadcom.com>
Subject: [PATCH 01/17] MIPS: Support upto 256 CPUs
Date: Tue, 29 Apr 2014 20:07:40 +0530
Message-ID: <21d3302d753ba9afae5040865abee8b0c1e699a9.1398780013.git.jchandra@broadcom.com>
In-Reply-To: <cover.1398780013.git.jchandra@broadcom.com>
References: <cover.1398780013.git.jchandra@broadcom.com>
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
Cc: Jayachandran C <jchandra@broadcom.com>, ralf@linux-mips.org
Message-ID: <20140429143740.8AlKWfG3K8eMsYU5KGGBbkILFOYmcZL9Bt9B4VveC3Y@z>

This is needed for two node XLP9xx configurations.

Signed-off-by: Jayachandran C <jchandra@broadcom.com>
---
 arch/mips/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a91f688..d0bcfce 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2297,8 +2297,8 @@ config NR_CPUS_DEFAULT_64
 	bool
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-64)"
-	range 2 64
+	int "Maximum number of CPUs (2-256)"
+	range 2 256
 	depends on SMP
 	default "4" if NR_CPUS_DEFAULT_4
 	default "8" if NR_CPUS_DEFAULT_8
-- 
1.7.9.5
