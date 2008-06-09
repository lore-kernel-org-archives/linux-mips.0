Received: from mga11.intel.com ([192.55.52.93]:63881 "EHLO mga11.intel.com")
	by ftp.linux-mips.org with ESMTP id S20030705AbYFILQE convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 9 Jun 2008 12:16:04 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: [patch]modify the MIPS CPU classfication
Date: Mon, 9 Jun 2008 19:15:58 +0800
Message-ID: <42DFA526FC41B1429CE7279EF83C6BDC01404341@pdsmsx415.ccr.corp.intel.com>
From: "Chen, Huacai" <huacai.chen@intel.com>
Return-Path: <huacai.chen@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20080609111558.VgEJptfXrg8kmfHFs3Z4o55fRL71xDN_TfV0OYA7VHc@z>

The company ID of Loongson1/Loongson2 is PRID_COMP_LEGACY, but they were
classified in the list whoes company ID is  PRID_COMP_MIPS. This patch
move them to the right place.

Signed-off-by: Huacai Chen <huacai.chen@intel.com>

-----
diff --git a/include/asm-mips/cpu.h b/include/asm-mips/cpu.h
index 1c35cac..d3ffe93 100644
--- a/include/asm-mips/cpu.h
+++ b/include/asm-mips/cpu.h
@@ -68,6 +68,8 @@
 #define PRID_IMP_RM9000        0x3400
 #define PRID_IMP_R5432     0x5400
 #define PRID_IMP_R5500     0x5500
+#define PRID_IMP_LOONGSON1      0x4200
+#define PRID_IMP_LOONGSON2      0x6300

 #define PRID_IMP_UNKNOWN   0xff00

@@ -90,8 +92,6 @@
 #define PRID_IMP_24KE      0x9600
 #define PRID_IMP_74K       0x9700
 #define PRID_IMP_1004K     0x9900
-#define PRID_IMP_LOONGSON1      0x4200
-#define PRID_IMP_LOONGSON2      0x6300

 /*
  * These are the PRID's for when 23:16 == PRID_COMP_SIBYTE
-----
