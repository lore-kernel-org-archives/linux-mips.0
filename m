Received: from mailapp01.imgtec.com ([195.59.15.196]:28361 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009918AbbGIJliUjSNh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 11:41:38 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id E7D50E5D474C
        for <linux-mips@linux-mips.org>; Thu,  9 Jul 2015 10:41:30 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 06/19] MIPS: asm: add CM GCR_L2_CONFIG register accessors
Date: Thu, 9 Jul 2015 10:40:40 +0100
Message-ID: <1436434853-30001-7-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150709094040.8f5jBCknzj2hGG3Rhjdtj7QY17J00cFVYEu2JpY0Dpo@z>

From: Paul Burton <paul.burton@imgtec.com>

Provide accessor functions for the GCR_L2_CONFIG register introduced
with CM3, and define the bits included in the register.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/mips-cm.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 29ff74a629f6..a832de2739ad 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -144,6 +144,7 @@ BUILD_CM_RW(reg3_base,		MIPS_CM_GCB_OFS + 0xc0)
 BUILD_CM_RW(reg3_mask,		MIPS_CM_GCB_OFS + 0xc8)
 BUILD_CM_R_(gic_status,		MIPS_CM_GCB_OFS + 0xd0)
 BUILD_CM_R_(cpc_status,		MIPS_CM_GCB_OFS + 0xf0)
+BUILD_CM_RW(l2_config,		MIPS_CM_GCB_OFS + 0x130)
 
 /* Core Local & Core Other register accessor functions */
 BUILD_CM_Cx_RW(reset_release,	0x00)
@@ -256,6 +257,16 @@ BUILD_CM_Cx_R_(tcid_8_priority,	0x80)
 #define CM_GCR_CPC_STATUS_EX_SHF		0
 #define CM_GCR_CPC_STATUS_EX_MSK		(_ULCAST_(0x1) << 0)
 
+/* GCR_L2_CONFIG register fields */
+#define CM_GCR_L2_CONFIG_BYPASS_SHF		20
+#define CM_GCR_L2_CONFIG_BYPASS_MSK		(_ULCAST_(0x1) << 20)
+#define CM_GCR_L2_CONFIG_SET_SIZE_SHF		12
+#define CM_GCR_L2_CONFIG_SET_SIZE_MSK		(_ULCAST_(0xf) << 12)
+#define CM_GCR_L2_CONFIG_LINE_SIZE_SHF		8
+#define CM_GCR_L2_CONFIG_LINE_SIZE_MSK		(_ULCAST_(0xf) << 8)
+#define CM_GCR_L2_CONFIG_ASSOC_SHF		0
+#define CM_GCR_L2_CONFIG_ASSOC_MSK		(_ULCAST_(0xff) << 0)
+
 /* GCR_Cx_COHERENCE register fields */
 #define CM_GCR_Cx_COHERENCE_COHDOMAINEN_SHF	0
 #define CM_GCR_Cx_COHERENCE_COHDOMAINEN_MSK	(_ULCAST_(0xff) << 0)
-- 
2.4.5
