Received: from mailapp01.imgtec.com ([195.59.15.196]:2046 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008780AbbIVSOlBQgMU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:14:41 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 07/10] MIPS: CM: fix GCR_Cx_CONFIG PVPE mask
Date: Tue, 22 Sep 2015 11:12:15 -0700
Message-ID: <1442945538-26141-8-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442945538-26141-1-git-send-email-paul.burton@imgtec.com>
References: <1442945538-26141-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922181215.8eCfrycvbTWnggeGj1ukXc_BZfz35aukJd1T6ucvZ_4@z>

The PVPE (or PVP in >= CM3) field is 10 bits wide, but the mask
previously only covered the bottom 9 bits. Extend the mask to cover all
10 bits of the field.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mips-cm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index d75b75e..2796424 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -324,7 +324,7 @@ BUILD_CM_Cx_R_(tcid_8_priority,	0x80)
 #define CM_GCR_Cx_CONFIG_IOCUTYPE_SHF		10
 #define CM_GCR_Cx_CONFIG_IOCUTYPE_MSK		(_ULCAST_(0x3) << 10)
 #define CM_GCR_Cx_CONFIG_PVPE_SHF		0
-#define CM_GCR_Cx_CONFIG_PVPE_MSK		(_ULCAST_(0x1ff) << 0)
+#define CM_GCR_Cx_CONFIG_PVPE_MSK		(_ULCAST_(0x3ff) << 0)
 
 /* GCR_Cx_OTHER register fields */
 #define CM_GCR_Cx_OTHER_CORENUM_SHF		16
-- 
2.5.3
