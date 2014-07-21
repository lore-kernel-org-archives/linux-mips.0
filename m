Received: from mailapp01.imgtec.com ([195.59.15.196]:47799 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861533AbaGUNgVuBjEK (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Jul 2014 15:36:21 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9C2C18D221551
        for <linux-mips@linux-mips.org>; Mon, 21 Jul 2014 14:36:12 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 3/3] MIPS: CPS: Initialize EVA before bringing up VPEs from secondary cores
Date: Mon, 21 Jul 2014 14:35:56 +0100
Message-ID: <1405949756-10427-4-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405949756-10427-1-git-send-email-markos.chandras@imgtec.com>
References: <1405949756-10427-1-git-send-email-markos.chandras@imgtec.com>
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
Message-ID: <20140721133556.BajUGcL43kQrQ0MrkDeI43PSBFGGLnMakNJG4v6H0HM@z>

The CPS code is doing several memory loads when configuring the VPEs
from secondary cores, so the segmentation control registers must be
initialized in time otherwise the kernel will crash with strange
TLB exceptions.

Reviewed-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cps-vec.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 6f4f739dad96..e6e97d2a5c9e 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -13,6 +13,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/asmmacro.h>
 #include <asm/cacheops.h>
+#include <asm/eva.h>
 #include <asm/mipsregs.h>
 #include <asm/mipsmtregs.h>
 #include <asm/pm.h>
@@ -166,6 +167,9 @@ dcache_done:
 1:	jal	mips_cps_core_init
 	 nop
 
+	/* Do any EVA initialization if necessary */
+	eva_init
+
 	/*
 	 * Boot any other VPEs within this core that should be online, and
 	 * deactivate this VPE if it should be offline.
-- 
2.0.0
