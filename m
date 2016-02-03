Received: from mailapp01.imgtec.com ([195.59.15.196]:19374 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009881AbcBCDRgwddP0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 3 Feb 2016 04:17:36 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 05/15] MIPS: CM: Add CM GCR_BEV_BASE accessors
Date: Wed, 3 Feb 2016 03:15:25 +0000
Message-ID: <1454469335-14778-6-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
References: <1454469335-14778-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20160203031525.Yr9LYw7fIUWywIAnRyFIzTVRjhBkTprJ53XjSpFjvVs@z>

Generate accessor functions for the GCR_BEV_BASE register introduced by
CM3, for use by a later patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mips-cm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index b196825..1395bbc 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -208,6 +208,7 @@ BUILD_CM_RW(l2_config,		MIPS_CM_GCB_OFS + 0x130)
 BUILD_CM_RW(sys_config2,	MIPS_CM_GCB_OFS + 0x150)
 BUILD_CM_RW(l2_pft_control,	MIPS_CM_GCB_OFS + 0x300)
 BUILD_CM_RW(l2_pft_control_b,	MIPS_CM_GCB_OFS + 0x308)
+BUILD_CM_RW(bev_base,		MIPS_CM_GCB_OFS + 0x680)
 
 /* Core Local & Core Other register accessor functions */
 BUILD_CM_Cx_RW(reset_release,	0x00)
-- 
2.7.0
