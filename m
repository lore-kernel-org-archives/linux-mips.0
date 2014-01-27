Received: from multi.imgtec.com ([194.200.65.239]:43568 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827279AbaA0UVElSyGx (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:21:04 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 06/58] MIPS: uapi: inst: Add instruction format for SPECIAL3 instructions
Date: Mon, 27 Jan 2014 20:18:53 +0000
Message-ID: <1390853985-14246-7-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140127201853.d44yqU3_YizVrhbmJJHWbNnArZmNyeS9fnq8-ls4qeM@z>

From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index 9ce652e..1a44c5a 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -8,6 +8,7 @@
  * Copyright (C) 1996, 2000 by Ralf Baechle
  * Copyright (C) 2006 by Thiemo Seufer
  * Copyright (C) 2012 MIPS Technologies, Inc.  All rights reserved.
+ * Copyright (C) 2014 Imagination Technologies Ltd.
  */
 #ifndef _UAPI_ASM_INST_H
 #define _UAPI_ASM_INST_H
@@ -598,6 +599,15 @@ struct v_format {				/* MDMX vector format */
 	;)))))))
 };
 
+struct spec3_format {   /* SPEC3 */
+	BITFIELD_FIELD(unsigned int opcode:6,
+	BITFIELD_FIELD(unsigned int rs:5,
+	BITFIELD_FIELD(unsigned int rt:5,
+	BITFIELD_FIELD(signed int simmediate:9,
+	BITFIELD_FIELD(unsigned int func:7,
+	;)))))
+};
+
 /*
  * microMIPS instruction formats (32-bit length)
  *
@@ -869,6 +879,7 @@ union mips_instruction {
 	struct b_format b_format;
 	struct ps_format ps_format;
 	struct v_format v_format;
+	struct spec3_format spec3_format;
 	struct fb_format fb_format;
 	struct fp0_format fp0_format;
 	struct mm_fp0_format mm_fp0_format;
-- 
1.8.5.3
